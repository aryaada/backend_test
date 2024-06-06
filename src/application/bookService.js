const BookModel = require('../infrastructure/models/book.js');
const BorrowModel = require('../infrastructure/models/borrow.js');
const PenaltyModel = require('../infrastructure/models/penalty.js');
const { Op } = require('sequelize');

class BookService {
    static async getAllBooks() {
        const books = await BookModel.findAll({
            where: {
                stock: { [Op.gt]: 0 },
            },
            include: [
                {
                    model: BorrowModel,
                    where: {
                        returnDate: { [Op.is]: null }
                    },
                    required: false
                }
            ]
        });

        const availableBooks = books.filter(book => book.Borrows.length === 0);

        return availableBooks.map(book => ({
            code: book.code,
            title: book.title,
            author: book.author,
            stock: book.stock
        }));
    }


    static async borrowBook(memberCode, bookCode) {
        const memberPenalties = await PenaltyModel.findAll({
            where: {
                memberCode,
                penaltyEndDate: {
                    [Op.gt]: new Date()
                }
            }
        });

        if (memberPenalties.length > 0) {
            throw new Error('Member saat ini dikenakan penalty dan tidak dapat meminjam buku');
        }

        const activeBorrows = await BorrowModel.count({
            where: {
                memberCode,
                returnDate: {
                    [Op.is]: null
                }
            }
        });

        if (activeBorrows >= 2) {
            throw new Error('Member hanya dapat meminjam maksimal 2 buku');
        }

        const book = await BookModel.findOne({ where: { code: bookCode } });
        if (!book) {
            throw new Error('Buku tidak ada');
        }

        const existingBorrow = await BorrowModel.findOne({
            where: {
                bookCode,
                returnDate: {
                    [Op.is]: null
                }
            }
        });

        if (existingBorrow) {
            throw new Error('Buku sudah dipinjam oleh member lain');
        }

        await BorrowModel.create({ memberCode, bookCode });
    }

    static async returnBook(memberCode, bookCode, returnDate = new Date()) {
        const borrow = await BorrowModel.findOne({
            where: {
                memberCode,
                bookCode,
                returnDate: {
                    [Op.is]: null
                }
            }
        });

        if (!borrow) {
            throw new Error('Buku ini tidak dipinjam oleh member ini');
        }

        borrow.returnDate = returnDate;
        await borrow.save();

        const diffTime = Math.abs(new Date(returnDate) - new Date(borrow.borrowDate));
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        if (diffDays > 7) {
            const penaltyEndDate = new Date(returnDate);
            penaltyEndDate.setDate(penaltyEndDate.getDate() + 3);

            await PenaltyModel.create({
                memberCode,
                penaltyEndDate
            });
        }
    }
}

module.exports = BookService;
