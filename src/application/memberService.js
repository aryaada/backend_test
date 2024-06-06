const MemberModel = require('../infrastructure/models/member.js');
const BorrowModel = require('../infrastructure/models/borrow.js');
const BookModel = require('../infrastructure/models/book.js');
const PenaltyModel = require('../infrastructure/models/penalty.js');
const { Op } = require('sequelize');

class MemberService {
    static async getAllMembers() {
        const members = await MemberModel.findAll();
        const membersWithBorrowedBooks = [];

        for (const member of members) {
            const borrowedBooksCount = await BorrowModel.count({
                where: {
                    memberCode: member.code,
                    returnDate: {
                        [Op.is]: null
                    }
                }
            });

            membersWithBorrowedBooks.push({
                code: member.code,
                name: member.name,
                borrowedBooksCount
            });
        }

        return membersWithBorrowedBooks;
    }

    static async getMemberDetails(memberCode) {
        const member = await MemberModel.findOne({
            where: { code: memberCode },
            include: [
                {
                    model: BorrowModel,
                    include: [BookModel]
                },
                {
                    model: PenaltyModel,
                    where: {
                        penaltyEndDate: {
                            [Op.gt]: new Date()
                        }
                    },
                    required: false
                }
            ]
        });

        if (!member) {
            throw new Error('Member does not exist');
        }

        const memberDetails = {
            code: member.code,
            name: member.name,
            penalties: member.Penalties.map(penalty => ({
                penaltyEndDate: penalty.penaltyEndDate
            })),
            borrowedBooks: member.Borrows.map(borrow => ({
                code: borrow.bookCode,
                title: borrow.Book.title,
                author: borrow.Book.author,
                borrowDate: borrow.borrowDate,
                returnDate: borrow.returnDate
            }))
        };

        return memberDetails;
    }

    static async getMemberPenalties(memberCode) {
        const penalties = await PenaltyModel.findAll({
            where: {
                memberCode,
                penaltyEndDate: {
                    [Op.gt]: new Date()
                }
            }
        });

        return penalties.map(penalty => ({
            penaltyEndDate: penalty.penaltyEndDate
        }));
    }
}

module.exports = MemberService;
