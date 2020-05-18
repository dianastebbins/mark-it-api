const express = require('express');
const cors = require("cors");
const bcrypt = require("bcrypt");
const session = require("express-session");
var SequelizeStore = require('connect-session-sequelize')(session.Store);

// Sets up the Express App
// =============================================================
const app = express();
const PORT = process.env.PORT || 8080;
require("dotenv").config();

// Requiring our models for syncing
const db = require('./models');

// Sets up the Express app to handle data parsing
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(session(
    { 
      secret: process.env.SESSION_SECRET, 
      store: new SequelizeStore({
        db:db.sequelize
      }),
      resave: false, 
      saveUninitialized: false,
      cookie : {
        maxAge:2*60*60*1000
      }
    }));

    // when running locally
// USE THIS CONFIG WHEN RUNNING LOCALLY
app.use(cors({
    origin:["http://localhost:3000"],
    credentials: true
}));
// USE THIS CONFIG WHEN DEPLOYING TO HEROKU
// app.use(cors({
//   origin:["https://awesome-mark-it.herokuapp.com"],
//   credentials: true
// }));

// the deployed configuration at heroku
// app.use(cors({
//     origin:["https://awesome-mark-it.herokuapp.com/"]
// }));

// Static directory
// app.use(express.static('public'));

const userRoutes = require("./controllers/userController");
const marketRoutes = require("./controllers/marketController");
const productRoutes = require("./controllers/productController");
const scheduleRoutes = require("./controllers/scheduleController");

app.use(userRoutes);
app.use(marketRoutes);
app.use(productRoutes);
app.use(scheduleRoutes);

db.sequelize.sync({ force: false }).then(function() {
    app.listen(PORT, function() {
    console.log('App listening on PORT ' + PORT);
    });
});