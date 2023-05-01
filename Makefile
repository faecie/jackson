.DEFAULT_GOAL := help

.DOCKER_COMPOSE := docker-compose
.DOCKER_RUN_PYTHON := $(.DOCKER_COMPOSE) run --rm python

.PHONY: all $(MAKECMDGOALS) #see https://stackoverflow.com/questions/44492805/makefile-declare-all-targets-phony

install: dependencies ## Setup the project
destroy: down-with-volumes ## Destroy the project

test: run-tests ## Run the test suite
qa: lint-check run-tests ## Run the quality assurance suite

dependencies:
	$(.DOCKER_RUN_PYTHON) pip install -r requirements.txt

lint-check:
	$(.DOCKER_RUN_PYTHON) black --diff --check .

format:
	$(.DOCKER_RUN_PYTHON) black .

down-with-volumes:
	$(.DOCKER_COMPOSE) down --volumes --remove-orphans

run-tests:
	$(.DOCKER_RUN_PYTHON) python -m unittest discover -s tests/

# Based on https://www.thapaliya.com/en/writings/well-documented-makefiles/
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf " \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
