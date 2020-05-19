module.exports = function (sequelize, DataTypes) {

   
    const VendorGeoJSON = sequelize.define("vendorgeojson", {
        vendorObj: DataTypes.GEOMETRY
    });

    
        
   

    return VendorGeoJSON;
}