const express = require('express');
const BookService = require('../application/bookService.js');
const router = express.Router();

/**
 * @swagger
 * /books:
 *   get:
 *     summary: Get all books
 *     responses:
 *       200:
 *         description: An array of books
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   code:
 *                     type: string
 *                   title:
 *                     type: string
 *                   author:
 *                     type: string
 *                   stock:
 *                     type: integer
 */
router.get('/books', async (req, res) => {
    try {
        const books = await BookService.getAllBooks();
        res.json(books);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

/**
 * @swagger
 * /books/borrow:
 *   post:
 *     summary: Borrow a book
 *     parameters:
 *       - in: body
 *         name: borrow
 *         description: Borrow a book
 *         schema:
 *           type: object
 *           required:
 *             - memberCode
 *             - bookCode
 *           properties:
 *             memberCode:
 *               type: string
 *             bookCode:
 *               type: string
 *     responses:
 *       200:
 *         description: Book borrowed successfully
 */
router.post('/books/borrow', async (req, res) => {
    const { memberCode, bookCode } = req.body;
    try {
        await BookService.borrowBook(memberCode, bookCode);
        res.status(200).send('Book borrowed successfully');
    } catch (error) {
        res.status(400).send(error.message);
    }
});

/**
 * @swagger
 * /books/return:
 *   post:
 *     summary: Return a book
 *     parameters:
 *       - in: body
 *         name: return
 *         description: Return a book
 *         schema:
 *           type: object
 *           required:
 *             - memberCode
 *             - bookCode
 *           properties:
 *             memberCode:
 *               type: string
 *             bookCode:
 *               type: string
 *     responses:
 *       200:
 *         description: Book returned successfully
 */
router.post('/books/return', async (req, res) => {
    const { memberCode, bookCode, returnDate } = req.body;
    try {
        await BookService.returnBook(memberCode, bookCode, returnDate);
        res.json({ message: 'Book returned successfully' });
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = router;
