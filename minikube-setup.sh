#!/usr/bin/env bash

# Before, run:
# minikube start

kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 \
--replicas=2 --port=8080 --labels="ver=1,app=kubernetes-bootcamp"

sleep 2

export POD_NAME=$(kubectl get pods -o go-template --template \
'{{range.items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Pod Name: $POD_NAME

# After, run:
# minikube stop
# minikube delete

