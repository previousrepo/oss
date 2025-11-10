# Docker with Ubuntu and OpenJDK

## Build and Run

### Build the Docker image
```bash
docker build -t ubuntu-openjdk-app .
```

### Run the container
```bash
docker run ubuntu-openjdk-app
```

### Run interactively
```bash
docker run -it ubuntu-openjdk-app /bin/bash
```

## Verify Java Installation
```bash
docker run ubuntu-openjdk-app java -version
```

## Multi-stage Build (Optional)
For smaller images, use multi-stage builds:

```dockerfile
# Build stage
FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y openjdk-11-jdk
WORKDIR /app
COPY HelloWorld.java .
RUN javac HelloWorld.java

# Runtime stage
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y openjdk-11-jre
WORKDIR /app
COPY --from=builder /app/HelloWorld.class .
CMD ["java", "HelloWorld"]
```
