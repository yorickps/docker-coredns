# makefile

# import config.

config ?= config.env
include $(config)
export $(shell sed 's/=.*//' $(config))

# HELP
.PHONY: help

help : ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

pull :
	docker-compose pull

up : pull
	docker-compose up -d

down :
	docker-compose down

build :
	docker build -t $(NAME) .
