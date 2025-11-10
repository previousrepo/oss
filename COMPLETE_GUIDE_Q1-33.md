# Complete Guide: Questions 1-33 (Quick Reference)

**Read Time: 5-10 minutes** | **Last Updated: Nov 2025**

This guide covers ALL 33 questions from the OSS lab. Questions 1-22 are in numbered folders, Questions 23-33 are in the `others/` folder.

---

## 📋 Quick Overview

### Questions 1-10: Version Control & Collaboration
| # | Topic | Key Tool | What You'll Do |
|---|-------|----------|----------------|
| 1 | Git Local (Multiple Users) | Git | Create branches, merge, compare with SVN |
| 2 | Git Remote (GitHub) | Git + GitHub | Push/pull, fork, collaborate online |
| 3 | Git Advanced | Git | Rebase, cherry-pick, stash, advanced workflows |
| 4 | Mercurial Local | Mercurial (hg) | Similar to Git but different VCS |
| 5 | Mercurial Remote | hg + Bitbucket | Push/pull with Mercurial |
| 6 | Subversion (SVN) | SVN | Centralized VCS, compare with Git |
| 7 | Code Review Tools | Gerrit/Review Board | Review code changes before merge |
| 8 | Continuous Integration | Jenkins/Travis CI | Automated build and test |
| 9 | Documentation Tools | Sphinx/Doxygen | Generate docs from code |
| 10 | CMS - Joomla | Joomla | Content management system |

### Questions 11-22: Project Management & Tools
| # | Topic | Key Tool | What You'll Do |
|---|-------|----------|----------------|
| 11 | CMS - WordPress | WordPress | Blog/website management |
| 12 | CMS - Drupal | Drupal | Enterprise CMS |
| 13 | Build Tools | Make/Ant/Maven | Automate compilation |
| 14 | Issue Tracking | JIRA/Redmine | Track bugs and tasks |
| 15 | Code Quality | SonarQube | Analyze code quality |
| 16 | Testing Tools | JUnit/Selenium | Unit and UI testing |
| 17 | Deployment Tools | Ansible/Chef | Automate deployment |
| 18 | Monitoring Tools | Nagios/Zabbix | Monitor systems |
| 19 | Collaboration | Slack/Mattermost | Team communication |
| 20 | Bug Tracking | YouTrack | Track and manage bugs |
| 21 | Package Managers | npm/pip/apt | Manage dependencies |
| 22 | Containerization | Docker Basics | Container fundamentals |

### Questions 23-33: Docker Deep Dive (others/ folder)
| # | Topic | Tech Stack | Port | What You'll Build |
|---|-------|-----------|------|-------------------|
| 23 | Flask Login | Python + Flask | 7000 | Simple login form |
| 24 | Django Login | Python + Django | 6000 | Full auth system |
| 25 | Nginx + MySQL | Nginx + MySQL | 8080 | Multi-container setup |
| 26 | PHP Form + DB | PHP + MySQL + Nginx | 8081 | CRUD web form |
| 27 | Volume Mounting | Docker Volumes | 8082 | Data persistence |
| 28 | Java in Docker | Ubuntu + OpenJDK | - | Containerized Java app |
| 29 | LAMP + MediaWiki | Apache + MySQL + PHP | 8080 | Wiki platform |
| 30 | C Program | Alpine + GCC | - | Linked list in C |
| 31 | Custom LAMP App | Apache + MySQL + PHP | 8083 | Blog application |
| 32 | Dockerfile Fields | All Dockerfile features | 8000 | Complete Dockerfile demo |
| 33 | Compose Fields | All Compose features | 8080 | Multi-service orchestration |

---

## 🚀 Quick Start Commands

### Questions 1-22 (Main Folders)
Most questions have similar structure:
```bash
cd <question-number>/
cat info.txt              # Read problem statement
cat instructions.md       # Follow setup guide
# Then follow specific instructions for that question
```

### Questions 23-33 (Docker - others/ folder)

**Single Container Apps:**
```bash
# Q23: Flask Login
cd others/23 && docker build -t flask-login . && docker run -p 7000:7000 flask-login

# Q24: Django Login  
cd others/24 && docker build -t django-login . && docker run -p 6000:6000 django-login

# Q28: Java App
cd others/28 && docker build -t java-app . && docker run java-app

# Q30: C Program
cd others/30 && docker build -t c-linked-list . && docker run c-linked-list

# Q32: Dockerfile Demo
cd others/32 && docker build -t dockerfile-demo . && docker run -p 8000:8000 dockerfile-demo
```

**Multi-Container Apps (docker-compose):**
```bash
# Q25: Nginx + MySQL
cd others/25 && docker-compose up -d

# Q26: PHP Form
cd others/26 && docker-compose up -d

# Q27: Volume Mount
cd others/27 && docker-compose up -d

# Q29: MediaWiki LAMP
cd others/29 && docker-compose up -d

# Q31: Custom LAMP Blog
cd others/31 && docker-compose up -d

# Q33: Complete Compose Demo
cd others/33 && docker-compose up -d
```

