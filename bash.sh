#!/bin/bash/#
#install EKF
cd EKF
kubectl apply -f namespace.yml
kubectl apply -f . 
cd ..
echo ------------------------------------------------------------

#install  jaeger
cd ./jaeger/cassandra
kubectl apply -f .
cd ..
kubectl apply -f . 
cd ..
echo ------------------------------------------------------------

#install prometheus
cd ./prometheus/install-prometheus
kubectl create ns monitoring
kubectl apply -f .
cd ..
cd ..
echo ------------------------------------------------------------
#install grafana

cd redis
kubectl apply -f . 
#master slave 
#kubectl exec -it redis-cluster-0 -- redis-cli --cluster create $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')
cd ..
echo ------------------------------------------------------------

#intsall ingress
cd ingress
kubectl apply -f .
kubectl apply -f .
kubectl apply -f .
cd ..
echo ------------------------------------------------------------

#install nats 
cd nats
cd nats.beta
kubectl  apply -f all.nats.yaml
cd ..
cd ..
cd cert 
bash bash.sh
cd ..
cd nats
cd nats.beta
kubectl apply -f .
echo ------------------------------------------------------------
