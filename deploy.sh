docker build -t saleem8054/multi-client:latest -t saleem8054/multi-client:$SHA ./client
docker build -t saleem8054/multi-server:latest -t saleem8054/multi-server:$SHA ./server
docker build -t saleem8054/multi-worker:latest -t saleem8054/multi-worker:$SHA ./worker

docker push saleem8054/multi-client:latest
docker push saleem8054/multi-server:latest
docker push saleem8054/multi-worker:latest

docker push saleem8054/multi-client:$SHA
docker push saleem8054/multi-server:$SHA
docker push saleem8054/multi-worker:$SHA

kubectl apply -f k8s


kubectl set image deployments/client-deployment client=saleem8054/multi-client:$SHA
kubectl set image deployments/server-deployment server=saleem8054/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=saleem8054/multi-worker:$SHA