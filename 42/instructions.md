# WordPress with MySQL using Docker Compose

## Deploy

### Start the services
```bash
docker-compose up -d
```

### Check status
```bash
docker-compose ps
```

### View logs
```bash
docker-compose logs -f
```

### Access WordPress
Open browser: http://localhost:8081

Complete the WordPress installation wizard.

### Stop services
```bash
docker-compose down
```

### Stop and remove volumes (clean slate)
```bash
docker-compose down -v
```

## Troubleshooting

### Check MySQL connection
```bash
docker exec -it wordpress_mysql mysql -u wordpress -pwordpress
```

### Check WordPress logs
```bash
docker logs wordpress_app
```

### Restart services
```bash
docker-compose restart
```