---

## 🎯 Key Concepts by Category

### Version Control (Q1-6)
**Git Workflow:**
```bash
git init                    # Initialize repo
git add .                   # Stage changes
git commit -m "message"     # Commit
git branch feature          # Create branch
git checkout feature        # Switch branch
git merge feature           # Merge branch
git push origin main        # Push to remote
```

**Key Differences:**
- **Git**: Distributed, fast, branching is easy
- **Mercurial**: Distributed, simpler commands
- **SVN**: Centralized, linear history

### Docker Fundamentals (Q22-33)

**Core Concepts:**
1. **Image**: Blueprint for containers (like a class)
2. **Container**: Running instance (like an object)
3. **Volume**: Persistent data storage
4. **Network**: Container communication
5. **Compose**: Multi-container orchestration

**Essential Commands:**
```bash
# Images
docker build -t name .      # Build image
docker images               # List images
docker rmi image            # Remove image

# Containers
docker run -p 8080:80 name  # Run container
docker ps                   # List running
docker stop container       # Stop
docker rm container         # Remove
docker logs container       # View logs
docker exec -it container bash  # Enter container

# Compose
docker-compose up -d        # Start all services
docker-compose ps           # List services
docker-compose logs -f      # Follow logs
docker-compose down         # Stop and remove
docker-compose down -v      # Also remove volumes
```

### Web Stacks

**LAMP Stack (Q29, Q31):**
- **L**inux: Operating system
- **A**pache: Web server
- **M**ySQL: Database
- **P**HP: Programming language

**LEMP Stack (Q26):**
- **L**inux
- **E**nginx (pronounced "engine-x")
- **M**ySQL
- **P**HP

---

## 💡 Common Patterns

### Pattern 1: Simple Web App (Q23, Q24, Q28, Q30, Q32)
```dockerfile
FROM base-image
COPY requirements.txt .
RUN install-dependencies
COPY . .
CMD ["start-command"]
```

### Pattern 2: Multi-Container App (Q25, Q26, Q29, Q31, Q33)
```yaml
services:
  web:
    build: .
    ports:
      - "8080:80"
    depends_on:
      - database
  
  database:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
    volumes:
      - db-data:/var/lib/mysql

volumes:
  db-data:
```

### Pattern 3: Volume Mounting (Q27)
```yaml
volumes:
  # Named volume (managed by Docker)
  - db-data:/var/lib/mysql
  
  # Bind mount (host directory)
  - ./html:/usr/share/nginx/html
  
  # Read-only mount
  - ./config.php:/app/config.php:ro
```

---

## 🔧 Troubleshooting Guide

### Port Already in Use
```bash
# Find what's using the port
lsof -i :8080
# Or
netstat -tulpn | grep 8080

# Kill the process or change port in docker-compose.yml
```

### Container Won't Start
```bash
# Check logs
docker logs container-name
docker-compose logs service-name

# Check if image built correctly
docker images

# Rebuild without cache
docker build --no-cache -t name .
```

### Database Connection Failed
```bash
# Wait for database to be ready
docker-compose logs database

# Check container health
docker ps

# In Docker, use container name as hostname
# ✓ Correct: mysql
# ✗ Wrong: localhost or 127.0.0.1
```

### Permission Denied
```bash
# Fix file permissions
chmod +x script.sh
chmod -R 755 directory/

# Run as root in container
docker exec -u root container-name bash
```

### Can't Access Website
```bash
# Check if container is running
docker ps

# Check port mapping
docker port container-name

# Check firewall
sudo ufw status

# Test from inside container
docker exec container-name curl localhost:80
```

---

## 📝 Lab Exam Tips

### For Viva/Explanation:

**1. Start with the Big Picture:**
"This question demonstrates [concept]. I'm using [tools] to [objective]."

**2. Explain the Architecture:**
"The system has [X] components: [list them]. They communicate via [method]."

**3. Walk Through the Flow:**
"When a user [action], the system [step 1], then [step 2], finally [result]."

**4. Highlight Key Concepts:**
"The important concepts here are [concept 1], [concept 2], and [concept 3]."

**5. Compare/Contrast:**
"Compared to [alternative], this approach [advantages/disadvantages]."

### Common Questions Examiners Ask:

**Q: Why use Docker?**
A: Consistency (works everywhere), isolation (no conflicts), portability (easy deployment), efficiency (lightweight vs VMs).

**Q: What's the difference between image and container?**
A: Image is the blueprint (static), container is the running instance (dynamic). Like class vs object.

**Q: Why use docker-compose?**
A: Manage multiple containers together, define entire stack in one file, easy to start/stop all services.

**Q: What are volumes for?**
A: Persist data beyond container lifecycle. Without volumes, data is lost when container stops.

**Q: Git vs SVN?**
A: Git is distributed (full history locally), SVN is centralized (need server). Git has better branching, SVN is simpler.

---

## 🎓 Question-Specific Quick Notes

