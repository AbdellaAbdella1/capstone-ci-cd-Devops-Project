#!/bin/bash
echo "Ì¥ç Diagnosing Microservice Issues"

echo "1. Checking pod status..."
kubectl get pods -n microservices

echo ""
echo "2. Checking pod logs..."
kubectl logs -n microservices -l app=microservice --tail=15

echo ""
echo "3. Checking service configuration..."
kubectl describe service microservice-service -n microservices

echo ""
echo "4. Checking endpoints..."
kubectl get endpoints -n microservices

echo ""
echo "5. Checking recent events..."
kubectl get events -n microservices --field-selector reason=Failed --sort-by='.lastTimestamp'

echo ""
echo "6. Testing internal service access..."
kubectl run test-pod --image=busybox --rm -it --restart=Never -- sh -c "wget -q -O- http://microservice-service.microservices.svc.cluster.local:8080/health || echo 'Internal access failed'"
