# LAMP Stack from Docker Hub - Modern Way

## Run with Docker Compose

```bash
docker compose up -d
```

That's it. Done.

## Access Application

Open: http://localhost:8080

## Database Connection

Your PHP app can connect to MySQL using:
- Host: `mysql`
- User: `root`
- Password: `root`
- Database: `myapp`

## View Logs

```bash
docker compose logs -f
```

## Stop

```bash
docker compose down
```

## Clean Everything

```bash
docker compose down -v
```
