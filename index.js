var express = require('express');
const cors = require("cors");
// Sets up the Express App
// =============================================================
var app = express();
var PORT = process.env.PORT || 8080;
// var allRoutes = require('./controllers');

// Requiring our models for syncing
var db = require('./models');

// Sets up the Express app to handle data parsing
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
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

// const userRoutes = require("./controllers/userController");
// const htmlRoutes = require("./controllers/htmlController");

// app.use(userRoutes);
// app.use(htmlRoutes);

// // example to automatically "prepend" the specific url path api/volunteer/info
// const volunteerInfoApiRoutes = require("./controllers/volunteerInfoController");
// app.use("/api/volunteer/info", volunteerInfoApiRoutes);

const playerRoutes = require("./controllers/playerController");
app.use(playerRoutes);

db.sequelize.sync({ force: false }).then(function() {
    app.listen(PORT, function() {
    console.log('App listening on PORT ' + PORT);
    });
});