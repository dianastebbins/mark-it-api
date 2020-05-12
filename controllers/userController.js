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















module.exports = router;