#!/bin/bash
echo "íº€ COMPLETE CAPSTONE PROJECT DEPLOYMENT"
echo "======================================="

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}1. Initializing Kubernetes...${NC}"
./scripts/init-kubeconfig.sh

echo -e "${BLUE}2. Deploying Microservice...${NC}"
kubectl apply -f k8s/

echo -e "${BLUE}3. Deploying Monitoring Stack...${NC}"
kubectl apply -f monitoring/

echo -e "${BLUE}4. Waiting for deployments to be ready...${NC}"
kubectl wait --for=condition=ready pod -l app=microservice -n microservices --timeout=180s

echo -e "${BLUE}5. Displaying deployment status...${NC}"
echo ""
echo "í³Š MICROSERVICE NAMESPACE:"
kubectl get all -n microservices

echo ""
echo "í³ˆ MONITORING NAMESPACE:"
kubectl get all -n monitoring

echo ""
echo -e "${GREEN}í¾‰ DEPLOYMENT COMPLETED SUCCESSFULLY!${NC}"
echo ""
echo "ï¿½ï¿½ ACCESS URLs:"
echo "   Microservice:  http://$(minikube ip):30000"
echo "   Health Check:  http://$(minikube ip):30000/health"
echo "   Prometheus:    http://$(minikube ip):30090"
echo "   Grafana:       http://$(minikube ip):30300 (admin/admin123)"
echo ""
echo "í²¡ Quick test: curl http://$(minikube ip):30000/health"
