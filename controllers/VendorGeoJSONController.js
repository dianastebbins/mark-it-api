const express = require("express");
const router = express.Router();
const db = require("../models");

router.post("/api/vendorgeojson", function (req, res) {

    (console.log('server side'))
    console.log(req.body);

    db.vendorgeojson.create({vendorObj: req.body}).then(dbGeoJSON => res.json(dbGeoJSON));
});

router.get("/api/vendorgeojson", function (req, res) {
    db.vendorgeojson.findAll({}).then(dbGeoJSON => res.json(dbGeoJSON))
})

module.exports = router;