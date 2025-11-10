# LAMP Stack with Custom Application

## Build and Run

```bash
docker build -t lamp-app .
docker run -d -p 8080:80 --name lamp-container lamp-app
```

## Access Application

Open browser: http://localhost:8080

## Features

- Add users to database
- View all users
- MySQL database integration
- PHP backend
- Apache web server

## Push to Docker Hub

```bash
docker tag lamp-app YOUR_USERNAME/lamp-app
docker push YOUR_USERNAME/lamp-app
```

## Database Access

```bash
docker exec -it lamp-container mysql -u root
```

## Stop and Remove

```bash
docker stop lamp-container
docker rm lamp-container
```
