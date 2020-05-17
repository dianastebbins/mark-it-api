const express = require("express");
const router = express.Router();
const db = require("../models");


// GET ALL PRODUCTS (JSON)
router.get("/api/products", function (req, res) {
    db.product.findAll({})
    .then(dbProducts => res.json(dbProducts));
});

// GET PRODUCT BY ID
router.get("/api/products/:id", function (req, res) {
    db.product
        .findOne({
            where: {
                id: req.params.id,
            }
        })
        .then((dbEvent) => res.json(dbEvent));
});

// POST NEW PRODUCT
router.post("/api/products", function (req, res) {
    db.product.create({
        name: req.body.name,
        description: req.body.description,
        price: req.body.price,
        details: req.body.details,
        userId : req.session.user.id,
        image: req.body.image
    }).then(dbProduct => res.send(dbProduct));
});

router.put("/api/products/:id", function (req, res) {
    db.product.update({
        name: req.body.name,
        description: req.body.description,
        price: req.body.price,
        details: req.body.details,
        userId : req.session.user.id,
        image: req.body.image
    },
    {where: { id: req.params.id}}).then(dbProduct => {
        res.send(dbProduct)
    })
});

// DELETE PRODUCT GOES HERE


module.exports = router;