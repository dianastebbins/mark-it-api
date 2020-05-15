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
        userId : req.session.user.id
    }).then(dbProduct => res.send(dbProduct));
});

router.put("/api/products/:id", function (req, res) {
    db.product.update({
        name: req.body.name,
        description: req.body.description,
        price: req.body.price,
        details: req.body.details,
        userId : req.session.user.id
    },
    {where: { id: req.params.id}}).then(dbProduct => {
        res.send(dbProduct)
    })
});




module.exports = router;