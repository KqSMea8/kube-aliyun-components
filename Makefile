dcr := docker-compose run --rm
env := apollo-preprod

compile-%:
	$(dcr) ntpl compile -p params/base.yaml -p params/$(env).yaml -c $(*)

validate-%:
	$(dcr) ntpl validate -p params/base.yaml -p params/$(env).yaml -c $(*)

apply-%:
	$(dcr) ntpl apply -p params/base.yaml -p params/$(env).yaml -c $(*)

delete-%:
	$(dcr) ntpl delete -p params/base.yaml -p params/$(env).yaml -c $(*)

config:
	@echo "Pleaes make sure you have oss access"
	$(dcr) ossutil cp -f oss://kube-platforms/$(env)/configs/config /root/.kube/config

token:
	$(dcr) kubectl describe -n kube-system $(shell kubectl get secret -n kube-system -o name | grep kubernetes-dashboard-token) | grep token:
