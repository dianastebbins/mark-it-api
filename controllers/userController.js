const express = require("express");
const router = express.Router();
const db = require("../models");


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

// GET MARKETS FAVORITED BY BY USER ID
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

// GET MARKET SCHEDULES BY USER ID
router.get("/api/users/:id/markets/schedules", function (req, res) {
    db.user
        .findAll({
            where: {
                id: req.params.id
            },
            include: [db.schedule, db.market]
        })
        .then((dbEvent) => res.json(dbEvent));
});

// GET USER FAVORITE VENDERS BY USER ID
router.get("/api/users/:id/vendors", function(req,res) {
    db.user.findAll({
        where: {
            id: req.params.id
        },
        include: [{model: db.user, as: 'favorite'}],
    }).then(dbUserFavs => res.json(dbUserFavs))

})

// GET ALL INFO
router.get("/api/user/allinfo", function (req,res) {
    db.user.findAll({include: [db.product, db.market, db.schedule]})
    .then(dbAllInfo => res.json(dbAllInfo));
})

// GET ALL INFO BY USER ID
router.get("/api/users/:id/allinfo", function (req,res) {
    db.user.findAll({
        include: [db.product, db.market, db.schedule],
        where: {
            id: req.params.id
        }
    })
    .then(dbAllInfo => res.json(dbAllInfo));
})














module.exports = router;