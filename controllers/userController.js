const express = require("express");
const router = express.Router();
const db = require("../models");
const bcrypt = require("bcrypt");


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
        bus_lic: req.body.bus_lic
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

// GET MARKETS BY USER ID
router.get("/api/users/:id/markets", function (req, res) {
    db.user
        .findAll({
            where: {
                userId: req.params.id
            },
            include: [db.market]
        })
        .then((dbEvent) => res.json(dbEvent));
});

// GET MARKET SCHEDULES BY USER ID
router.get("/api/users/:id/products", function (req, res) {
    db.user
        .findAll({
            where: {
                userId: req.params.id
            },
            include: [db.schedule, db.market]
        })
        .then((dbEvent) => res.json(dbEvent));
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
                //         // req.session.user = false;
                res.json("Username not found")
            } else if(bcrypt.compareSync(req.body.password, dbUser.password)){
                //         // req.session.user = {
                //         //     id: dbUser.id,
                //         //     username: dbUser.username
                //         // }
                //             // res.json(req.session)
                res.json("Logged in");
            }else {
                //         // req.session.user = false
                res.json("Username and password do not exist")
            }
        })
});













module.exports = router;