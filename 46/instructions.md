# Run Docker Container on Port 80

## Prerequisites

You need a web application Docker image (from question 41, 45, or 49).

## Run Container on Port 80

```bash
docker run -p 80:5000 webapp-login
```

## Port Mapping Explanation

- `-p 80:5000` maps host port 80 to container port 5000
- Access via http://localhost (no port needed)

## Run in Background

```bash
docker run -d -p 80:5000 --name webapp webapp-login
```

## Verify

```bash
curl http://localhost
```

Or open browser: http://localhost

## Note on Port 80

Port 80 may require sudo on Linux:

```bash
sudo docker run -p 80:5000 webapp-login
```

## Alternative: Use Port 8080

```bash
docker run -p 8080:5000 webapp-login
```

Access: http://localhost:8080

## Stop Container

```bash
docker stop webapp
docker rm webapp
```
