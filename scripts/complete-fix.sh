#!/bin/bash
echo "í´§ Complete Microservice Fix"

# Stop any port forwarding
pkill -f "port-forward"

# Delete everything and start fresh
echo "1. Cleaning up existing resources..."
kubectl delete -f k8s/ --ignore-not-found=true
kubectl delete pods -n microservices --all --force --grace-period=0

# Wait for cleanup
sleep 10

# Reapply all configurations
echo "2. Reapplying configurations..."
kubectl apply -f k8s/

# Wait for pods to start
echo "3. Waiting for pods to be ready..."
if kubectl wait --for=condition=ready pod -l app=microservice -n microservices --timeout=180s; then
    echo "âœ… Pods are ready!"
else
    echo "âŒ Pods failed to start. Checking logs..."
    kubectl logs -n microservices -l app=microservice --tail=20
    exit 1
fi

# Test internal cluster access first
echo "4. Testing internal cluster access..."
kubectl run test-access --image=curlimages/curl --rm -it --restart=Never -- \
    curl -s http://microservice-service.microservices:8080/health || echo "Internal test failed"

# Test NodePort access
echo "5. Testing external access..."
MINIKUBE_IP=$(minikube ip)
echo "Minikube IP: $MINIKUBE_IP"

if curl --connect-timeout 10 -s "http://$MINIKUBE_IP:30000/health" > /dev/null; then
    echo "âœ… NodePort access working!"
    curl -s "http://$MINIKUBE_IP:30000/health"
else
    echo "âš ï¸ NodePort not accessible, setting up port forwarding..."
    kubectl port-forward -n microservices svc/microservice-service 8080:80 &
    PF_PID=$!
    sleep 5
    
    if curl -s http://localhost:8080/health > /dev/null; then
        echo "âœ… Port forwarding access working!"
        curl -s http://localhost:8080/health
        kill $PF_PID
    else
        echo "âŒ All access methods failed"
        kill $PF_PID 2>/dev/null
        exit 1
    fi
fi

echo "í¾‰ Fix completed!"
