const express = require("express");
const router = express.Router();
const db = require("../models");
const bcrypt = require("bcrypt");

router.get("/profile", function (req, res) {
  if (req.session.user) {
    const data = {
      id: req.session.user.id,
      username: req.session.user.username,
    };

    db.Registration.findAll({
      where: {
        UserId: req.session.user.id,
      },
      //where the id is the session id
      // include the registration table
    }).then((results) => {
      const resultsAsJson = results.map((result) => result.toJSON());

      const register = { data: resultsAsJson };
      // console.log(register);
      // depending on what  it looks like, either just send it back or put it in an object for handlebars
      // replace data with the results or the handlebars object
      res.render("profile", register);
    });
  } else {
    res.redirect("/");
  }
});

router.get("/signup", function (req, res) {
  res.render("signup");
});

router.post("/signup", function (req, res) {
  db.User.create({
    username: req.body.username,
    password: req.body.password,
  })
    .then((newUser) => {
      // res.json(newUser)
      req.session.user = {
        username: newUser.username,
        id: newUser.id,
      };
      // res.send("logged in!")
      res.redirect("/profile");
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json(err);
    });
});

// router.get("/login", function (req, res) {
//     res.render("login");
// })

router.post("/login", function (req, res) {
  db.User.findOne({
    where: {
      username: req.body.username,
    },
  })
    .then((dbUser) => {
      if (bcrypt.compareSync(req.body.password, dbUser.password)) {
        if (dbUser.username === "vale@mail.com") {
          req.session.user = {
            username: dbUser.username,
            id: dbUser.id,
          };

          res.redirect("/managerprofile");
        } else {
          req.session.user = {
            username: dbUser.username,
            id: dbUser.id,
          };

          res.redirect("/profile");
        }
      } else {
        res.send("not logged in");
      }
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json(err);
    });
});

router.get("/readsessions", function (req, res) {
  res.json(req.session);
});

router.get("/logout", function (req, res) {
  req.session.destroy(function (err) {
    res.json("logged out");
  });
  res.redirect("/");
});

module.exports = router;
