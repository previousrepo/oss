# Go Language Feature Demonstrations

## Installation
```bash
# Ubuntu/Debian
sudo apt-get install golang-go

# Or download from https://golang.org/dl/
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

## Running the Programs

### Goroutines Demo
```bash
go run goroutines_demo.go
```

### Channels Demo
```bash
go run channels_demo.go
```

### Interfaces Demo
```bash
go run interfaces_demo.go
```

## Key Go Features

1. **Goroutines**: Lightweight threads
2. **Channels**: Communication between goroutines
3. **Interfaces**: Implicit implementation
4. **Defer**: Cleanup operations
5. **Error Handling**: Explicit error returns
6. **Structs**: Data structures
7. **Pointers**: Memory management
8. **Packages**: Code organization
