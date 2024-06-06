const express = require('express');
const MemberService = require('../application/memberService.js');
const router = express.Router();

/**
 * @swagger
 * /members:
 *   get:
 *     summary: Get all members with their borrowed book counts
 *     responses:
 *       200:
 *         description: An array of members with their borrowed book counts
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   code:
 *                     type: string
 *                   name:
 *                     type: string
 *                   borrowedBooksCount:
 *                     type: integer
 */
router.get('/members', async (req, res) => {
    try {
        const members = await MemberService.getAllMembers();
        res.json(members);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

/**
 * @swagger
 * /members/{code}:
 *   get:
 *     summary: Retrieve a member's details
 *     parameters:
 *       - in: path
 *         name: code
 *         schema:
 *           type: string
 *         required: true
 *         description: Member code
 *     responses:
 *       200:
 *         description: Member details
 */
router.get('/members/:code', async (req, res) => {
    const { code } = req.params;
    try {
        const member = await MemberService.getMemberDetails(code);
        res.json(member);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

/**
 * @swagger
 * /members/{code}/penalties:
 *   get:
 *     summary: Get penalties for a member
 *     parameters:
 *       - in: path
 *         name: code
 *         required: true
 *         type: string
 *         description: Member code
 *     responses:
 *       200:
 *         description: Penalties retrieved successfully
 *         schema:
 *           $ref: '#/definitions/PenaltyResponse'
 *       400:
 *         description: Bad request
 */
router.get('/members/:code/penalties', async (req, res) => {
    const { code } = req.params;
    try {
        const penalties = await MemberService.getMemberPenalties(code);
        res.json({ penalties });
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = router;
