#!/bin/bash
echo "Ì¥ß DEPLOYING MONITORING STACK FIX"
echo "=================================="

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Function to check command success
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}‚úÖ $1${NC}"
    else
        echo -e "${RED}‚ùå $1 failed${NC}"
        exit 1
    fi
}

echo -e "${BLUE}1. Creating monitoring namespace...${NC}"
kubectl apply -f monitoring/namespace.yaml
check_success "Namespace created"

echo -e "${BLUE}2. Deploying Prometheus...${NC}"
kubectl apply -f monitoring/prometheus/config-map.yaml
kubectl apply -f monitoring/prometheus/deployment.yaml
kubectl apply -f monitoring/prometheus/service.yaml
check_success "Prometheus deployed"

echo -e "${BLUE}3. Deploying Grafana...${NC}"
kubectl apply -f monitoring/grafana/config-map.yaml
kubectl apply -f monitoring/grafana/deployment.yaml
kubectl apply -f monitoring/grafana/service.yaml
check_success "Grafana deployed"

echo -e "${BLUE}4. Waiting for pods to be ready...${NC}"
kubectl wait --for=condition=ready pod -l app=prometheus -n monitoring --timeout=180s
kubectl wait --for=condition=ready pod -l app=grafana -n monitoring --timeout=180s

echo -e "${BLUE}5. Displaying monitoring resources...${NC}"
kubectl get all -n monitoring

echo -e "${GREEN}Ìæâ Monitoring stack deployed successfully!${NC}"
