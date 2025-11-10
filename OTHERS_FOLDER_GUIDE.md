# Others Folder - Additional Docker Questions (23-33)

## Overview

The `others/` folder contains 11 additional Docker questions (originally numbered 59-69, now reorganized as 23-33) from sir's PDF. These complement the main 58 questions with more Docker-focused implementations.

## Folder Structure

```
others/
├── README.md                    # Quick reference guide
├── 23/                          # Flask login on port 7000
├── 24/                          # Django login on port 6000
├── 25/                          # Nginx + MySQL containers
├── 26/                          # Web form with MySQL
├── 27/                          # Volume mounting demo
├── 28/                          # Ubuntu + OpenJDK + Java
├── 29/                          # LAMP + MediaWiki
├── 30/                          # C linked list containerized
├── 31/                          # LAMP + Custom web app
├── 32/                          # All Dockerfile fields
└── 33/                          # All Docker Compose fields
```

## Question Details

### 23. Flask Login Form (Port 7000)
**Files:** Dockerfile, app.py, requirements.txt, templates/
- Simple Flask web application
- Login/logout functionality
- Session management
- Bootstrap UI

**Run:**
```bash
cd others/23
docker build -t flask-login .
docker run -p 7000:7000 flask-login
# Access: http://localhost:7000
# Credentials: admin/password
```

### 24. Django Login Form (Port 6000)
**Files:** Dockerfile, manage.py, loginproject/, loginapp/
- Django authentication system
- Admin interface
- SQLite database
- Bootstrap templates

**Run:**
```bash
cd others/24
docker build -t django-login .
docker run -p 6000:6000 django-login
# Access: http://localhost:6000
# Credentials: admin/admin123
```

### 25. Nginx + MySQL Multi-Container
**Files:** docker-compose.yml, html/, nginx.conf, init.sql
- Two separate containers
- Nginx web server
- MySQL database
- Network communication

**Run:**
```bash
cd others/25
docker-compose up -d
# Web: http://localhost:8080
# MySQL: localhost:3306
```

### 26. Web Form with MySQL
**Files:** docker-compose.yml, Dockerfile, src/index.php, nginx.conf
- PHP web form
- MySQL database integration
- CRUD operations
- Nginx + PHP-FPM

**Run:**
```bash
cd others/26
docker-compose up -d
# Access: http://localhost:8081
```

### 27. Volume Mounting
**Files:** docker-compose.yml, html/, instructions.md
- Bind mounts demonstration
- Named volumes
- Read-only mounts
- Data persistence

**Run:**
```bash
cd others/27
docker-compose up -d
# Or: docker run -v $(pwd)/data:/container-data nginx:alpine
```

### 28. Ubuntu + OpenJDK + Java
**Files:** Dockerfile, HelloWorld.java, Calculator.java
- Ubuntu 22.04 base
- OpenJDK 17
- Java compilation
- Multi-class application

**Run:**
```bash
cd others/28
docker build -t java-app .
docker run java-app
```

### 29. LAMP Stack + MediaWiki (Port 8080)
**Files:** docker-compose.yml, instructions.md
- Complete LAMP stack
- MediaWiki CMS
- phpMyAdmin
- MySQL database

**Run:**
```bash
cd others/29
docker-compose up -d
# MediaWiki: http://localhost:8080
# phpMyAdmin: http://localhost:8081
```

### 30. C Program - Linked List
**Files:** Dockerfile, linked_list.c, instructions.md
- C programming in Docker
- Singly linked list implementation
- GCC compilation
- Alpine Linux base

**Run:**
```bash
cd others/30
docker build -t c-linked-list .
docker run c-linked-list
```

### 31. LAMP Stack + Custom Web App
**Files:** docker-compose.yml, Dockerfile, src/, init.sql
- Custom blog application
- PHP + MySQL
- Apache web server
- User authentication
- Posts and comments

**Run:**
```bash
cd others/31
docker-compose up -d
# Access: http://localhost:8083
```

### 32. All Dockerfile Fields
**Files:** Dockerfile, app.py, scripts/, instructions.md
- Comprehensive Dockerfile example
- All instructions demonstrated:
  - FROM, LABEL, ARG, ENV
  - WORKDIR, RUN, COPY, ADD
  - USER, VOLUME, EXPOSE
  - HEALTHCHECK, ONBUILD
  - STOPSIGNAL, SHELL
  - CMD, ENTRYPOINT
- Multi-stage build
- Best practices

**Run:**
```bash
cd others/32
docker build --build-arg APP_VERSION=2.0.0 -t dockerfile-demo .
docker run -p 8000:8000 dockerfile-demo
# Test: curl http://localhost:8000
```

### 33. All Docker Compose Fields
**Files:** docker-compose.yml, web/, api/, database/, instructions.md
- Comprehensive Docker Compose example
- All fields demonstrated:
  - Services (build, image, ports, volumes, networks)
  - Networks (driver, ipam, labels)
  - Volumes (driver, driver_opts)
  - Dependencies and health checks
  - Resource limits
  - Logging and security
  - Extensions (x-*)
- Multi-service orchestration
- 4 services: web, api, database, cache

**Run:**
```bash
cd others/33
export BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
docker-compose up -d
# Web: http://localhost:8080
# API: http://localhost:3000
```

## Common Commands

### Build and Run
```bash
# Single container
docker build -t <name> .
docker run -p <host>:<container> <name>

# Multi-container
docker-compose up -d
docker-compose ps
docker-compose logs -f
```

### Stop and Clean
```bash
# Single container
docker stop <container>
docker rm <container>
docker rmi <image>

# Multi-container
docker-compose down
docker-compose down -v  # Remove volumes
```

### Debugging
```bash
# View logs
docker logs <container>
docker-compose logs <service>

# Execute commands
docker exec -it <container> bash
docker-compose exec <service> bash

# Inspect
docker inspect <container>
docker-compose config
```

## Port Mapping Summary

| Question | Port | Service |
|----------|------|---------|
| 23 | 7000 | Flask Login |
| 24 | 6000 | Django Login |
| 25 | 8080 | Nginx Web |
| 26 | 8081 | PHP Form |
| 27 | 8082 | Volume Demo |
| 28 | - | Java App (no port) |
| 29 | 8080, 8081 | MediaWiki, phpMyAdmin |
| 30 | - | C Program (no port) |
| 31 | 8083 | LAMP Blog |
| 32 | 8000 | Dockerfile Demo |
| 33 | 8080, 3000 | Web, API |

## Database Credentials

Most questions use these default credentials:

```
Root Password: rootpass
Database: varies (testdb, formdb, webapp, etc.)
User: varies (testuser, formuser, webuser, etc.)
Password: varies (testpass, formpass, webpass, etc.)
```

Check individual `docker-compose.yml` files for specific credentials.

## Tips

1. **Port Conflicts:** If a port is already in use, modify the port mapping in docker-compose.yml
2. **Volume Permissions:** Some containers may need proper file permissions
3. **Database Init:** Wait for database health checks before accessing applications
4. **Clean Up:** Always run `docker-compose down -v` to remove volumes when testing
5. **Logs:** Use `docker-compose logs -f` to debug issues

## Integration with Main Questions

These questions (23-33) complement the main 58 questions:
- Questions 1-58: Main OSS lab questions (Git, Docker, tools, etc.)
- Questions 23-33 (others/): Additional Docker-specific implementations

Both sets are complete and ready for lab work!
