### Debugging with Pod

- Debugging from logs
```
$ kubectl logs -f <pod-name>
```

- Port forward approach
```
$ kubectl port-forward <pod-name> <LocalPort>:<ContainerPort>
$ open localhost:<LocalPort>
```

- Jump into a busybox
```
$ kubectl apply -f ./templates/debug/deployment.yaml
$ kubectl exec -it <busybox-name> bash
$ curl <service-name>.<namespace>:<ContainerPort>
```

- Dashboard approach
```
$ kubectl proxy
$ open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=kube-system
```


### Debugging with port

- Get listened port
```
$ lsof -n -i4TCP:8001
$ kill -9 <PID>
```
