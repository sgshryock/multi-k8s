docker build -t sgshryock/multi-client:latest -t sgshryock/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sgshryock/multi-server:latest -t sgshryock/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sgshryock/multi-worker:latest -t sgshryock/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sgshryock/multi-client:latest
docker push sgshryock/multi-server:latest
docker push sgshryock/multi-worker:latest

docker push sgshryock/multi-client:$SHA
docker push sgshryock/multi-server:$SHA
docker push sgshryock/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sgshryock/multi-server:$SHA