const express = require("express");
const router = express.Router();
const db = require("../models");

// GET ALL MARKETS (JSON)
router.get("/api/markets", function (req, res) {
    db.market.findAll({
    }).then(dbMarket => res.json(dbMarket));
});

// POST NEW FAVORITE MARKET (USDA MARKET ID#)
router.post("/api/market", function (req, res) {
    // does this market already exist?
    db.market.findOne({
        where: {
            id: req.body.id,
        }
    }).then((dbExistingMarket) => {
        // LOGGED IN USER ID 
        const userID = req.session.user.id;

        // only save market if it did not already exist
        if(dbExistingMarket === null){
            db.market.create({
                id: req.body.id,
                market_name: req.body.market_name
            })
            // save the favorite status to new market
            .then((dbNewMarket) => {
                // CREATE ENTRY IN JUNCTION TABLE
                dbNewMarket.addUser(userID)
                res.json(dbNewMarket)
            })
        } else {
            // save the favorite status to existing market
            dbExistingMarket.addUser(userID)
            res.json(dbExistingMarket);
        }
    })
});

// DELETE MARKET (Vendor deletes event they previously created)
router.delete("/api/markets/:id", function (req, res) {
    db.market.destroy({
        where: { id: req.params.id}}).then(dbMarket => {
            res.json(dbMarket)
    })
    // any associated userMarkets...automatically deleted because of ON CASCADE
    // any associated schedules...automatically deleted because of ON CASCADE
});

module.exports = router;


