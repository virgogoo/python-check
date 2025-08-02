CONTAINER_NAME=openwrt-dev

# Image Docker
IMAGE=openwrt-builder:latest

PROJECT_DIR=$(HOME)/Documents/my-openwrt-checkpy/openwrt

DOCKER=docker

.PHONY: build run stop rm logs shell

# Build docker image
build:
	$(DOCKER) build -t $(IMAGE) .

# Create and run container
run:
	$(DOCKER) run -it --name $(CONTAINER_NAME) \
		-v $(PROJECT_DIR):/home/builder/openwrt \
		--hostname=openwrt-builder \
		--network=host \
		--restart unless-stopped \
		$(IMAGE) \
		/bin/bash

# Start container ( stop before )
start:
	$(DOCKER) start -ai $(CONTAINER_NAME)

# Stop container
stop:
	$(DOCKER) stop $(CONTAINER_NAME)

# Delete container
rm:
	$(DOCKER) rm $(CONTAINER_NAME)

# Log container
logs:
	$(DOCKER) logs $(CONTAINER_NAME)