### Q23: Flask Login
- Microframework, minimal setup
- Session-based auth
- Templates with Jinja2
- Good for: Small apps, APIs, learning

### Q24: Django Login
- Full framework, batteries included
- Built-in admin panel
- ORM for database
- Good for: Large apps, rapid development

### Q29: MediaWiki LAMP
- **IMPORTANT**: Two-step setup!
  1. Start containers (will show error - normal!)
  2. Run web installer → generates LocalSettings.php
  3. Mount LocalSettings.php
  4. Restart → works!
- Database tables created during installation
- Use "mysql" as hostname, NOT "localhost"

### Q32: All Dockerfile Fields
Demonstrates ALL Dockerfile instructions:
- FROM, LABEL, ARG, ENV
- WORKDIR, RUN, COPY, ADD
- USER, VOLUME, EXPOSE
- HEALTHCHECK, ONBUILD
- STOPSIGNAL, SHELL
- CMD, ENTRYPOINT

### Q33: All Compose Fields
Demonstrates ALL docker-compose features:
- Multiple services
- Networks and volumes
- Health checks
- Resource limits
- Dependencies
- Build args
- Logging config

---

## 📊 Port Reference Table

| Port | Question | Service |
|------|----------|---------|
| 6000 | Q24 | Django Login |
| 7000 | Q23 | Flask Login |
| 8000 | Q32 | Dockerfile Demo |
| 8080 | Q25, Q29, Q33 | Nginx / MediaWiki / Web |
| 8081 | Q26, Q29 | PHP Form / phpMyAdmin |
| 8082 | Q27 | Volume Demo |
| 8083 | Q31 | LAMP Blog |
| 3000 | Q33 | API Service |
| 3306 | Multiple | MySQL Database |

---

## 🗂️ File Structure Reference

### Typical Single-Container Project:
```
question-folder/
├── info.txt              # Problem statement
├── instructions.md       # Setup guide
├── Dockerfile            # Build instructions
├── app.py / index.php    # Application code
├── requirements.txt      # Dependencies (Python)
└── templates/            # HTML files (if web app)
```

### Typical Multi-Container Project:
```
question-folder/
├── info.txt
├── instructions.md
├── docker-compose.yml    # Orchestration file
├── Dockerfile            # Custom image (if needed)
├── src/                  # Application code
├── database/
│   └── init.sql          # Database initialization
└── config/
    └── nginx.conf        # Web server config
```

---

## 🔑 Key Takeaways

### Version Control (Q1-6):
- Git is distributed, SVN is centralized
- Branching is cheap in Git
- Always commit with meaningful messages
- Pull before push to avoid conflicts

### Docker (Q22-33):
- Containers are isolated, lightweight, portable
- Images are immutable, containers are ephemeral
- Volumes persist data
- Networks enable container communication
- Compose manages multi-container apps

### Web Development (Q23-31):
- Flask: Minimal, flexible
- Django: Full-featured, opinionated
- LAMP: Classic web stack
- Always use container names as hostnames in Docker
- Database initialization happens once

### Best Practices:
- Read info.txt first (understand the problem)
- Follow instructions.md (step-by-step guide)
- Check logs when debugging
- Clean up after testing (docker-compose down -v)
- Use meaningful names for containers/images

---

## 🚨 Common Mistakes to Avoid

1. **Using "localhost" in Docker**: Use container name instead
2. **Forgetting to wait for database**: Check health status first
3. **Not cleaning up volumes**: Use `-v` flag with down
4. **Port conflicts**: Check if port is already in use
5. **Skipping installation steps**: Follow guides completely
6. **Not reading error messages**: They usually tell you what's wrong
7. **Forgetting to rebuild**: After code changes, rebuild image
8. **Wrong working directory**: Use `cd` to correct folder first

---

## 📚 Additional Resources

### Documentation:
- Docker: https://docs.docker.com
- Git: https://git-scm.com/doc
- Flask: https://flask.palletsprojects.com
- Django: https://docs.djangoproject.com
- MediaWiki: https://www.mediawiki.org/wiki/Documentation

### Quick References:
- Docker Cheat Sheet: https://docs.docker.com/get-started/docker_cheatsheet.pdf
- Git Cheat Sheet: https://education.github.com/git-cheat-sheet-education.pdf

---

## ✅ Pre-Lab Checklist

Before starting any question:

- [ ] Docker and Docker Compose installed
- [ ] Git installed (for Q1-6)
- [ ] Text editor ready
- [ ] Terminal/command line open
- [ ] Read info.txt for the question
- [ ] Read instructions.md for the question
- [ ] Check if required ports are free
- [ ] Have internet connection (for pulling images)

---

## 🎯 Quick Test Script

Test if your Docker setup is working:

```bash
# Test Docker
docker run hello-world

# Test Docker Compose
docker-compose --version

# Test port availability
nc -zv localhost 8080

# Clean up everything
docker system prune -a --volumes
```

---

**Remember**: This guide is a quick reference. Always read the specific `info.txt` and `instructions.md` for each question for detailed requirements and steps.

**Good luck with your lab! 🚀**
