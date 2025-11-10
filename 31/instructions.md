# Go Tools Demonstration

## Common Go Tools

### 1. go build
Compiles Go packages and dependencies
```bash
go build main.go
./main
```

### 2. go run
Compiles and runs Go program
```bash
go run main.go
```

### 3. go test
Runs tests
```bash
go test
go test -v  # verbose
go test -cover  # with coverage
```

### 4. go fmt
Formats Go source code
```bash
go fmt main.go
go fmt ./...  # format all files
```

### 5. go vet
Examines code for suspicious constructs
```bash
go vet main.go
```

### 6. go mod
Module management
```bash
go mod init myproject
go mod tidy
go mod download
```

### 7. go doc
Shows documentation
```bash
go doc fmt.Println
go doc -all fmt
```

### 8. go get
Downloads and installs packages
```bash
go get github.com/gorilla/mux
```

### 9. gofmt
Alternative formatter
```bash
gofmt -w main.go
```

### 10. golint
Linter for Go code
```bash
go install golang.org/x/lint/golint@latest
golint main.go
```

## Example: Using go test

See test_demo.go and test_demo_test.go for examples.
