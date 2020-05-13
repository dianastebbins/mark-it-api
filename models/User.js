const bcrypt = require("bcrypt");

module.exports = function (sequelize, DataTypes) {
    var User = sequelize.define('user', {
        username: {
            type: DataTypes.STRING,
            unique: true,
            allowNull: false,
            validate: {
                len: [5]
            }
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                len: [8]
            }
        },
        first_name: {
            type: DataTypes.STRING,
            allowNull: false
        },
        last_name: {
            type: DataTypes.STRING,
            allowNull: false
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false
        },
        // ==========================
        // BEGIN OPTIONAL VENDOR INFO
        // ==========================
        vendor_name: {
            type: DataTypes.STRING,
            unique: true,
            allowNull: false,
            validate: {
                len: [5]
            }
        },
        vendor_email: {
            type: DataTypes.STRING
            // allowNull: false,
        },
        vendor_phone: {
            type: DataTypes.STRING
            // allowNull: false,
        },
        bus_lic: {
            type: DataTypes.STRING
            // allowNull: false,
        }
        // =============================================
        // IF WE WANT SEPARATE VENDOR ID, SEQUELIZE WILL
        // CREATE A UUID FOR US AUTOMATICALLY WITH THE
        // BELOW CODE
        // =============================================
        // vendor_id: {
        //     type: DataTypes.UUID,
        //     defaultValue: Sequelize.UUIDV4 // Or Sequelize.UUIDV1
        // }
    });
    User.associate = function (models) {
        User.hasMany(models.product, {
            onDelete: "CASCADE",
            foreignKey: {
                allowNull: true
            }
        });
        User.hasMany(models.schedule, {
            onDelete: "CASCADE",
            foreignKey: {
                allowNull: true
            }
        });
        // User.belongsToMany(models.user,{
        //     through: "userFavorites",
        //     as: "favorites",
        //     foreignKey: "favoriteId"
        // });

        User.belongsToMany(models.user, { 
            as: 'favorite',
            through: "userfavorites" 
        });
        // User.hasMany(models.user, {
        //     // as: 'favorite',
        //     through: "userfavorites",
        //     foreignKey: 'favoriteId', 
        // })

        User.belongsToMany(models.market, { through: 'userMarkets' });
        
        // encrypt password before saving it
        User.beforeCreate(function(user) {
            user.password = bcrypt.hashSync(user.password, bcrypt.genSaltSync(10), null);
        });
    };




    return User;
};