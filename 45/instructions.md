# Web Application with Login

## Build and Run

```bash
docker build -t webapp-login .
docker run -p 5000:5000 webapp-login
```

## Access

http://localhost:5000

## Demo Credentials

- admin / admin
- user / pass123

## Push to Docker Hub

```bash
docker tag webapp-login YOUR_USERNAME/webapp-login
docker push YOUR_USERNAME/webapp-login
```
