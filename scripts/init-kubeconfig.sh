#!/bin/bash
echo "í´§ Initializing Kubernetes Configuration"

# Set current context to minikube
kubectl config use-context minikube

# Verify connection
kubectl cluster-info

# Create namespaces if they don't exist
kubectl get namespace monitoring >/dev/null 2>&1 || kubectl create namespace monitoring
kubectl get namespace microservices >/dev/null 2>&1 || kubectl create namespace microservices

echo "âœ… Kubernetes configuration initialized"
echo "í³Š Namespaces:"
kubectl get namespaces
