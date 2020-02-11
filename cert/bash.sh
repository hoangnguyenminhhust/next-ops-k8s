#!/bin/bash/#
#generic a key gen
cfssl gencert -initca ca-csr.json | cfssljson -bare ca -

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server server.json | cfssljson -bare server

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=route route.json | cfssljson -bare route

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=client client.json | cfssljson -bare client

#create key success connections
kubectl create secret generic nats-tls-example --from-file=ca.pem --from-file=server-key.pem --from-file=server.pem 

kubectl create secret generic nats-tls-routes-example --from-file=ca.pem --from-file=route-key.pem --from-file=route.pem 

kubectl create secret generic nats-tls-client-example --from-file=ca.pem --from-file=client-key.pem --from-file=client.pem
