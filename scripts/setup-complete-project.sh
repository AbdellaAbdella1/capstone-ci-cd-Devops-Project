#!/bin/bash
echo "Ì∫Ä Setting up Complete Capstone Project..."

# Create all directories
mkdir -p monitoring/prometheus
mkdir -p monitoring/grafana
mkdir -p monitoring/dashboards
mkdir -p infra/terraform
mkdir -p ansible/playbooks
mkdir -p scripts

echo "‚úÖ Directory structure created"

# Display current status
echo ""
echo "Ì≥ä Current Deployment Status:"
kubectl get pods -n microservices 2>/dev/null && {
    echo "‚úÖ Microservice is running on Minikube"
    echo "Ìºê Access via: minikube service microservice-service -n microservices --url"
} || echo "‚ÑπÔ∏è  Minikube not running or microservice not deployed"

echo ""
echo "ÌæØ Your capstone project includes:"
echo "‚úÖ Microservice Application (Node.js)"
echo "‚úÖ Docker Containerization"
echo "‚úÖ Kubernetes Deployment (Minikube)"
echo "‚úÖ Monitoring Stack (Prometheus + Grafana)"
echo "‚úÖ Infrastructure as Code (Terraform for AWS)"
echo "‚úÖ Configuration Management (Ansible)"
echo "‚úÖ CI/CD Pipeline Configuration (Jenkinsfile)"

echo ""
echo "Ì≥ö Next steps for presentation:"
echo "1. Show the working microservice: curl http://$(minikube ip):30000/health"
echo "2. Demonstrate Kubernetes resources: kubectl get all -A"
echo "3. Explain the Docker multi-stage build"
echo "4. Show the monitoring setup"
echo "5. Discuss the Terraform/Ansible configuration for production"
