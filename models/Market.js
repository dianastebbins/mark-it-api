module.exports = function (sequelize, DataTypes) {
    const Market = sequelize.define("market", {
        market_id: {
            type: DataTypes.STRING, // format for DATETIME: YYYY-MM-DD hh:mm:ss
            allowNull: false
        }
    });

    // Market.associate = function (models) {
    //     // Schedule.belongsToMany(models.user, {through: 'marketUsers'});
    //     Market.hasMany(models.schedule, {
    //         onDelete: "CASCADE",
    //         foreignKey: {
    //             allowNull: true
    //         }
    //     });
    // }

    return Market;
}