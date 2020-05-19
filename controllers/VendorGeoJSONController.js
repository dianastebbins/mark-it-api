const express = require("express");
const router = express.Router();
const db = require("../models");

router.post("/api/vendorgeojson", function (req, res) {


    console.log(req.body);

    // db.product.create(req.body).then(dbProduct => res.send(dbProduct));
});

module.exports = router;