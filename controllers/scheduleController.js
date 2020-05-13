const express = require("express");
const router = express.Router();
const db = require("../models");


// GET ALL SCHEDULES (JSON)
router.get("/api/schedules", function (req, res) {
    db.product.findAll({})
    .then(dbProducts => res.json(dbProducts));
});


// POST NEW SCHEDULE FOR MARKET
router.post("/api/schedules", function (req, res) {
    db.product.create({
        open_time: req.body.open_time,
        close_time: req.body.close_time,
        marketId: req.body.marketId, // CAPTURED FROM CLICK? BUTTON ON MARKET PAGE TO ADD SCHEDULE?

        // CHANGE TO userId: req.session.user.id BELOW  
        // TO INSERT LOGGED IN USER FOR THIS TABLE
        userId : req.body.userId // format for DATE: YYYY-MM-DD hh:mm:ss
    }).then(dbCost => res.send(dbCost));
});




module.exports = router;