docker build -t saleem8054/multi-client ./client
docker build -t saleem8054/multi-server ./server
docker build -t saleem8054/multi-worker ./worker

docker push saleem8054/multi-client
docker push saleem8054/multi-server
docker push saleem8054/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=saleem8054/multi-server