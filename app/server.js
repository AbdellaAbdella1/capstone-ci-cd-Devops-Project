const express = require('express');
const app = express();
const port = 8080;

app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({ 
    status: 'OK', 
    timestamp: new Date().toISOString(),
    service: 'OESON Capstone Microservice'
  });
});

// Readiness endpoint
app.get('/ready', (req, res) => {
  res.status(200).json({ 
    status: 'READY', 
    timestamp: new Date().toISOString() 
  });
});

// Main endpoint
app.get('/', (req, res) => {
  res.json({ 
    message: 'Hello from OESON Capstone Microservice!',
    version: '1.0.0',
    environment: process.env.APP_ENV || 'development',
    description: 'End-to-End CI/CD on Kubernetes'
  });
});

// Metrics endpoint for Prometheus
app.get('/metrics', (req, res) => {
  res.set('Content-Type', 'text/plain');
  res.send(`
# HELP http_requests_total Total HTTP requests
# TYPE http_requests_total counter
http_requests_total{method="get",handler="/"} 1
http_requests_total{method="get",handler="/health"} 1
http_requests_total{method="get",handler="/ready"} 1
# HELP microservice_info Microservice information
# TYPE microservice_info gauge
microservice_info{version="1.0.0",name="oeson-microservice"} 1
  `);
});

// Additional info endpoint
app.get('/info', (req, res) => {
  res.json({
    name: 'OESON Capstone Microservice',
    version: '1.0.0',
    description: 'A secure microservice for Kubernetes deployment',
    features: [
      'Health checks',
      'Metrics endpoint',
      'Secure non-root container',
      'Kubernetes ready'
    ]
  });
});

app.listen(port, '0.0.0.0', () => {
  console.log(`OESON Capstone Microservice running on port ${port}`);
  console.log(`Health check: http://localhost:${port}/health`);
  console.log(`Metrics: http://localhost:${port}/metrics`);
});
