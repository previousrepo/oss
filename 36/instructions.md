# MantisBT Bug Tracker - Docker Image

Same as Question 34. Use the same setup.

## Quick Start

```bash
cd 36
docker-compose down -v
docker-compose up -d --build
sleep 40
```

Open: http://localhost:8080
Login: mantisbt / mantisbt

## Push to Docker Hub

```bash
docker tag 36-mantisbt YOUR_USERNAME/mantisbt
docker push YOUR_USERNAME/mantisbt
```
