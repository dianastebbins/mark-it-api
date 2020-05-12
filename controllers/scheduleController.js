const express = require("express");
const router = express.Router();
const db = require("../models");


// GET ALL PRODUCTS (JSON)
router.get("/api/schedules", function (req, res) {
    db.product.findAll({})
    .then(dbProducts => res.json(dbProducts));
});


// POST NEW PRODUCT
router.post("/api/schedules", function (req, res) {
    db.product.create({
        open_time: req.body.open_time,
        close_time: req.body.close_time,
        marketId: req.body.marketId,
        userId : req.body.userId // format for DATE: YYYY-MM-DD hh:mm:ss
    }).then(dbCost => res.send(dbCost));
});




module.exports = router;