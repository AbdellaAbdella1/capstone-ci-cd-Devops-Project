#!/bin/bash
echo "í´ OESON CAPSTONE - COMPLETE VERIFICATION"
echo "=========================================="

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}1. âœ… Microservice Status:${NC}"
kubectl get pods -n microservices
echo ""

echo -e "${BLUE}2. âœ… Monitoring Stack Status:${NC}"
kubectl get pods -n monitoring
echo ""

echo -e "${BLUE}3. âœ… Services Overview:${NC}"
echo "Microservices Namespace:"
kubectl get svc -n microservices
echo ""
echo "Monitoring Namespace:"
kubectl get svc -n monitoring
echo ""

echo -e "${BLUE}4. âœ… Network Information:${NC}"
MINIKUBE_IP=$(minikube ip)
echo "Minikube IP: $MINIKUBE_IP"
echo ""

echo -e "${GREEN}í¼ ACCESS URLs:${NC}"
echo "Microservice:     http://$MINIKUBE_IP:30000"
echo "Health Check:     http://$MINIKUBE_IP:30000/health"
echo "Prometheus:       http://$MINIKUBE_IP:30090"
echo "Grafana:          http://$MINIKUBE_IP:30300 (admin/admin123)"
echo ""

echo -e "${BLUE}5. âœ… Quick Health Test:${NC}"
curl -s http://$MINIKUBE_IP:30000/health | jq . 2>/dev/null || curl -s http://$MINIKUBE_IP:30000/health
echo ""

echo -e "${GREEN}í¾‰ Verification Complete!${NC}"
