const sequelize = require('../database.js');
const Member = require('./member.js');
const Book = require('./book.js');
const Borrow = require('./borrow.js');
const Penalty = require('./penalty.js');

const syncDatabase = async () => {
    await sequelize.sync({ alter: true });
};

module.exports = {
    Member,
    Book,
    Borrow,
    Penalty,
    syncDatabase
};
