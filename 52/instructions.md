# Run Flask Container on Port 5000

## Prerequisites

You need a Flask Docker image (from question 43 or 51).

## Run Container

```bash
docker run -p 5000:5000 flask-hello-world
```

## Port Mapping Explanation

- `-p 5000:5000` maps host port 5000 to container port 5000
- Format: `-p HOST_PORT:CONTAINER_PORT`

## Run in Background

```bash
docker run -d -p 5000:5000 --name flask-app flask-hello-world
```

## Verify

```bash
curl http://localhost:5000
```

Or open browser: http://localhost:5000

## Check Running Containers

```bash
docker ps
```

## View Logs

```bash
docker logs flask-app
```

## Stop Container

```bash
docker stop flask-app
docker rm flask-app
```
