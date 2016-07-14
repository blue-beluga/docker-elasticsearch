export GIT_REVISION=$(shell git rev-parse --short HEAD)

REGISTRY = docker.io
REPOSITORY = bluebeluga/elasticsearch

PUSH_REGISTRIES = $(REGISTRY)
