const express = require("express");
const router = express.Router();
const db = require("../models");
const bcrypt = require("bcrypt");
const { Op } = require("sequelize");


// GET ALL USERS (JSON)
router.get("/api/users", function (req, res) {
    db.user.findAll({
        // include: [db.collab]
    }).then(dbUser => res.json(dbUser));
});


// POST NEW USER
router.post("/api/users", function (req, res) {
    db.user.create({
        username: req.body.username,
        password: req.body.password,
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        email: req.body.email,
        vendor_name: req.body.vendor_name,
        vendor_email: req.body.vendor_email,
        vendor_phone: req.body.vendor_phone,
        bus_lic: req.body.bus_lic,
        favoriteId: req.body.userId
    }).then(dbCost => res.send(dbCost));
});

// TODO: FIXME: ADD FAVORITE VENDOR 
router.post("/api/users/:id/vendors", function (req, res) {
    // GET VENDOR ID FROM PAGE?
    const vendorId = req.body.vendor_id;
    db.user.create({
        where: {
            id: req.params.id
        }
    }).then((dbUserFavs) => {
        res.json(
            // ADD VENDOR TO 
            dbUserFavs.addUser(vendorId)
        )
    })
});

// REMOVE PREVIOUSLY FAVORITED VENDOR
router.put("/api/users/unfavor/vendor/:id", function (req, res) {
    // get the user and their vendor favorites
    db.user
        .findOne({
            where: {
                id: req.session.user.id,
            },
            include: [{ model: db.user, as: 'favorites' }] // cannot seem to use a where clause in here
        })
        .then((dbUsers) => {
            console.log(dbUsers)
            dbUsers.getFavorites({
                where: {
                    id: {[Op.ne]: req.params.id} // get all of the current favorite vendors EXCEPT the one to unassociate/req.params.id
                }
            })
            .then(newFavorites => {
                dbUsers.setFavorites(newFavorites) // reset the vendor list, minus the one to unassociate/req.params.id
                .then(dbRowsDeleted => {
                    res.json(dbRowsDeleted)
                });
            })
        })
});

// GET USER BY ID#
router.get("/api/users/:id", function (req, res) {
    db.user
        .findOne({
            where: {
                id: req.params.id,
            }
        })
        .then((dbEvent) => res.json(dbEvent));
});

// GET USER PRODUCTS BY USER ID
router.get("/api/users/:id/products", function (req, res) {
    db.user
        .findAll({
            where: {
                id: req.params.id
            },
            include: [db.product]
        })
        .then((dbEvent) => res.json(dbEvent));
});

// GET MARKETS FAVORITED BY USER ID
router.get("/api/users/:id/markets", function (req, res) {
    db.user
        .findAll({
            where: {
                id: req.params.id
            },
            include: [db.market]
        })
        .then((dbEvent) => res.json(dbEvent));
});

// REMOVE PREVIOUSLY FAVORITED MARKET
router.put("/api/users/unfavor/market/:id", function (req, res) {
    // get the user and their market favorites
    db.user
        .findOne({
            where: {
                id: req.session.user.id,
            },
            include: [db.market] // cannot seem to use a where clause in here
        })
        .then((dbUsers) => {
            dbUsers.getMarkets({
                where: {
                    id: {[Op.ne]: req.params.id} // get all of the current favorite markets EXCEPT the one to unassociate/req.params.id
                }
            })
            .then(newFavorites => {
                dbUsers.setMarkets(newFavorites) // reset the market list, minus the one to unassociate/req.params.id
                .then(dbRowsDeleted => {
                    res.json(dbRowsDeleted)
                });
            })
        })
});

// GET MARKET SCHEDULES BY USER ID
router.get("/api/users/:id/markets/schedules", function (req, res) {
    db.user
        .findAll({
            where: {
                id: req.params.id
            },
            include: [{model: db.schedule, include: [db.market]}]
        })
        .then((dbEvent) => res.json(dbEvent));
});

// GET USER FAVORITE VENDORS BY USER ID
router.get("/api/users/:id/vendors", function (req, res) {
    db.user.findAll({
        where: {
            id: req.params.id
        },
        include: [{ model: db.user, as: 'favorites' }],
    }).then(dbUserFavs => res.json(dbUserFavs))
})

// GET ALL INFO
router.get("/api/user/allinfo", function (req, res) {
    db.user.findAll({ include: [db.product, db.market, db.schedule, { model: db.user, as: 'favorites' }] })
        .then(dbAllInfo => res.json(dbAllInfo));
})

// GET ALL INFO BY USER ID
router.get("/api/users/:id/allinfo", function (req, res) {
    db.user.findAll({
        include: [db.product, db.market, db.schedule, { model: db.user, as: 'favorites' }],
        where: {
            id: req.params.id
        }
    })
        .then(dbAllInfo => res.json(dbAllInfo));
})


router.get("/readsessions", (req, res) => {
    res.json(req.session)
});


router.get("/logout",(req,res)=>{
    req.session.destroy();
    res.json("User logged out")
});


router.post("/login", (req, res) => {
    db.user
        .findOne({
            where: {
                username: req.body.username
            }
        })
        .then((dbUser) => { 
            // check username/password combination
            if(!dbUser){
                req.session.user = false;
                res.json("Username not found")
            } else if(bcrypt.compareSync(req.body.password, dbUser.password)){
                req.session.user = {
                    id: dbUser.id,
                    username: dbUser.username
                }
                // res.json("Logged in");
                res.json(req.session)
            }else {
                req.session.user = false
                res.json("Username and password do not exist")
            }
        }).catch(err => {
            req.session.user = false;
            res.status(500);
        })
});

module.exports = router;