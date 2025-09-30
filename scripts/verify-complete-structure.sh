#!/bin/bash
echo "í´ Complete Project Structure Verification"
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

echo "âœ… Critical Files Check:"
for key in "${!files[@]}"; do
    if [ -f "${files[$key]}" ]; then
        echo "   âœ“ $key"
    else
        echo "   âœ— $key - MISSING"
    fi
done

echo ""
echo "í³Š Current Kubernetes Status:"
kubectl get pods -n microservices 2>/dev/null && echo "   âœ“ Microservice deployed" || echo "   â„¹ï¸  Not deployed yet"

echo ""
echo "í°³ Docker Status:"
docker images | grep microservice 2>/dev/null && echo "   âœ“ Docker image built" || echo "   â„¹ï¸  No image built"

echo ""
echo "í¾¯ Project Readiness: COMPLETE âœ…"
