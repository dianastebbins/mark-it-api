const express = require('express');
const cors = require("cors");
const bcrypt = require("bcrypt");
const session = require("express-session");
var SequelizeStore = require('connect-session-sequelize')(session.Store);

// Sets up the Express App
// =============================================================
const app = express();
const PORT = process.env.PORT || 8080;

// Requiring our models for syncing
const db = require('./models');

// Sets up the Express app to handle data parsing
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// TODO: replace with       secret: process.env.SESSION_SECRET,     
app.use(session(
    { 
      secret: "banana pudding", 
      store: new SequelizeStore({
        db:db.sequelize
      }),
      resave: false, 
      saveUninitialized: false,
      cookie : {
        maxAge:2*60*60*1000
      }
    }));

app.use(cors({
    origin:["http://localhost:3000"]
}));
// app.use(cors({
//     origin:["https://joes-baseball-frontend.herokuapp.com"]
// }));

// Static directory
// app.use(express.static('public'));

// var exphbs = require('express-handlebars');
// app.engine('handlebars', exphbs({ defaultLayout: 'main' }));
// app.set('view engine', 'handlebars');

// app.use('/',allRoutes); // from joe's example, commented out even there

const userRoutes = require("./controllers/userController");
const productRoutes = require("./controllers/productController");
const marketRoutes = require('./controllers/marketController')
// const htmlRoutes = require("./controllers/htmlController");

app.use(userRoutes);
app.use(productRoutes);
// app.use(htmlRoutes);

// // example to automatically "prepend" the specific url path api/volunteer/info
// const volunteerInfoApiRoutes = require("./controllers/volunteerInfoController");
// app.use("/api/volunteer/info", volunteerInfoApiRoutes);

// const playerRoutes = require("./controllers/playerController");
// app.use(playerRoutes);

db.sequelize.sync({ force: false }).then(function() {
    app.listen(PORT, function() {
    console.log('App listening on PORT ' + PORT);
    });
});