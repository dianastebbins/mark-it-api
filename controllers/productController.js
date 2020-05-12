const express = require("express");
const router = express.Router();
const db = require("../models");


// GET ALL PRODUCTS (JSON)
router.get("/api/products", function (req, res) {
    db.product.findAll({})
    .then(dbProducts => res.json(dbProducts));
});


// POST NEW PRODUCT
router.post("/api/products", function (req, res) {
    db.product.create({
        name: req.body.name,
        description: req.body.description,
        price: req.body.price,
        details: req.body.details,
        userId : req.body.userId
    }).then(dbCost => res.send(dbCost));
});




module.exports = router;