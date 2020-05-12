// module.exports = function (sequelize, DataTypes) {
//     const Schedule = sequelize.define("schedule", {
//         open_time: {
//             type: DataTypes.DATE, // format for DATE: YYYY-MM-DD hh:mm:ss
//             allowNull: false
//         },
//         close_time: {
//             type: DataTypes.DATE, // format for DATE: YYYY-MM-DD hh:mm:ss
//             allowNull: false
//         }
//     });

//     Schedule.associate = function (models) {
//         Schedule.belongsToMany(models.user, {
//             foreignKey: {
//                 allowNull: false
//             }
//         });
//         Schedule.belongsTo(models.market)
//     }

//     return Schedule;
// }