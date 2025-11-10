# LAMP Stack Application with Docker

## Deploy

```bash
docker-compose up -d --build
```

## Access Application

Open browser: http://localhost:8080

## Features

- Task management system
- MySQL database integration
- PHP backend with PDO
- Apache web server
- Responsive design

## View Logs

```bash
docker-compose logs -f
```

## Database Access

```bash
docker exec -it lamp_mysql mysql -u webuser -pwebpass webapp
```

## Stop

```bash
docker-compose down
docker-compose down -v  # Remove volumes
```
