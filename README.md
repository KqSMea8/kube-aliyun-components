### Generate kube config

```
$ make config
```

### Install components

```
$ docker-compose run --rm ntpl apply -p params/base.yaml -c namespaces -c kube-ingress -c dashboard -c cert-manager
```
