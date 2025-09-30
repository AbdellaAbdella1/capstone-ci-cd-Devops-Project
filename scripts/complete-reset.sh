#!/bin/bash
echo "í´„ COMPLETE PROJECT RESET"
echo "========================"

echo "1. Deleting monitoring stack..."
kubectl delete -f monitoring/grafana/service.yaml 2>/dev/null
kubectl delete -f monitoring/grafana/deployment.yaml 2>/dev/null
kubectl delete -f monitoring/grafana/config-map.yaml 2>/dev/null
kubectl delete -f monitoring/prometheus/service.yaml 2>/dev/null
kubectl delete -f monitoring/prometheus/deployment.yaml 2>/dev/null
kubectl delete -f monitoring/prometheus/config-map.yaml 2>/dev/null
kubectl delete -f monitoring/namespace.yaml 2>/dev/null

echo "2. Deleting microservices..."
kubectl delete -f k8s/microservice-service.yaml 2>/dev/null
kubectl delete -f k8s/microservice-deployment.yaml 2>/dev/null
kubectl delete -f k8s/microservice-config.yaml 2>/dev/null
kubectl delete -f k8s/microservice-secrets.yaml 2>/dev/null
kubectl delete -f k8s/namespace.yaml 2>/dev/null

echo "3. Waiting for cleanup..."
sleep 10

echo "4. Redeploying everything..."
./scripts/deploy-complete.sh

echo "âœ… Reset complete!"
