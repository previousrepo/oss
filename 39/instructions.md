# HTTP/REST API Communication Between Docker Containers

## What is Application-Level Communication?

Uses HTTP/REST API - the client makes HTTP requests (GET, POST) to the server's API endpoints. This is how modern web applications communicate.

## Build and Run

```bash
docker-compose up -d --build
```

## View Communication

```bash
# Server logs
docker logs -f api_server

# Client logs
docker logs -f api_client
```

You'll see:
- Client sends GET and POST requests
- Server responds with JSON data
- Communication happens via HTTP on port 8000

## Test API Manually

```bash
# GET request
curl http://localhost:8000/api/status

# POST request
curl -X POST http://localhost:8000/api/data \
  -H "Content-Type: application/json" \
  -d '{"message":"Test from curl"}'
```

## Push to Docker Hub

```bash
docker tag 39-server YOUR_USERNAME/api-server
docker tag 39-client YOUR_USERNAME/api-client
docker push YOUR_USERNAME/api-server
docker push YOUR_USERNAME/api-client
```

## Stop

```bash
docker-compose down
```

## Comparison

| Method | 37 (Socket) | 38 (IPC) | 39 (HTTP API) |
|--------|-------------|----------|---------------|
| Protocol | TCP Socket | Unix Socket | HTTP/REST |
| Speed | Fast | Fastest | Moderate |
| Use Case | Network comm | Same host | Web services |
| Port | 9999 | File-based | 8000 |
