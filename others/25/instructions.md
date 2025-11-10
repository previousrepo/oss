# Question 25: Nginx + MySQL Multi-Container Setup

## Setup and Run

```bash
cd others/25

# Start both containers
docker-compose up -d

# Check running containers
docker-compose ps

# View logs
docker-compose logs
```

## Access Services

- Nginx Web Server: http://localhost:8080
- MySQL Database: localhost:3306

## MySQL Connection Details

- Host: mysql (from nginx container) or localhost (from host)
- Port: 3306
- Database: testdb
- User: testuser
- Password: testpass
- Root Password: rootpass

## Test MySQL Connection

```bash
# From host machine
docker exec -it mysql-container mysql -u testuser -ptestpass testdb

# Run SQL commands
SHOW DATABASES;
USE testdb;
SHOW TABLES;
```

## Stop and Clean Up

```bash
docker-compose down

# Remove volumes as well
docker-compose down -v
```

## Features
- Nginx serving static HTML
- MySQL with persistent data volume
- Custom network for inter-container communication
- Health checks for both services
