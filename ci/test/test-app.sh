#!/bin/bash
NODE_EXTERNAL_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="ExternalIP")].address}')
# Get the NodePort of the frontend service
FRONTEND_NODE_PORT=$(kubectl get service frontend -o jsonpath='{.spec.ports[0].nodePort}')
APP_URL="http://$NODE_EXTERNAL_IP:$FRONTEND_NODE_PORT/api/all"
EXPECTED_RESP="200"

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
echo $NODE_EXTERNAL_IP
echo $FRONTEND_NODE_PORT
echo $RESPONSE
if [[ "$RESPONSE" == "$EXPECTED_RESP" ]]; then
    echo "Test passed: Application is running"
    exit 0
else
    echo "Test failed: Application returned $RESPONSE."
    exit 1
fi
