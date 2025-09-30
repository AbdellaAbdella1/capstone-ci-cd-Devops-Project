const request = require('supertest');
const app = require('../src/server');

describe('Basic Microservice Tests', () => {
    test('Health endpoint should return 200', async () => {
        const response = await request(app).get('/health');
        expect(response.status).toBe(200);
        expect(response.body.status).toBe('OK');
    });

    test('Main endpoint should return welcome message', async () => {
        const response = await request(app).get('/');
        expect(response.status).toBe(200);
        expect(response.body.message).toContain('Welcome');
    });

    test('Metrics endpoint should return data', async () => {
        const response = await request(app).get('/metrics');
        expect(response.status).toBe(200);
        expect(response.text).toBeDefined();
    });
});
