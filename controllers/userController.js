const express = require("express");
const router = express.Router();
const db = require("../models");


// GET ALL USERS (JSON)
router.get("/api/users", function (req, res) {
    db.User.findAll({
        // include: [db.collab]
    }).then(dbUser => res.json(dbUser));
});


// POST NEW USER
router.post("/api/users", function (req, res) {
    db.User.create({
        usernamename: req.body.username,
        password: req.body.password,
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        email: req.body.email,
        vendor_email: req.body.vendor_email,
        vendor_phone: req.body.vendor_phone,
        bus_lic: req.body.bus_lic
    }).then(dbCost => res.send(dbCost));
});

// GET USER BY ID#
router.get("/api/users/:id", function (req, res) {
    db.User
      .findOne({
        where: {
          id: req.params.id,
        }
    })
      .then((dbEvent) => res.json(dbEvent));
  });















module.exports = router;