const { DataTypes } = require('sequelize');
const sequelize = require('../database.js');

const Member = sequelize.define('Member', {
    code: {
        type: DataTypes.STRING,
        primaryKey: true,
    },
    name: DataTypes.STRING,
});

module.exports = Member;
