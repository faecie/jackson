.DEFAULT_GOAL := help

.DOCKER_COMPOSE := docker-compose
.DOCKER_RUN_WEB := $(.DOCKER_COMPOSE) run --rm web
_JACKSON_PROD_IMAGE := jackson:prod

.PHONY: all $(MAKECMDGOALS) #see https://stackoverflow.com/questions/44492805/makefile-declare-all-targets-phony

# Based on https://www.thapaliya.com/en/writings/well-documented-makefiles/
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf " \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build-prod: ## Build production image
	docker build -t $(_JACKSON_PROD_IMAGE) -f ./docker/Dockerfile .

run-prod: build-prod ## Run production image. Navigate to [your browser](http://localhost:7327)
	docker run --rm -t --env-file ./.env -p 7327:3000 $(_JACKSON_PROD_IMAGE)

install: build up ## Install the application
up: ## Run the app in container
	$(.DOCKER_COMPOSE) up -d
build: node_modules
	$(.DOCKER_COMPOSE) build
down: ## Stops and removes containers, volumes, networks and images created by up
	$(.DOCKER_COMPOSE) down --remove-orphans -v

format: node_modules ## Check the code style and attempt to automatically fix it
	$(.DOCKER_RUN_WEB) yarn eslint -c .eslintrc.json --fix . . --ext .js,.jsx

lint-check: node_modules ## Check the code style
	$(.DOCKER_RUN_WEB) yarn eslint -c .eslintrc.json . . --ext .js,.jsx

node_modules: ## Install dependencies
	$(.DOCKER_RUN_WEB) yarn install

docker-compose.override.yml:
	cp docker-compose.override.yml.dist docker-compose.override.yml

qa: lint-check test ## Run the quality assurance suite

test: node_modules ## Run automated tests
	$(.DOCKER_RUN_WEB) yarn test --watchAll=false

test-interactive: node_modules ## Run automated tests in the interactive mode
	$(.DOCKER_RUN_WEB) yarn test

watch-css: node_modules ## Hot reload of css styling
	$(.DOCKER_RUN_WEB) yarn watch-css
