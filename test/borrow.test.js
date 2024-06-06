const request = require('supertest');
const app = require('../src/app');

describe('POST /api/books/borrow', () => {
    test('Response 200 ok', async () => {
        const requestData = {
            memberCode: 'M001',
            bookCode: 'TW-11'
        };

        const response = await request(app)
            .post('/api/books/borrow')
            .send(requestData);

        expect(response.statusCode).toBe(200);
    });
});
