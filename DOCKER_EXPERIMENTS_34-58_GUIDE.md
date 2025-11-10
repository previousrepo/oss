# Docker Experiments (34-58) - Complete Theory & Explanation Guide

## Overview

Questions 34-58 focus on **Docker containerization** - packaging applications with their dependencies into isolated, portable containers. This is the modern way to deploy applications.

---

## PART 1: BASIC CONCEPTS

### What is Docker?

Docker is a platform for developing, shipping, and running applications in **containers**.

**Container vs Virtual Machine:**
- **VM**: Full OS, heavy (GBs), slow startup (minutes)
- **Container**: Shares host OS kernel, lightweight (MBs), fast startup (seconds)

**Key Components:**
1. **Dockerfile**: Recipe to build an image (like a cooking recipe)
2. **Image**: Template/snapshot of application (like a class in OOP)
3. **Container**: Running instance of image (like an object in OOP)
4. **Docker Hub**: Repository to store and share images (like GitHub for code)

**Why Docker?**
- **Portability**: "Works on my machine" → Works everywhere
- **Isolation**: Each container is isolated from others
- **Consistency**: Same environment in dev, test, production
- **Efficiency**: Lightweight compared to VMs
- **Scalability**: Easy to run multiple instances

---

## PART 2: EXPERIMENTS BREAKDOWN

### Questions 34-36: Bug Tracking Tools in Docker

**What You're Doing:**
Containerizing bug tracking software (MantisBT/Bugzilla) so it can run anywhere without complex installation.

**Theory:**
- Bug tracking tools need: Web server (Apache), Database (MySQL), PHP
- Instead of installing all these on your system, package them in a container
- The container has everything pre-configured

**Implementation:**
1. Create Dockerfile with base image (Ubuntu/PHP)
2. Install dependencies (Apache, MySQL, PHP)
3. Download and configure bug tracker
4. Build image: `docker build -t mantisbt .`
5. Run container: `docker run -p 8080:80 mantisbt`
6. Push to Docker Hub: `docker push username/mantisbt`

**What Sir Might Ask:**
- "Why use Docker instead of installing directly?" → Portability, isolation, easy cleanup
- "What's the difference between image and container?" → Image is template, container is running instance
- "How do you persist data?" → Use Docker volumes
- "Show me the Dockerfile" → Explain each line (FROM, RUN, COPY, CMD)

**Possible Changes:**
- Use different bug tracker (Redmine, Trac)
- Add email configuration
- Use different database (PostgreSQL)
- Add SSL/HTTPS support

---

### Question 35: Java Application in Docker

**What You're Doing:**
Creating a Docker image with Ubuntu + OpenJDK, then running a Java application inside it.

**Theory:**
- Java applications need JDK/JRE to run
- Instead of "Please install Java 11", you provide a container with Java pre-installed
- The container includes: OS (Ubuntu) + Java + Your application

**Implementation:**
```dockerfile
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y openjdk-11-jdk
COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
```

**What Sir Might Ask:**
- "Why not use java:11 base image?" → We can, but question asks for Ubuntu + OpenJDK
- "What's the difference between RUN and CMD?" → RUN executes during build, CMD runs when container starts
- "How to pass arguments to Java app?" → Use CMD with parameters or ENTRYPOINT

**Possible Changes:**
- Use different Java version (8, 17)
- Add JAR file instead of .java
- Use multi-stage build (compile in one stage, run in another)
- Add environment variables

---

### Questions 37-39: Inter-Container Communication

**What You're Doing:**
Creating multiple containers that communicate with each other using different methods.

**Theory - Three Communication Methods:**

**Q37: TCP Sockets**
- Traditional network communication
- Client connects to server on specific port (9999)
- Like phone call between two people

**Q38: IPC (Unix Sockets)**
- File-based communication
- Faster than TCP (no network overhead)
- Both containers share a volume with socket file
- Like passing notes through a shared mailbox

**Q39: HTTP/REST API**
- Modern web service communication
- Client makes HTTP requests (GET, POST)
- Server responds with JSON
- Like filling out a web form

**Implementation:**
- Create server container (listens for connections)
- Create client container (sends requests)
- Connect via Docker network
- Use docker-compose for orchestration

