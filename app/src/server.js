const express = require('express');
const client = require('prom-client');

const app = express();
const port = 8080;

// Prometheus metrics
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics({ timeout: 5000 });

app.use(express.json());

app.get('/health', (req, res) => {
  res.status(200).json({ 
    status: 'OK', 
    timestamp: new Date().toISOString(),
    service: 'OESON Capstone Microservice'
  });
});

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType);
  res.end(await client.register.metrics());
});

app.get('/', (req, res) => {
  res.json({ 
    message: 'Welcome to OESON Capstone Microservice!',
    version: '1.0.0'
  });
});

app.listen(port, '0.0.0.0', () => {
  console.log(`🚀 Microservice running on port ${port}`);
});

module.exports = app;