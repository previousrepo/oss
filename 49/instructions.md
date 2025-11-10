# Web Application with Login and Styling

## Build and Run

```bash
docker build -t webapp-styled .
docker run -p 5000:5000 webapp-styled
```

## Access

http://localhost:5000

## Demo Credentials

- john / john123
- jane / jane456
- admin / admin789

## Features

- User authentication
- Flash messages
- Responsive design
- Dashboard with stats
- Session management

## Push to Docker Hub

```bash
docker tag webapp-styled YOUR_USERNAME/webapp-styled
docker push YOUR_USERNAME/webapp-styled
```
