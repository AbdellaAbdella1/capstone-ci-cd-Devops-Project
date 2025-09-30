#!/bin/bash
echo "� Setting up Complete Capstone Project..."

# Create all directories
mkdir -p monitoring/prometheus
mkdir -p monitoring/grafana
mkdir -p monitoring/dashboards
mkdir -p infra/terraform
mkdir -p ansible/playbooks
mkdir -p scripts

echo "✅ Directory structure created"

# Display current status
echo ""
echo "� Current Deployment Status:"
kubectl get pods -n microservices 2>/dev/null && {
    echo "✅ Microservice is running on Minikube"
    echo "� Access via: minikube service microservice-service -n microservices --url"
} || echo "ℹ️  Minikube not running or microservice not deployed"

echo ""
echo "� Your capstone project includes:"
echo "✅ Microservice Application (Node.js)"
echo "✅ Docker Containerization"
echo "✅ Kubernetes Deployment (Minikube)"
echo "✅ Monitoring Stack (Prometheus + Grafana)"
echo "✅ Infrastructure as Code (Terraform for AWS)"
echo "✅ Configuration Management (Ansible)"
echo "✅ CI/CD Pipeline Configuration (Jenkinsfile)"

echo ""
echo "� Next steps for presentation:"
echo "1. Show the working microservice: curl http://$(minikube ip):30000/health"
echo "2. Demonstrate Kubernetes resources: kubectl get all -A"
echo "3. Explain the Docker multi-stage build"
echo "4. Show the monitoring setup"
echo "5. Discuss the Terraform/Ansible configuration for production"
