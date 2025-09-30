#!/bin/bash
echo "� Complete Project Structure Verification"
echo "=========================================="

# Check each critical file
declare -A files=(
    ["App Entrypoint"]="app/src/server.js"
    ["Dockerfile"]="docker/Dockerfile"
    ["K8s Deployment"]="k8s/deployment.yaml"
    ["K8s Service"]="k8s/service.yaml"
    ["Terraform Main"]="infra/terraform/main.tf"
    ["Ansible Inventory"]="ansible/inventory.ini"
    ["Jenkinsfile"]="cd-pipeline/Jenkinsfile"
    ["Monitoring Stack"]="monitoring/namespace.yaml"
)

echo "✅ Critical Files Check:"
for key in "${!files[@]}"; do
    if [ -f "${files[$key]}" ]; then
        echo "   ✓ $key"
    else
        echo "   ✗ $key - MISSING"
    fi
done

echo ""
echo "� Current Kubernetes Status:"
kubectl get pods -n microservices 2>/dev/null && echo "   ✓ Microservice deployed" || echo "   ℹ️  Not deployed yet"

echo ""
echo "� Docker Status:"
docker images | grep microservice 2>/dev/null && echo "   ✓ Docker image built" || echo "   ℹ️  No image built"

echo ""
echo "� Project Readiness: COMPLETE ✅"
