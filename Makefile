dcr := docker-compose run --rm

%-apollo-my-prod: env=apollo-my-prod
%-apollo-my-prod: osspath=kube-my-storage

%-apollo-zft-prod: env=apollo-zft-prod
%-apollo-zft-prod: osspath=kube-zft-storage

config-%:
	# Personal hack
	cp ~/.oss-backup/oss-$(env) ~/.ossutilconfig
	$(dcr) ossutil cp -f oss://$(osspath)/$(env)/config/config /root/.kube/

token:
	$(dcr) kubectl describe -n kube-system $(shell kubectl get secret -n kube-system -o name | grep kubernetes-dashboard-token) | grep token:
