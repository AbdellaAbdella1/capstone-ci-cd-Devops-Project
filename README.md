<img width="800" alt="Architecture Diagram" src="https://github.com/user-attachments/assets/f0e4a0b0-e826-40e9-a043-1bb99109db68" />



# 🚀 DevOps Project OESON Capstone - End-to-End CI/CD on Kubernetes

![GitHub last commit](https://img.shields.io/github/last-commit/AbdellaAbdella1/capstone-ci-cd-Devops-Project)
![GitHub code size](https://img.shields.io/github/languages/code-size/AbdellaAbdella1/capstone-ci-cd-Devops-Project)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-red)

A complete enterprise-grade DevOps project demonstrating end-to-end CI/CD pipeline for microservices on Kubernetes with full monitoring, security, and infrastructure automation.

## 📖 Table of Contents
- [Architecture Overview](#-architecture-overview)
- [Project Structure](#-project-structure)
- [Technologies Used](#-technologies-used)
- [Features](#-features)
- [Quick Start](#-quick-start)
- [Detailed Setup](#-detailed-setup)
- [Monitoring](#-monitoring)
- [Security](#-security)

## 🏗️ Architecture Overview

### System Architecture
This project implements a complete cloud-native DevOps pipeline: 

Developer → Git → Jenkins → Docker → Kubernetes → Monitoring
↓ ↓ ↓ ↓ ↓ ↓
Code Version CI/CD Container Orchestration Observability
Commit Control Pipeline Images Cluster Stack                 


### Component Flow
1. **Development**: Node.js microservice with health checks and metrics
2. **Containerization**: Multi-stage Docker builds with security best practices
3. **Orchestration**: Kubernetes deployment with rolling updates
4. **Infrastructure**: Terraform-provisioned AWS cloud resources
5. **CI/CD**: Jenkins automated pipeline with 5 stages
6. **Monitoring**: Prometheus metrics collection + Grafana dashboards

## 📁 Project Structure

capstone-ci-cd-Devops-Project/
├── app/ # Node.js Microservice
│ ├── server.js # Express application
│ ├── package.json # Dependencies
│ └── tests/ # Unit tests
├── docker/ # Containerization
│ ├── Dockerfile # Multi-stage build
│ └── entrypoint.sh # Container entrypoint
├── k8s/ # Kubernetes Manifests
│ ├── deployment.yaml # App deployment
│ ├── service.yaml # Service definition
│ ├── configmap.yaml # Configuration
│ └── secret.yaml # Secrets management
├── infra/terraform/ # Infrastructure
│ ├── main.tf # AWS configuration
│ ├── variables.tf # Input variables
│ └── outputs.tf # Output values
├── ansible/playbooks/ # Configuration Management
│ ├── install-docker.yml
│ ├── install-k8s.yml
│ └── install-jenkins.yml
├── cd-pipeline/ # CI/CD
│ └── Jenkinsfile # Pipeline definition
├── monitoring/ # Observability
│ ├── prometheus/ # Metrics collection
│ ├── grafana/ # Dashboards
│ └── dashboards/ # Custom dashboards
└── scripts/ # Utilities
├── deploy-app.sh # Deployment script
└── check-cluster.sh # Cluster status


## 🛠️ Technologies Used

### Containerization & Orchestration
- **Docker** - Multi-stage container builds
- **Kubernetes** - Production container orchestration
- **Helm** - Kubernetes package management

### Cloud & Infrastructure
- **Terraform** - Infrastructure as Code (AWS)
- **AWS** - Cloud provider (EC2, VPC, Security Groups)
- **Ansible** - Configuration management

### CI/CD & Automation
- **Jenkins** - Continuous Integration and Delivery
- **Git** - Version control system

### Monitoring & Observability
- **Prometheus** - Metrics collection and alerting
- **Grafana** - Visualization and dashboards

<img width="926" height="442" alt="grafan 2" src="https://github.com/user-attachments/assets/25521acb-1b35-4b73-aa6d-d05938637d5a" />

<img width="943" height="476" alt="Grafana 3" src="https://github.com/user-attachments/assets/ffac917d-3215-48f3-9e91-482a2b7c5168" />

<img width="953" height="508" alt="Grafana 4" src="https://github.com/user-attachments/assets/30f11297-df64-479d-a1c1-483d307510ef" />

<img width="955" height="482" alt="grafana 1" src="https://github.com/user-attachments/assets/a4565759-bfc1-46fc-af91-8786b52c3556" />


### Security
- **Non-root containers** - Security best practices
- **Kubernetes Security Context** - Pod security policies
- **Resource limits** - CPU and memory constraints

## ✨ Features

### 🔄 Complete CI/CD Pipeline
- **5-stage Jenkins pipeline**: Checkout → Test → Build → Push → Deploy
- **Automated testing**: Unit tests integration
- **Docker image management**: Multi-stage builds with security
- **Kubernetes deployment**: Rolling updates with health checks

### 🏗️ Infrastructure as Code
- **Terraform modules**: Reusable infrastructure components
- **AWS provisioning**: VPC, EC2, security groups
- **Automated setup**: Complete environment provisioning

### 🔐 Security First
- **Non-root containers**: Reduced attack surface
- **Security contexts**: runAsNonRoot, readOnlyRootFilesystem
- **Resource limits**: CPU and memory constraints
- **Secrets management**: Secure credential handling

### 📊 Comprehensive Monitoring
- **Application metrics**: HTTP requests, response times
- **System metrics**: CPU, memory, disk usage
- **Custom dashboards**: Grafana visualization
- **Health monitoring**: Liveness and readiness probes

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Kubernetes cluster (Minikube, EKS, or similar)
- kubectl configured
- Terraform v1.0+
- Node.js 18+

### Local Development
```bash
# Clone the repository
git clone https://github.com/AbdellaAbdella1/capstone-ci-cd-Devops-Project.git
cd capstone-ci-cd-Devops-Project
# 🚀 OESON Capstone - End-to-End CI/CD on Kubernetes



## 🏗️ System Architecture

### End-to-End DevOps Pipeline
![System Architecture](https://github.com/AbdellaAbdella1/capstone-ci-cd-Devops-Project/raw/main/docs/architecture.png)

### CI/CD Automation Flow
![CI/CD Pipeline](https://github.com/AbdellaAbdella1/capstone-ci-cd-Devops-Project/raw/main/docs/cicd-pipeline.png)

### Kubernetes Cluster Architecture
![Kubernetes Deployment](https://github.com/AbdellaAbdella1/capstone-ci-cd-Devops-Project/raw/main/docs/kubernetes-architecture.png)

### Monitoring & Observability Stack
![Monitoring Architecture](https://github.com/AbdellaAbdella1/capstone-ci-cd-Devops-Project/raw/main/docs/monitoring-architecture.png)

# Run the application locally
cd app
npm install
npm start

# Test endpoints
curl http://localhost:8080/health
curl http://localhost:8080/metrics

# Build the Docker image
docker build -t yourusername/microservice-app:latest -f docker/Dockerfile .

# Test the container
docker run -p 8080:8080 yourusername/microservice-app:latest

# Deploy to Kubernetes
kubectl apply -f k8s/
kubectl apply -f monitoring/

# Check deployment status
kubectl get all -n microservices
kubectl get all -n monitoring

cd infra/terraform

# Initialize Terraform
terraform init

# Plan infrastructure changes
terraform plan

# Apply infrastructure
terraform apply -auto-approve

# Application health
curl http://<service-ip>:30000/health

# Readiness check
curl http://<service-ip>:30000/ready

# Metrics endpoint
curl http://<service-ip>:30000/metrics


🔒 Security
Container Security
Non-root user: Applications run as non-privileged user

Minimal base images: Alpine Linux for reduced attack surface

Read-only filesystems: Immutable container filesystems

Kubernetes Security
Security contexts: runAsNonRoot, readOnlyRootFilesystem

Network policies: Control pod-to-pod communication

Secret management: Encrypted secrets storage

🤝 Contributing
Fork the repository

Create a feature branch (git checkout -b feature/amazing-feature)

Commit your changes (git commit -m 'Add amazing feature')

Push to the branch (git push origin feature/amazing-feature)

Open a Pull Request

📄 License
This project is licensed under the MIT License.

👥 Author
Abdella - GitHub

🙏 Acknowledgments
OESON for the capstone project requirements

Kubernetes community for best practices

DevOps tools and open source communities

<div align="center">
⭐ If you find this project helpful, please give it a star!
https://img.shields.io/github/stars/AbdellaAbdella1/capstone-ci-cd-Devops-Project?style=social

Built with ❤️ using modern DevOps practices

</div> ```



