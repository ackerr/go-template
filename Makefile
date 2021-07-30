.PHONY: fmt lint build install

.DEFAULT: help
help:
	@echo "fmt           : run gofmt"
	@echo "lint          : run golangci-lint"
	@echo "build         : run go build"
	@echo "install       : install the dependence"

fmt:
	@gofmt -d -w -e .

lint:
	@go vet ./...
	@go mod tidy
	@golangci-lint run --fix

install:
	@go mod download

build:
	@go build -v *.go
