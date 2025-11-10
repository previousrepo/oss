# Question 27: Mount Host Directory to Container

## Method 1: Using docker run with bind mount

```bash
cd others/27

# Create a directory on host
mkdir -p host-data
echo "Hello from host!" > host-data/test.txt

# Run container with mounted directory
docker run -d --name mount-demo \
  -v $(pwd)/host-data:/container-data \
  -p 8082:80 \
  nginx:alpine

# Verify mount
docker exec mount-demo ls -la /container-data
docker exec mount-demo cat /container-data/test.txt

# Create file from container
docker exec mount-demo sh -c "echo 'Hello from container!' > /container-data/from-container.txt"

# Check on host
cat host-data/from-container.txt
```

## Method 2: Using Docker Compose

```bash
# Start with docker-compose
docker-compose up -d

# Check mounted files
docker-compose exec web ls -la /app/shared

# Create file from container
docker-compose exec web sh -c "echo 'Test' > /app/shared/test.txt"

# Verify on host
ls -la shared-data/
```

## Method 3: Read-only Mount

```bash
docker run -d --name readonly-demo \
  -v $(pwd)/host-data:/data:ro \
  nginx:alpine

# Try to write (will fail)
docker exec readonly-demo sh -c "echo 'test' > /data/test.txt"
```

## Clean Up

```bash
docker stop mount-demo readonly-demo
docker rm mount-demo readonly-demo
docker-compose down
```

## Key Concepts

- Bind mounts: Direct mapping of host directory
- Named volumes: Docker-managed storage
- Read-only mounts: Prevent container writes
- Data persistence across container restarts
