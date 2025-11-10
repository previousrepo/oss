# Nginx Load Balancer with Multiple Backend Apps

## Deploy

```bash
docker-compose up -d --build
```

## Access Load Balanced Application

Open browser: http://localhost:8080

Refresh multiple times to see different backend servers responding!

## View Logs

```bash
docker-compose logs -f nginx
docker-compose logs -f app1
```

## Test Load Balancing

```bash
for i in {1..10}; do curl http://localhost:8080; echo ""; done
```

## Stop

```bash
docker-compose down
```

## How It Works

- 3 Flask backend applications (app1, app2, app3)
- Nginx load balancer distributes requests
- Round-robin load balancing
- Each app shows its hostname
