const request = require('supertest');
const app = require('../src/app');

describe('POST /api/books/return', () => {
    test('It should respond with 200 OK and success message when returning a book', async () => {
        const requestData = {
            memberCode: 'M001',
            bookCode: 'TW-11'
        };

        const response = await request(app)
            .post('/api/books/return')
            .send(requestData);

        expect(response.statusCode).toBe(200);
    });
});