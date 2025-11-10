# Question 32: Comprehensive Dockerfile with All Fields

## All Dockerfile Instructions Demonstrated

1. **FROM** - Base image selection
2. **LABEL** - Image metadata
3. **ARG** - Build-time variables
4. **ENV** - Environment variables
5. **WORKDIR** - Working directory
6. **RUN** - Execute commands
7. **COPY** - Copy files
8. **ADD** - Copy with extraction
9. **USER** - Set user
10. **VOLUME** - Mount points
11. **EXPOSE** - Port documentation
12. **HEALTHCHECK** - Health monitoring
13. **ONBUILD** - Trigger for child images
14. **STOPSIGNAL** - Stop signal
15. **SHELL** - Default shell
16. **CMD** - Default command
17. **ENTRYPOINT** - Container executable

## Build and Run

```bash
cd others/32

# Build with build args
docker build \
  --build-arg APP_VERSION=2.0.0 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t dockerfile-demo:latest .

# Run the container
docker run -d -p 8000:8000 --name dockerfile-demo dockerfile-demo:latest

# Test the application
curl http://localhost:8000
curl http://localhost:8000/health
curl http://localhost:8000/info
```

## Inspect the Image

```bash
# View image labels
docker inspect dockerfile-demo:latest | grep -A 10 Labels

# View environment variables
docker inspect dockerfile-demo:latest | grep -A 10 Env

# View exposed ports
docker inspect dockerfile-demo:latest | grep -A 5 ExposedPorts

# View volumes
docker inspect dockerfile-demo:latest | grep -A 5 Volumes

# View healthcheck
docker inspect dockerfile-demo:latest | grep -A 10 Healthcheck
```

## Test Features

```bash
# Check health status
docker ps --format "table {{.Names}}\t{{.Status}}"

# View logs
docker logs dockerfile-demo

# Execute command in container
docker exec dockerfile-demo env

# Check user
docker exec dockerfile-demo whoami

# Check working directory
docker exec dockerfile-demo pwd
```

## Clean Up

```bash
docker stop dockerfile-demo
docker rm dockerfile-demo
docker rmi dockerfile-demo:latest
```

## Key Concepts

- Multi-stage builds for smaller images
- Non-root user for security
- Health checks for monitoring
- Build arguments for flexibility
- Labels for metadata
- Volumes for persistence
