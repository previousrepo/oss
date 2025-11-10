# Question 28: Ubuntu + OpenJDK Docker Image with Java Application

## Build and Run

```bash
cd others/28

# Build the Docker image
docker build -t ubuntu-openjdk-app .

# Run the container
docker run --rm ubuntu-openjdk-app

# Run with interactive shell
docker run -it ubuntu-openjdk-app bash

# Inside container, verify Java
java -version
javac -version
```

## Verify Installation

```bash
# Check Java version in container
docker run ubuntu-openjdk-app java -version

# List compiled classes
docker run ubuntu-openjdk-app ls -la /app
```

## Run Different Java Programs

```bash
# Run Calculator directly
docker run ubuntu-openjdk-app java Calculator

# Compile and run custom Java file
docker run -v $(pwd):/app ubuntu-openjdk-app sh -c "javac MyApp.java && java MyApp"
```

## Clean Up

```bash
docker rmi ubuntu-openjdk-app
```

## Features

- Ubuntu 22.04 base image
- OpenJDK 17 installed
- Java application compilation
- Multiple Java classes
- Environment variables configured
