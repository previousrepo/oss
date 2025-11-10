# Question 33: Comprehensive Docker Compose with All Fields

## Setup and Run

```bash
cd others/33

# Create required directories
mkdir -p data/mysql web/config api database

# Set build date
export BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')

# Start all services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

## Access Services

- Web: http://localhost:8080
- API: http://localhost:3000
- MySQL: localhost:3306
- Redis: localhost:6379

## Inspect Configuration

```bash
# View service configuration
docker-compose config

# View specific service
docker-compose config web

# Validate compose file
docker-compose config --quiet
```

## Test Services

```bash
# Test web service
curl http://localhost:8080

# Test API
curl http://localhost:3000

# Test database
docker-compose exec database mysql -u appuser -papppass appdb -e "SHOW TABLES;"

# Test cache
docker-compose exec cache redis-cli ping
```

## View Resource Usage

```bash
# View stats
docker stats

# View specific service
docker stats compose-web

# View networks
docker network ls | grep compose

# View volumes
docker volume ls | grep compose
```

## Scale Services

```bash
# Scale web service
docker-compose up -d --scale web=3

# View scaled services
docker-compose ps
```

## Stop and Clean Up

```bash
# Stop services
docker-compose stop

# Remove containers
docker-compose down

# Remove with volumes
docker-compose down -v

# Remove with images
docker-compose down --rmi all
```

## Docker Compose Fields Demonstrated

### Service Level:
- build (context, dockerfile, args, cache_from, labels)
- image
- container_name, hostname, domainname
- ports, expose
- environment, env_file
- volumes (bind mounts, named volumes, tmpfs)
- networks
- depends_on (with conditions)
- restart
- deploy (resources, replicas, update_config, restart_policy)
- healthcheck
- command, entrypoint, working_dir
- user
- labels
- logging
- dns, dns_search, extra_hosts
- security_opt, cap_add, cap_drop
- stop_grace_period, stop_signal
- tmpfs, stdin_open, tty
- ulimits

### Top Level:
- version
- services
- networks (driver, driver_opts, ipam, labels)
- volumes (driver, driver_opts, labels)
- configs (Swarm mode)
- secrets (Swarm mode)
- x-* extensions

## Key Concepts

- Multi-service orchestration
- Service dependencies and health checks
- Network isolation and communication
- Volume management and persistence
- Resource limits and constraints
- Logging and monitoring
- Security configurations
