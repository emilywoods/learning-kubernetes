# Learning Kubernetes
Experimenting with Kubernetes on Minikube and Google Cloud Platform

## Minikube
[Minikube](https://github.com/kubernetes/minikube) is a useful starting point for
 getting acquainted with Kubernetes. It runs a single-node Kubernetes cluster inside a VM on your laptop. Information 
 for getting started with it can be found in the link to its Github page. 

## Nodes
A node is a machine in Kubernetes, they may be a physical or virtual machine.
`kubectl get nodes` - list nodes in your cluster

## Pods
`kubectl get pods` - get existing pods \
`kubectl describe pods` - view what containers are inside the pod, and the images
used to build those containers \
`kubectl logs <pod-name>` - retrieve logs for the pod \
`kubectl exec <pod-name> env` - list the environment variables for a pod \
`kubectl exec -ti <pod-name> bash` - start a bash session in a pod \
`kubectl delete pod <pod-name>` - delete pods \
`kubectl get pods -l <label> -o yaml | grep podIP` - check pod IPs

## Services
`kubectl get services` \
`kubectl expose deployment <name> --type=<type> --port 8080` - create a new service and expose it to external traffic \
`kubectl get deployments` - list deployments \
`kubectl describe deployment` \
`kubectl delete service <service-name>` - delete service \

## Labels
Existing labels can be found by `describe`-ing the deployment. The labels can be used to query pods and services using `-l` command: \
`kubectl get pods -l run=<name>` \
`kubectl get services -l run=<name>` \
`kubectl label pod <pod-name> <label>` - label a pod \

## Scale deployments
`kubectl scale deployments <name> --replicas=3` - scale up/down to the specified number \
`kubectl get pods -o wide` - check number of pods \

## Rolling updates
`kubectl set image deployments/<deployment-name> <deployment-name>=<image-name>:v2`\ - update to image of specified version number
`kubectl rollout status deployments/<deployment-name>` - check the rollout status \

## Jobs 
To view to output of a job in the logs of the pods in which it is run:
```
pods=$(kubectl get pods  --show-all --selector=job-name=<job-name> --output=jsonpath={.items..metadata.name})
kubectl logs $pods 
```

## Manipulating objects using config files
`kubectl apply -f file-name.yml` - add object \
`kubectl delete -f file-name.yml` - delete object \

## Refs
https://kubernetes.io/
https://github.com/kubernetes/minikube