**What Sir Might Ask:**
- "Which method is fastest?" → IPC (Unix sockets), then TCP, then HTTP
- "Why use HTTP if it's slower?" → Standard protocol, works across internet, easy debugging
- "How do containers find each other?" → Docker DNS resolves service names
- "What's docker-compose?" → Tool to manage multi-container applications

**Possible Changes:**
- Add more clients
- Implement different protocols (gRPC, WebSocket)
- Add message queue (RabbitMQ, Redis)
- Implement load balancing

---

### Questions 40, 48, 53: LAMP Stack

**What You're Doing:**
Running a complete web application stack (Linux, Apache, MySQL, PHP) in Docker.

**Theory:**
- LAMP = Linux + Apache (web server) + MySQL (database) + PHP (programming language)
- Traditional web hosting stack
- All components packaged in one or multiple containers

**Two Approaches:**
1. **Single container**: All services in one container (simpler but not best practice)
2. **Multi-container**: Separate containers for web and database (better, scalable)

**Implementation (Multi-container):**
```yaml
services:
  web:
    image: php-apache
    ports: ["8080:80"]
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
```

**What Sir Might Ask:**
- "Why separate containers?" → Scalability, easier updates, follows microservices pattern
- "How does PHP connect to MySQL?" → Using service name as hostname
- "What if database crashes?" → Only database container restarts, web stays up
- "How to backup database?" → Use Docker volumes, export SQL dumps

**Possible Changes:**
- Add phpMyAdmin for database management
- Use Nginx instead of Apache
- Add Redis for caching
- Implement connection pooling

---

### Questions 41, 43, 45, 49, 51: Web Applications with Login

**What You're Doing:**
Creating web applications with user authentication, containerized with Docker.

**Theory:**
- Web app needs: Web framework (Flask/Express), HTML templates, session management
- Login requires: Form validation, password hashing, session cookies
- Container packages: Application code + dependencies + web server

**Implementation (Flask example):**
```python
from flask import Flask, render_template, session
app = Flask(__name__)

@app.route('/login', methods=['POST'])
def login():
    # Validate credentials
    # Set session
    return redirect('/dashboard')
```

**Dockerfile:**
```dockerfile
FROM python:3.9
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py templates/ .
CMD ["python", "app.py"]
```

**What Sir Might Ask:**
- "How do you store passwords?" → Hash with bcrypt/argon2, never plain text
- "What about sessions?" → Use Flask sessions or Redis
- "How to handle multiple users?" → Database for user storage
- "Is this production-ready?" → Need HTTPS, rate limiting, CSRF protection

**Possible Changes:**
- Add registration page
- Implement "forgot password"
- Add OAuth (Google/GitHub login)
- Use JWT tokens instead of sessions
- Add two-factor authentication

---

### Question 42: WordPress + MySQL with Docker Compose

**What You're Doing:**
Deploying WordPress (popular CMS) with MySQL database using docker-compose.

**Theory:**
- **Docker Compose**: Tool to define and run multi-container applications
- Uses YAML file to configure services
- One command to start everything: `docker-compose up`

**Why This Matters:**
- WordPress needs MySQL to store content
- Two containers must communicate
- Compose handles networking, volumes, dependencies automatically

**Implementation:**
```yaml
services:
  wordpress:
    image: wordpress
    depends_on: [mysql]
    ports: ["8080:80"]
  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root
```

**What Sir Might Ask:**
- "What does depends_on do?" → Ensures MySQL starts before WordPress
- "How does WordPress know MySQL address?" → Docker DNS resolves 'mysql' to container IP
- "What if I restart?" → Volumes persist data
- "Can I use this in production?" → Yes, but add backups, monitoring, SSL

**Possible Changes:**
- Add phpMyAdmin
- Use MariaDB instead of MySQL
- Add Redis for caching
- Configure custom theme
- Add backup container

---

### Question 44: Nginx Load Balancer

**What You're Doing:**
Using Nginx to distribute traffic across multiple application containers.

**Theory:**
- **Load Balancing**: Distributing requests across multiple servers
- **Why**: Prevents single server overload, provides redundancy
- **Nginx**: Acts as reverse proxy, forwards requests to backend servers

