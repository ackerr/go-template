.PHONY: fmt lint test build clean test_all

.DEFAULT: help
help:
	@echo "fmt           : run gofmt"
	@echo "lint          : run golangci-lint"
	@echo "build         : run go build"
	@echo "install       : install the dependence"
	@echo "clean         : remove the bin"

fmt:
	@gofmt -d -w -e .

lint:
	@go vet ./...
	@go mod tidy
	@golangci-lint run --fix

install:
	@go mod download

build:
	@go build -v -o ${BIN} *.go

clean:
	@git clean -fdx ${BIN} ${DIST_DIR}
