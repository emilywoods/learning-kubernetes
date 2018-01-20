# Learning Kubernetes

## Pods
`kubectl get pods` - look for existing pods \
`kubectl describe pods` - view what containers are inside the pod, and the images
used to build those containers \
`kubectl logs <pod-name>` - retrieve logs for the pod \
`kubectl exec <pod-name> env` - list the environment variables for a pod \
`kubectl exec -ti <pod-name> bash` - start a bash session in the pod
`kubectl delete pod <pod-name>` - delete pods

## Services
`kubectl get services` - A service called kubernetes is created by default when minikube starts a cluster. \
`kubectl expose deployment <name> --type=<type> --port 8080` - create a new service and expose it to external traffic \
`kubectl get deployments` - list deployments
`kubectl describe deployment` 
`kubectl delete service <service-name>` - delete service

## Labels
Existing labels can be found by `describe` the deployment, these can be used to query pods and services with a label using `-l` command:
`kubectl get pods -l run=<name>` 
`kubectl get services -l run=<name>`
`kubectl label pod <pod-name> <label>` - label a pod

## Scale deployments
`kubectl scale deployments <name> --replicas=3` - scale up/down to specified number
`kubectl get pods -o wide` - check number of pods

## Rolling updates
`kubectl set image deployments/<deployment-name> kubernetes-bootcamp=<image-name>:v2`
`kubectl rollout status deployments/<deployment-name>` - check the rollout status

## Other
`kubectl proxy` - create a proxy that forwards communications to the cluster-wide,
private network

1. What is a pod?
2. What is a ReplicaSet
3. Deployment
4. Job
5. ConfigMap
6. Service - routes traffic across a set of pods
