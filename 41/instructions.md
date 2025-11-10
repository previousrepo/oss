# Web Application with Login - Docker

## Build and Run

```bash
docker build -t webapp-login .
docker run -p 5000:5000 webapp-login
```

## Access Application

Open browser: http://localhost:5000

## Demo Credentials

- admin / admin123
- user1 / password1
- demo / demo123

## Push to Docker Hub

```bash
docker tag webapp-login YOUR_USERNAME/webapp-login
docker push YOUR_USERNAME/webapp-login
```

## Features

- User authentication
- Session management
- Responsive design
- Multiple user accounts
- Logout functionality
