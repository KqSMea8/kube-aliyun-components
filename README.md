### Generate kube config

```
$ make config
```

### Install components

```
$ docker-compose run --rm ntpl apply -p params/base.yaml -p params/apollo.yaml -c 01_namespaces -c kube-ingress -c dashboard -c cert-manager
```
