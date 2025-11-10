# Question 31: LAMP Stack with Custom Web Application

## Setup and Run

```bash
cd others/31

# Start all services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

## Access Application

- Web Application: http://localhost:8083
- About Page: http://localhost:8083/about.php

## Database Details

- Host: mysql
- Database: webapp
- User: webuser
- Password: webpass
- Root Password: rootpass

## Test Database Connection

```bash
# Connect to MySQL
docker exec -it lamp-mysql mysql -u webuser -pwebpass webapp

# Run queries
SHOW TABLES;
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM comments;
```

## Verify LAMP Components

```bash
# Check Apache
docker exec lamp-apache apache2 -v

# Check PHP
docker exec lamp-apache php -v

# Check MySQL
docker exec lamp-mysql mysql --version

# Check Linux
docker exec lamp-apache cat /etc/os-release
```

## Stop and Clean Up

```bash
docker-compose down

# Remove volumes
docker-compose down -v
```

## Features

- Complete LAMP stack
- Blog application with posts and comments
- User management
- MySQL database with relationships
- Bootstrap responsive design
- Docker Compose orchestration
