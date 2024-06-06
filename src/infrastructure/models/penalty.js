const { DataTypes } = require('sequelize');
const sequelize = require('../database.js');
const Member = require('./member.js');

const Penalty = sequelize.define('Penalty', {
    memberCode: {
        type: DataTypes.STRING,
        references: {
            model: Member,
            key: 'code',
        }
    },
    penaltyEndDate: {
        type: DataTypes.DATE,
        allowNull: false,
    }
});

Member.hasMany(Penalty, { foreignKey: 'memberCode' });
Penalty.belongsTo(Member, { foreignKey: 'memberCode' });

module.exports = Penalty;
