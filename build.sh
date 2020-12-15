docker build . -t anjuls/wazuh-installer:1.0
docker push anjuls/wazuh-installer:1.0
kubectl apply -f k8s/