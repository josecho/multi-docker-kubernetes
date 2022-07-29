docker build -t josecho/multi-client:latest -t josecho/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t josecho/multi-server:latest -t josecho/multi-server:$SHA-f ./server/Dockerfile ./server
docker build -t josecho/multi-worker:latest -t josecho/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push josecho/multi-client:latest
docker push josecho/multi-server:latest
docker push josecho/multi-worker:latest

docker push josecho/multi-client:$SHA
docker push josecho/multi-server:$SHA
docker push josecho/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=josecho/multi-client:$SHA
kubectl set image deployments/server-deployment server=josecho/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=josecho/multi-worker:$SHA

