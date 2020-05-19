module.exports = function (sequelize, DataTypes) {

   
    const VendorGeoJSON = sequelize.define("vendorgeojson", {
        vendorObj: DataTypes.JSON
    });

    return VendorGeoJSON;
}