**How It Works:**
```
User → Nginx (port 80) → App1 (port 5000)
                       → App2 (port 5000)
                       → App3 (port 5000)
```

**Algorithms:**
- **Round Robin**: Request 1→App1, Request 2→App2, Request 3→App3, repeat
- **Least Connections**: Send to server with fewest active connections
- **IP Hash**: Same client always goes to same server

**Implementation:**
```nginx
upstream backend {
    server app1:5000;
    server app2:5000;
    server app3:5000;
}
server {
    location / {
        proxy_pass http://backend;
    }
}
```

**What Sir Might Ask:**
- "What if one app crashes?" → Nginx detects and stops sending traffic to it
- "How to add more apps?" → Scale up: `docker-compose up --scale app=5`
- "What's the benefit?" → High availability, scalability, no single point of failure
- "Can you show it working?" → Make requests, check which container responds

**Possible Changes:**
- Add health checks
- Implement sticky sessions
- Add SSL termination
- Configure caching
- Add rate limiting

---

### Questions 46, 50, 52: Port Mapping

**What You're Doing:**
Running containers and mapping their internal ports to host ports.

**Theory:**
- Containers have internal network (isolated)
- Port mapping exposes container port to host
- Format: `-p HOST_PORT:CONTAINER_PORT`

**Examples:**
```bash
-p 80:80      # Host port 80 → Container port 80
-p 8080:80    # Host port 8080 → Container port 80
-p 5000:5000  # Host port 5000 → Container port 5000
```

**Why Different Ports:**
- Port 80 might be used on host
- Multiple containers can't use same host port
- Avoid conflicts with existing services

**What Sir Might Ask:**
- "What if port is already in use?" → Change host port or stop conflicting service
- "Can multiple containers use same internal port?" → Yes, but different host ports
- "How to find which port is used?" → `docker ps` or `netstat -tuln`

**Possible Changes:**
- Use different ports
- Add multiple port mappings
- Use host networking mode
- Implement port range mapping

---

### Question 47: Python Calculator in Docker

**What You're Doing:**
Creating a simple Python application (calculator) and containerizing it.

**Theory:**
- Demonstrates basic Python containerization
- Shows how to package CLI applications
- Good starting point for understanding Docker

**Implementation:**
```dockerfile
FROM python:3.9-slim
COPY calculator.py .
CMD ["python", "calculator.py"]
```

**What Sir Might Ask:**
- "Why python:3.9-slim?" → Smaller image size (slim = minimal packages)
- "How to provide input?" → Use `-it` flag for interactive mode
- "Can you add more features?" → Yes, add more operations, save history, etc.

**Possible Changes:**
- Add scientific calculator functions
- Save calculation history to file
- Create web interface
- Add unit tests

---

### Question 54: HTTP Web Server

**What You're Doing:**
Creating a simple HTTP web server in a container, serving static files.

**Theory:**
- HTTP server serves files over HTTP protocol
- Can use Python's built-in server, Node.js, or Nginx
- Container packages server + content

**Implementation (Python):**
```python
from http.server import HTTPServer, SimpleHTTPRequestHandler
HTTPServer(('0.0.0.0', 5000), SimpleHTTPRequestHandler).serve_forever()
```

**What Sir Might Ask:**
- "Why 0.0.0.0 instead of localhost?" → 0.0.0.0 listens on all interfaces (accessible from outside container)
- "What's the difference from Apache?" → This is simpler, Apache is production-grade
- "How to serve dynamic content?" → Use Flask, Express, or other framework

**Possible Changes:**
- Add custom HTML pages
- Implement routing
- Add file upload
- Enable directory listing

---

### Questions 55, 57: FTP and Telnet in Containers

**What You're Doing:**
Running FTP (file transfer) and Telnet (remote access) servers in containers.

**Theory:**
- **FTP**: File Transfer Protocol (port 21) - for transferring files
- **Telnet**: Remote terminal access (port 23) - for remote command execution
- **Both are insecure** - data sent in plain text

