# Simple HTTP Web Server on Port 5000

## Build and Run

```bash
docker build -t simple-webserver .
docker run -p 5000:5000 simple-webserver
```

## Access Application

Open browser: http://localhost:5000

## Run in Background

```bash
docker run -d -p 5000:5000 --name webserver simple-webserver
```

## View Logs

```bash
docker logs webserver
```

## Stop Container

```bash
docker stop webserver
docker rm webserver
```

## Features

- Python HTTP server
- Serves static HTML
- Runs on port 5000
- Lightweight container
