CERT_MANAGER_VERSION ?= 1.14.5
SPIN_OPERATOR_VERSION ?= 0.1.0

.PHONY: update-all
update-all: update-crds update-templates

.PHONY: update-crds
update-crds:
	curl -sL https://github.com/cert-manager/cert-manager/releases/download/v$(CERT_MANAGER_VERSION)/cert-manager.crds.yaml > ./crds/cert-manager.crds.yaml
	curl -sL https://github.com/spinkube/spin-operator/releases/download/v$(SPIN_OPERATOR_VERSION)/spin-operator.crds.yaml > ./crds/spin-operator.crds.yaml

.PHONY: update-templates
update-templates:
	curl -sL https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.runtime-class.yaml > ./templates/spin-operator.runtime-class.yaml
	curl -sL https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.shim-executor.yaml > ./templates/spin-operator.shim-executor.yaml
