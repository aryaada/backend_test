const { DataTypes } = require('sequelize');
const sequelize = require('../database.js');
const Member = require('./member.js');
const Book = require('./book.js');

const Borrow = sequelize.define('Borrow', {
    memberCode: {
        type: DataTypes.STRING,
        references: {
            model: Member,
            key: 'code',
        }
    },
    bookCode: {
        type: DataTypes.STRING,
        references: {
            model: Book,
            key: 'code',
        }
    },
    borrowDate: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
    },
    returnDate: {
        type: DataTypes.DATE,
        allowNull: true,
    }
});

Member.hasMany(Borrow, { foreignKey: 'memberCode' });
Book.hasMany(Borrow, { foreignKey: 'bookCode' });
Borrow.belongsTo(Member, { foreignKey: 'memberCode' });
Borrow.belongsTo(Book, { foreignKey: 'bookCode' });

module.exports = Borrow;
