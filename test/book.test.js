const request = require('supertest');
const app = require('../src/app');

describe('GET /api/books', () => {
    test('It should respond with JSON containing a list of members', async () => {
        const response = await request(app).get('/api/books');
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(expect.any(Array));
        expect(response.body.length).toBeGreaterThan(0);
    });
});