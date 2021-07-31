.PHONY: fmt lint build install

.DEFAULT: help
help:
	@echo "fmt        :run gofmt"
	@echo "lint       :run golangci-lint"
	@echo "build      :run go build"
	@echo "install    :install the dependence"

fmt:
	@golangci-lint run --fix

lint:
	@golangci-lint run

install:
	@go mod download

build:
	@go build -v *.go
