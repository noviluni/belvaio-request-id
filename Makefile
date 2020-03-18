.DEFAULT_GOAL := help

.PHONY: help
help:  ## Shows this help message.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target> <arg=value>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m  %s\033[0m\n\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ 🚀 Getting started

.PHONY: install
install: ## Create a virtual environment and install project dependencies. Arguments: p=PYTHON-VERSION will use a specific Python executable.
	./scripts/install $(p)

##@ 🛠  Testing and development

.PHONY: test
test: ## Run all or specific tests. Arguments: name=NAME-OF-TEST will run a specific test.
	./scripts/test $(name)

.PHONY: lint
lint: ## Check of fix code linting using black and isort. Arguments: fix=yes will force changes.
	./scripts/lint $(fix)

.PHONY: serve
serve: ## Run the docs site in hot-reload mode
	./scripts/docs

##@ 🧹 Tidying

.PHONY: clean
clean: clean-build clean-pyc clean-test ## Remove all build, test, coverage and Python artifacts.

.PHONY: clean-build
clean-build: ## Remove build artifacts.
	rm -fr build/
	rm -fr dist/
	rm -fr belvaio_request_id.egg-info/

.PHONY: clean-pyc
clean-pyc: ## Remove Python file artifacts.
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

.PHONY: clean-test
clean-test: ## Remove test and coverage artifacts.
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache
	find . -name '.mypy_cache' -exec rm -fr {} +
