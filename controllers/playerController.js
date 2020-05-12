// const express = require("express");
// const router = express.Router();
// const db = require("../models");

// router.get("/",(req,res)=>{
//     res.send("welcome to my api!")
// })

// router.get("/api/players",(req,res)=>{
//     db.Player.findAll().then(players=>{
//         res.json(players)
//     })
// })

// router.post("/api/players",(req,res)=>{
//     db.Player.create(req.body).then(player=>{
//         res.json(player)
//     })
// })

// router.get("/api/players/:id",(req,res)=>{
//     db.Player.findOne({
//         where:{
//             id:req.params.id
//         }
//     }).then(player=>{
//         res.json(player)
//     })
// })

// router.put("/api/players/:id",(req,res)=>{
//     db.Player.update(
//         req.body,
//         {
//             where:{
//                 id:req.params.id
//             }
//         }
//     ).then(playerData=>{
//         res.json(playerData);
//     })
// })

// router.delete("/api/players/:id",(req,res)=>{
//     db.Player.destroy({
//         where:{
//             id:req.params.id
//         }
//     }).then(data=>{
//         res.json(data)
//     })
// })

// module.exports = router;
