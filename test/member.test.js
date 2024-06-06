const request = require('supertest');
const app = require('../src/app');

describe('GET /api/members', () => {
    test('Response 200 ok', async () => {
        const response = await request(app).get('/api/members');
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(expect.any(Array));
        expect(response.body.length).toBeGreaterThan(0);
    });
});
