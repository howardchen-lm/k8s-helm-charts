all: charts index

.PHONY: charts
charts:
	@helm package argus --destination docs
	@helm repo index docs --url=https://howardchen-lm.github.io/k8s-helm-charts/docs
	@helm package releasemanager --destination docs
	@helm repo index docs --url=https://howardchen-lm.github.io/k8s-release-manager/docs
	@helm package collectorset-controller --destination docs
	@helm repo index docs --url=https://howardchen-lm.github.io/k8s-helm-charts/docs

index:
	helm repo index ./ --url https://howardchen-lm.github.io/k8s-helm-charts/docs
	sed -i '' 's/\/docs//' index.yaml
	mv index.yaml ./docs
