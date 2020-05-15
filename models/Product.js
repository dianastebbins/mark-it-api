module.exports = function (sequelize, DataTypes) {
    const Product = sequelize.define("product", {
        name: {
            type: DataTypes.STRING,
            allowNull: false
        },
        description: DataTypes.STRING,
        price: {
            type: DataTypes.FLOAT,
            allowNull: false
        },
        details: {
            type: DataTypes.STRING,
            allowNull: false
        },
        // image: {
        //     type: DataTypes.STRING
        // }
    });

    Product.associate = function (models) {
        Product.belongsTo(models.user, {
            foreignKey: {
                allowNull: false
            }
        });
        
    }

    return Product;
}