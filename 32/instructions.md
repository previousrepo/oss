# Go Applications Demonstration

## Popular Go Applications

### 1. Docker
Docker itself is written in Go!

```bash
docker version
```

### 2. Kubernetes (kubectl)
Container orchestration tool

```bash
# If installed
kubectl version --client
```

### 3. Hugo (Static Site Generator)

#### Install Hugo
```bash
# Ubuntu/Debian
sudo apt-get install hugo

# Or download from https://github.com/gohugoio/hugo/releases
```

#### Create Site
```bash
hugo new site mysite
cd mysite
hugo server
```

### 4. Terraform
Infrastructure as Code tool

```bash
# Download from https://www.terraform.io/downloads
terraform version
```

### 5. Simple Go Web Server

Create `webserver.go`:
```go
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello from Go Web Server!")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("Server running on :8080")
    http.ListenAndServe(":8080", nil)
}
```

Run:
```bash
go run webserver.go
```

### 6. Go CLI Tool

Create `cli.go`:
```go
package main

import (
    "flag"
    "fmt"
)

func main() {
    name := flag.String("name", "World", "Name to greet")
    flag.Parse()
    
    fmt.Printf("Hello, %s!\n", *name)
}
```

Run:
```bash
go run cli.go -name=John
```

## Real-World Go Applications

- **Docker**: Container platform
- **Kubernetes**: Container orchestration
- **Prometheus**: Monitoring system
- **Grafana**: Analytics platform
- **Terraform**: Infrastructure as code
- **Hugo**: Static site generator
- **CockroachDB**: Distributed database
- **InfluxDB**: Time series database
- **Consul**: Service mesh
- **Vault**: Secrets management