**Why Containerize:**
- Isolation from host system
- Easy to start/stop
- No system pollution
- Educational purposes (don't use in production!)

**Modern Alternatives:**
- FTP → SFTP, SCP, rsync, cloud storage
- Telnet → SSH (encrypted)

**What Sir Might Ask:**
- "Why are these insecure?" → No encryption, passwords visible on network
- "What should we use instead?" → SSH for remote access, SFTP for file transfer
- "Why learn them?" → Legacy systems, understanding protocols, historical context
- "How to test?" → Use curl for FTP, netcat for Telnet

**Possible Changes:**
- Add FTPS (FTP over SSL)
- Configure user authentication
- Add SSH instead of Telnet
- Implement file permissions

---

### Questions 56, 58: NIS and NFS in Containers

**What You're Doing:**
Attempting to run NIS (user management) and NFS (network file system) in containers.

**Theory:**
- **NIS**: Network Information Service - centralized user account management
- **NFS**: Network File System - share directories over network
- **Problem**: Both designed for VMs/physical servers, not containers

**Why It Doesn't Work Well:**
1. NFS needs kernel modules (containers share host kernel)
2. Requires privileged mode (defeats container security)
3. Complex networking setup
4. Containers are meant to be stateless

**What to Tell Sir:**
"NIS and NFS are designed for traditional servers, not containers. Containers are meant to be stateless and isolated. Implementing these requires privileged mode which defeats containerization benefits. In production, we use Docker volumes for file sharing and LDAP/OAuth for user management."

**Modern Alternatives:**
- File sharing → Docker volumes, Kubernetes PersistentVolumes, cloud storage
- User management → LDAP, Active Directory, OAuth, SAML

**What Sir Might Ask:**
- "Why not use containers?" → Architectural mismatch, security concerns
- "What's the alternative?" → Kubernetes for orchestration, cloud storage for files
- "Can you show something?" → Explain the concept, show why it's impractical
- "What about in production?" → Use managed services (EFS, Azure Files, etc.)

**Possible Changes:**
- Demonstrate Docker volumes instead
- Show Kubernetes PersistentVolumes
- Implement LDAP authentication
- Use cloud storage (S3, Azure Blob)

---

## PART 3: COMMON QUESTIONS SIR MIGHT ASK

### General Docker Questions

**Q: What's the difference between Docker and VM?**
A: VM includes full OS (heavy), Docker shares host kernel (lightweight). Docker is faster to start and uses less resources.

**Q: What is a Dockerfile?**
A: A text file with instructions to build a Docker image. Like a recipe for creating the image.

**Q: What's the difference between COPY and ADD?**
A: COPY just copies files. ADD can also extract archives and download from URLs. Use COPY unless you need ADD's features.

**Q: What's the difference between CMD and ENTRYPOINT?**
A: CMD provides default command (can be overridden). ENTRYPOINT defines the main command (harder to override). Often used together.

**Q: How to see running containers?**
A: `docker ps` (running only) or `docker ps -a` (all containers)

**Q: How to enter a running container?**
A: `docker exec -it container_name bash`

**Q: How to view logs?**
A: `docker logs container_name` or `docker logs -f container_name` (follow mode)

**Q: What are Docker volumes?**
A: Persistent storage for containers. Data survives container deletion.

**Q: What is Docker Compose?**
A: Tool to define and run multi-container applications using YAML file.

**Q: What is Docker Hub?**
A: Public registry to store and share Docker images (like GitHub for images).

### Networking Questions

**Q: How do containers communicate?**
A: Through Docker networks. Containers on same network can reach each other by service name.

**Q: What is port mapping?**
A: Exposing container port to host. Format: `-p host_port:container_port`

**Q: What's the difference between bridge and host network?**
A: Bridge (default) = isolated network. Host = container uses host's network directly.

**Q: How does DNS work in Docker?**
A: Docker has built-in DNS. Containers can reach each other using service names.

### Security Questions

**Q: Are containers secure?**
A: Yes, if configured properly. Use non-root users, scan images, limit resources, avoid privileged mode.

**Q: What is privileged mode?**
A: Gives container full access to host. Dangerous, avoid unless absolutely necessary.

**Q: How to scan images for vulnerabilities?**
A: Use `docker scan image_name` or tools like Trivy, Clair.

### Best Practices Questions

**Q: Should I use latest tag?**
A: No, use specific versions (e.g., `python:3.9` not `python:latest`) for reproducibility.

**Q: How to make images smaller?**
A: Use slim/alpine base images, multi-stage builds, remove unnecessary files, combine RUN commands.

**Q: One process per container or multiple?**
A: One process per container (microservices pattern). Easier to scale and manage.

**Q: How to handle secrets?**
A: Use Docker secrets, environment variables, or secret management tools (Vault). Never hardcode in Dockerfile.

---

## PART 4: DEMONSTRATION TIPS

### How to Present to Sir

1. **Start with Theory**: Explain what you're doing and why
2. **Show Dockerfile**: Walk through each line
3. **Build Image**: `docker build -t myapp .`
4. **Run Container**: `docker run -p 8080:80 myapp`
5. **Demonstrate**: Open browser, show it working
6. **Show Logs**: `docker logs container_name`
7. **Explain Benefits**: Portability, isolation, scalability

### Common Demo Flow

```bash
# 1. Show Dockerfile
cat Dockerfile

# 2. Build image
docker build -t myapp .

# 3. List images
docker images

# 4. Run container
docker run -d -p 8080:80 --name myapp-container myapp

# 5. Check running containers
docker ps

# 6. Test application
curl http://localhost:8080
# or open in browser

# 7. View logs
docker logs myapp-container

# 8. Enter container (if needed)
docker exec -it myapp-container bash

# 9. Stop and remove
docker stop myapp-container
docker rm myapp-container

# 10. Push to Docker Hub (if asked)
docker tag myapp username/myapp
docker push username/myapp
```

### Troubleshooting Tips

**Container exits immediately:**
- Check logs: `docker logs container_name`
- Run interactively: `docker run -it myapp bash`
- Ensure CMD/ENTRYPOINT is correct

**Port already in use:**
- Change host port: `-p 8081:80`
- Find what's using port: `netstat -tuln | grep 8080`
- Stop conflicting service

**Can't connect to container:**
- Check port mapping: `docker ps`
- Verify container is running: `docker ps`
- Check firewall rules
- Use 0.0.0.0 not localhost in container

**Image too large:**
- Use slim/alpine base images
- Use multi-stage builds
- Remove unnecessary files
- Combine RUN commands

---

## PART 5: QUICK REFERENCE

### Essential Docker Commands

```bash
# Images
docker build -t name .          # Build image
docker images                   # List images
docker rmi image_name           # Remove image
docker pull image_name          # Download image
docker push image_name          # Upload image

# Containers
docker run image_name           # Run container
docker ps                       # List running containers
docker ps -a                    # List all containers
docker stop container_name      # Stop container
docker start container_name     # Start container
docker restart container_name   # Restart container
docker rm container_name        # Remove container
docker logs container_name      # View logs
docker exec -it container bash  # Enter container

# Docker Compose
docker-compose up               # Start services
docker-compose up -d            # Start in background
docker-compose down             # Stop services
docker-compose ps               # List services
docker-compose logs             # View logs

# Cleanup
docker system prune             # Remove unused data
docker volume prune             # Remove unused volumes
docker network prune            # Remove unused networks
```

### Dockerfile Instructions

```dockerfile
FROM image:tag              # Base image
RUN command                 # Execute command during build
COPY source dest            # Copy files from host
ADD source dest             # Copy + extract/download
WORKDIR /path               # Set working directory
ENV KEY=value               # Set environment variable
EXPOSE port                 # Document port (doesn't publish)
CMD ["command"]             # Default command
ENTRYPOINT ["command"]      # Main command
VOLUME /path                # Create mount point
USER username               # Set user
```

---

## SUMMARY

**Questions 34-58 teach you:**
1. How to containerize applications
2. Multi-container communication
3. Docker networking and volumes
4. Docker Compose for orchestration
5. Load balancing and scaling
6. When to use containers (and when not to)

**Key Takeaways:**
- Docker makes applications portable and consistent
- Containers are lightweight and fast
- Use docker-compose for multi-container apps
- Not everything belongs in containers (NIS/NFS)
- Security and best practices matter

**For Your Lab:**
- Understand the theory behind each experiment
- Be able to explain why Docker is useful
- Know the difference between images and containers
- Understand networking and port mapping
- Be ready to modify and extend experiments

Good luck with your presentation! 🚀
