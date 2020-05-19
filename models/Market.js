module.exports = function (sequelize, DataTypes) {
    const Market = sequelize.define("market", {
        id: {
            type: DataTypes.INTEGER, 
            allowNull: false,
            primaryKey: true
        },
        market_name: {
            type: DataTypes.STRING,
            allowNull: false
        }
    });

    Market.associate = function (models) {
        // Schedule.belongsToMany(models.user, {through: 'marketUsers'});
        Market.hasMany(models.schedule, {
            onDelete: "CASCADE",
            foreignKey: {
                allowNull: true
            }
        });
        Market.belongsToMany(models.user, { 
            through: 'userMarkets'
        })
    }

    return Market;
}