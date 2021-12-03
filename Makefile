APP_NAME = xTool
BIN_NAME = xtool
APP_VERSION = 0.0.0

SHELL := env /bin/bash

all:
	@echo "Building $(APP_NAME) $(APP_VERSION)"
	@echo "Show help in \`make help\`"

build: fmt
	@go build -ldflags "-s -w" -o ./dist/$(BIN_NAME) ./src/main.go

build-linux-amd64:
	CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o ./dist/$(BIN_NAME)-linux-amd64 ./src/main.go

build-docker:
	docker build --file Dockerfile --tag impossible98/$(BIN_NAME) .

dev: lint
	go build -o ./dist/$(BIN_NAME) ./src/main.go
	./dist/$(BIN_NAME)

fmt:
	@go fmt ./src/...

help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "  build: build the application"
	@echo ""
	@echo "  build-docker: build the application for docker"
	@echo ""
	@echo "  build-linux-amd64: build the application for linux/amd64"
	@echo ""
	@echo "  dev: run the application in development mode"
	@echo ""
	@echo "  fmt: format the source code"
	@echo ""
	@echo "  help: show this help"
	@echo ""
	@echo "  lint: run the linter"
	@echo ""
	@echo "  start: run the application"
	@echo ""

lint:
	@go vet ./src/...

start: build
	@./dist/$(BIN_NAME)

start-docker: build-docker
	docker run --rm impossible98/$(BIN_NAME)
