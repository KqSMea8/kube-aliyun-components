### Generate kube config

```
$ make config-apollo-my-prod
```

### Generate dashboard token
```
$ kubectl proxy &
$ make token
```

### Install components

```
./bin/deploy.sh apollo-my-prod kube-ingress
```
