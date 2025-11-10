# Additional Docker Questions (23-33)

This folder contains 11 additional Docker questions from sir's PDF that complement the main 58 questions.

## Question List

| # | Question | Key Concepts |
|---|----------|--------------|
| 23 | Flask login form on port 7000 | Flask, Docker, Web Forms |
| 24 | Django login form on port 6000 | Django, Authentication, Docker |
| 25 | Nginx + MySQL containers | Multi-container, Networking |
| 26 | Web form with MySQL | PHP, MySQL, CRUD Operations |
| 27 | Mount host directory | Volume Mounting, Bind Mounts |
| 28 | Ubuntu + OpenJDK + Java app | Java, Ubuntu, Dockerfile |
| 29 | LAMP Stack + MediaWiki on 8080 | LAMP, MediaWiki, CMS |
| 30 | C program linked list containerized | C Programming, GCC, Docker |
| 31 | LAMP Stack + Custom web app | PHP, MySQL, Apache, Blog App |
| 32 | All Dockerfile fields demo | Dockerfile, Best Practices |
| 33 | All Docker Compose fields demo | Docker Compose, Orchestration |

## Quick Start

Each folder contains:
- `info.txt` - Question description
- `instructions.md` - Setup and run guide
- Implementation files (Dockerfile, docker-compose.yml, source code)

## Running Examples

```bash
# Flask Login (Q23)
cd 23 && docker build -t flask-login . && docker run -p 7000:7000 flask-login

# Django Login (Q24)
cd 24 && docker build -t django-login . && docker run -p 6000:6000 django-login

# Nginx + MySQL (Q25)
cd 25 && docker-compose up -d

# Web Form + MySQL (Q26)
cd 26 && docker-compose up -d

# Volume Mount (Q27)
cd 27 && docker-compose up -d

# Java Application (Q28)
cd 28 && docker build -t java-app . && docker run java-app

# MediaWiki LAMP (Q29)
cd 29 && docker-compose up -d

# C Linked List (Q30)
cd 30 && docker build -t c-linked-list . && docker run c-linked-list

# Custom LAMP App (Q31)
cd 31 && docker-compose up -d

# All Dockerfile Fields (Q32)
cd 32 && docker build -t dockerfile-demo . && docker run -p 8000:8000 dockerfile-demo

# All Compose Fields (Q33)
cd 33 && docker-compose up -d
```

## Notes

- All questions have working implementations
- Each includes detailed instructions
- Port numbers are specified in questions
- Database credentials are in docker-compose.yml files
- Clean up with `docker-compose down` or `docker stop/rm`
