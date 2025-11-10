# Run Docker Container on Port 80

## Prerequisites

You need a web application Docker image.

## Run Container

```bash
docker run -p 80:5000 your-webapp-image
```

## Examples

### Flask App
```bash
docker run -p 80:5000 flask-hello-world
```

### Web App with Login
```bash
docker run -p 80:5000 webapp-login
```

## Access Application

Open browser: http://localhost

## Run in Background

```bash
docker run -d -p 80:5000 --name myapp your-webapp-image
```

## Troubleshooting

### Permission Denied on Port 80
```bash
sudo docker run -p 80:5000 your-webapp-image
```

### Port Already in Use
```bash
# Check what's using port 80
sudo lsof -i :80

# Use different port
docker run -p 8080:5000 your-webapp-image
```

## Stop Container

```bash
docker stop myapp
docker rm myapp
```
