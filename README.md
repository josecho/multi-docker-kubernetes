# multi-docker-kubernetes

#create secret password
kubectl create secret generic pgpassword --from-literal PGPASSWORD=?????????

#Dashboard
minikube dashboard

# Pending

- Google Cloud account creation
- HTTPS Setup with Kubernetes

# Local environment cleanup

kubectl delete -f k8s/
minikube stop
minikube start
minikube delete # fully delete the cluster
docker ps
docker stop <container_id>
docker system prune #clearing the build cache
