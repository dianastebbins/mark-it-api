const bcrypt = require("bcrypt");

module.exports = function (sequelize, DataTypes) {
  var User = sequelize.define(
    "User",
    {
      username: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false,
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          len: [8],
        },
      },
      // add properties here
      // ex: name: DataTypes.STRING
    },
    { timestamps: false }
  );

  User.beforeCreate(function (user) {
    user.password = bcrypt.hashSync(
      user.password,
      bcrypt.genSaltSync(10),
      null
    );
  });
  // User.associate = function (models) {
  //   User.hasMany(models.Registration, { onDelete: "cascade" });
  // };

  return User;
};

// module.exports = function(sequelize, DataTypes) {
//   var Table_Name = sequelize.define('Player', {
//       name: DataTypes.STRING,
//       team: DataTypes.STRING,
//       at_bats: DataTypes.INTEGER,
//       singles: DataTypes.INTEGER,
//       doubles: DataTypes.INTEGER,
//       triples: DataTypes.INTEGER,
//       home_runs: DataTypes.INTEGER,
//       runs_batted_in: DataTypes.INTEGER
//   });

//   // Player.associate = function(models) {
//   //     // add associations here
//   //     // ex:Player.hasMany(models.BlogPost);
//   // };

//   return Player;
// };