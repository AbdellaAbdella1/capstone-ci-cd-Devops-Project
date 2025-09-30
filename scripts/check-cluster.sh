#!/bin/bash
echo "í´ Kubernetes Cluster Health Check"
echo "=================================="

echo "1. Cluster Info:"
kubectl cluster-info

echo ""
echo "2. Node Status:"
kubectl get nodes -o wide

echo ""
echo "3. Pods Across All Namespaces:"
kubectl get pods --all-namespaces

echo ""
echo "4. Services:"
kubectl get services --all-namespaces

echo ""
echo "5. Resource Usage:"
kubectl top nodes 2>/dev/null || echo "Metrics server not installed"

echo ""
echo "âœ… Cluster health check completed"
