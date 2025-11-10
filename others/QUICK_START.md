# Quick Start Guide - Others Folder

## One-Command Test for Each Question

### Q23: Flask Login (Port 7000)
```bash
cd others/23 && docker build -t flask-login . && docker run -d -p 7000:7000 --name flask-app flask-login && echo "Access: http://localhost:7000 (admin/password)"
```

### Q24: Django Login (Port 6000)
```bash
cd others/24 && docker build -t django-login . && docker run -d -p 6000:6000 --name django-app django-login && echo "Access: http://localhost:6000 (admin/admin123)"
```

### Q25: Nginx + MySQL
```bash
cd others/25 && docker-compose up -d && echo "Web: http://localhost:8080 | MySQL: localhost:3306"
```

### Q26: Web Form + MySQL
```bash
cd others/26 && docker-compose up -d && echo "Access: http://localhost:8081"
```

### Q27: Volume Mount
```bash
cd others/27 && mkdir -p shared-data && docker-compose up -d && echo "Check shared-data/ folder"
```

### Q28: Java Application
```bash
cd others/28 && docker build -t java-app . && docker run --rm java-app
```

### Q29: MediaWiki LAMP
```bash
cd others/29 && docker-compose up -d && echo "MediaWiki: http://localhost:8080 | phpMyAdmin: http://localhost:8081"
```

### Q30: C Linked List
```bash
cd others/30 && docker build -t c-linked-list . && docker run --rm c-linked-list
```

### Q31: Custom LAMP Blog
```bash
cd others/31 && docker-compose up -d && echo "Access: http://localhost:8083"
```

### Q32: All Dockerfile Fields
```bash
cd others/32 && docker build --build-arg APP_VERSION=2.0.0 -t dockerfile-demo . && docker run -d -p 8000:8000 --name df-demo dockerfile-demo && echo "Access: http://localhost:8000"
```

### Q33: All Docker Compose Fields
```bash
cd others/33 && mkdir -p data/mysql && export BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') && docker-compose up -d && echo "Web: http://localhost:8080 | API: http://localhost:3000"
```

## Clean Up All

```bash
# Stop and remove all containers
docker stop $(docker ps -aq) 2>/dev/null
docker rm $(docker ps -aq) 2>/dev/null

# Or clean up individually
cd others/23 && docker stop flask-app && docker rm flask-app
cd others/24 && docker stop django-app && docker rm django-app
cd others/25 && docker-compose down -v
cd others/26 && docker-compose down -v
cd others/27 && docker-compose down -v
cd others/29 && docker-compose down -v
cd others/31 && docker-compose down -v
cd others/32 && docker stop df-demo && docker rm df-demo
cd others/33 && docker-compose down -v
```

## Test All Questions at Once

```bash
#!/bin/bash
# Save as test-all.sh and run: bash test-all.sh

echo "Testing all Docker questions..."

# Q23
cd others/23 && docker build -t flask-login . && docker run -d -p 7000:7000 --name flask-app flask-login
echo "✓ Q23 Flask running on port 7000"

# Q24
cd ../24 && docker build -t django-login . && docker run -d -p 6000:6000 --name django-app django-login
echo "✓ Q24 Django running on port 6000"

# Q25
cd ../25 && docker-compose up -d
echo "✓ Q25 Nginx+MySQL running on port 8080"

# Q26
cd ../26 && docker-compose up -d
echo "✓ Q26 Web Form running on port 8081"

# Q27
cd ../27 && docker-compose up -d
echo "✓ Q27 Volume mount demo running"

# Q28
cd ../28 && docker build -t java-app . && docker run --rm java-app
echo "✓ Q28 Java app executed"

# Q29
cd ../29 && docker-compose up -d
echo "✓ Q29 MediaWiki running on port 8080"

# Q30
cd ../30 && docker build -t c-linked-list . && docker run --rm c-linked-list
echo "✓ Q30 C program executed"

# Q31
cd ../31 && docker-compose up -d
echo "✓ Q31 LAMP Blog running on port 8083"

# Q32
cd ../32 && docker build -t dockerfile-demo . && docker run -d -p 8000:8000 --name df-demo dockerfile-demo
echo "✓ Q32 Dockerfile demo running on port 8000"

# Q33
cd ../33 && docker-compose up -d
echo "✓ Q33 Compose demo running on port 8080"

echo ""
echo "All questions tested! Access URLs:"
echo "Q23: http://localhost:7000"
echo "Q24: http://localhost:6000"
echo "Q25: http://localhost:8080"
echo "Q26: http://localhost:8081"
echo "Q27: Check shared-data folder"
echo "Q29: http://localhost:8080 (MediaWiki)"
echo "Q31: http://localhost:8083"
echo "Q32: http://localhost:8000"
echo "Q33: http://localhost:8080"
```

## Verification Checklist

- [ ] Q23: Flask login works at http://localhost:7000
- [ ] Q24: Django login works at http://localhost:6000
- [ ] Q25: Nginx serves page at http://localhost:8080
- [ ] Q26: Form submits data at http://localhost:8081
- [ ] Q27: Files appear in shared-data/ folder
- [ ] Q28: Java output shows calculator results
- [ ] Q29: MediaWiki setup page appears
- [ ] Q30: C program shows linked list operations
- [ ] Q31: Blog posts display at http://localhost:8083
- [ ] Q32: Health check returns OK at http://localhost:8000/health
- [ ] Q33: Web page loads at http://localhost:8080

## Troubleshooting

### Port Already in Use
```bash
# Find process using port
lsof -i :7000
# Or
netstat -tulpn | grep 7000

# Kill process or change port in docker-compose.yml
```

### Container Won't Start
```bash
# Check logs
docker logs <container-name>
docker-compose logs <service-name>

# Check if image built correctly
docker images | grep <image-name>
```

### Database Connection Failed
```bash
# Wait for database to be ready
docker-compose logs database

# Check health status
docker ps --format "table {{.Names}}\t{{.Status}}"

# Restart services
docker-compose restart
```

### Permission Denied
```bash
# Fix file permissions
chmod +x script.sh

# Fix directory permissions
chmod -R 755 directory/
```
