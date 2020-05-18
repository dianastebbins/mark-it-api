const express = require("express");
const router = express.Router();
const db = require("../models");


// GET ALL SCHEDULES (JSON)
router.get("/api/schedules", function (req, res) {
    db.schedule.findAll({})
    .then(dbSchedules => res.json(dbSchedules));
});


// POST NEW SCHEDULE FOR MARKET
router.post("/api/schedules", function (req, res) {
    db.schedule.create({
        open_time: req.body.open_time,
        close_time: req.body.close_time,
        marketId: req.body.marketId, // CAPTURED FROM CLICK? BUTTON ON MARKET PAGE TO ADD SCHEDULE?

        // CHANGE TO userId: req.session.user.id BELOW  
        // TO INSERT LOGGED IN USER FOR THIS TABLE
        userId : req.session.user.id // format for DATE: YYYY-MM-DD hh:mm:ss
    }).then(dbSchedule => res.send(dbSchedule));
});

// DELETE SCHEDULE (Vendor deletes event they previously scheduled at)
router.delete("/api/schedules/:id", function (req, res) {
    db.schedule.destroy({
        where: { id: req.params.id}}).then(dbSchedule => {
            res.json(dbSchedule)
    })
});

// TODO: API to update schedule, but body of product...unusable as-is
// router.put("/api/schedules/:id", function (req, res) {
//     db.product.update({
//         name: req.body.name,
//         description: req.body.description,
//         price: req.body.price,
//         details: req.body.details,
//         userId : req.session.user.id
//     },
//     {where: { id: req.params.id }}).then(dbProduct => {
//         res.send(dbProduct)
//     })
// });


module.exports = router;