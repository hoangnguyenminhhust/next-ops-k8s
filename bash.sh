#!/bin/bash/#
#install EKF
cd EKF
kubectl apply -f namespace.yml
kubectl apply -f . 

#install  jaeger
cd ../jaeger/cassandra
kubectl apply -f .

cd ..
kubectl apply -f . 

#install prometheus

cd ..
cd prometheus
cd install-prometheus
kubectl create ns monitoring
kubectl apply -f .
#install grafana

cd ..
cd ..
cd redis
kubectl apply -f . 

#master slave 
#kubectl exec -it redis-cluster-0 -- redis-cli --cluster create $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')

#intsall ingress
cd ..

cd ingress
kubectl apply -f .
kubectl apply -f .
kubectl apply -f .

#install nats 

cd ..
cd nats
cd nats.beta
kubectl  apply -f all.nats.yaml

kubectl apply -f .
