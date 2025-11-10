# Open Source Software Lab - Complete Question Bank

This repository contains organized solutions and implementations for all 58 lab questions.

## Structure

Each question is in its own numbered folder (1-58) containing:
- `info.txt` - Problem statement, category, difficulty, key concepts, deliverables, and tools required
- Implementation files (scripts, code, Dockerfiles, etc.)
- `instructions.md` - Detailed setup and execution instructions

## Question Categories

### Version Control Systems (Questions 1-6)
- Git (local and GitHub)
- Mercurial (hg)
- SVN (Subversion)
- Multi-user workflows, branching, merging, diff operations

### Bug Tracking & Issue Management (Questions 7-8, 20-21, 28)
- MantisBT
- Bugzilla
- YouTrack
- DoneDone
- Jira

### Open Source Contribution (Question 9)
- Forking and contributing to FOSS projects
- Pull request workflow

### Content Management Systems (Questions 10, 22)
- Joomla
- Drupal
- Comparison with Moodle/Schoology

### Package Management (Questions 11-14)
- RPM packages (Java, C/C++)
- Debian packages (Python, Java, C/C++)
- RPM vs DEB comparison

### Project Management Tools (Questions 15-19, 27)
- SonarQube
- SonarCloud
- Asana
- Slack + Asana integration
- GitHub + Asana integration
- Open Atrium

### Network Services (Questions 23-26, 55-58)
- FTP and Telnet configuration
- NIS and NFS setup
- Ubuntu and CentOS implementations
- Container-based deployments

### Code Review (Question 29)
- Review Board
- Tuleap/Gitea integration

### Go Language (Questions 30-32)
- Go features (goroutines, channels, interfaces)
- Go tools (build, test, fmt, etc.)
- Go applications

### Linux Kernel (Question 33)
- Kernel modification
- Kernel compilation
- Custom kernel installation

### Docker - Basic (Questions 34-36, 40-41, 43, 45-54)
- Docker image creation
- Dockerfile writing
- Container deployment
- LAMP stack
- Flask applications
- Web applications with login
- Port mapping

### Docker - Advanced (Questions 37-39, 42, 44)
- Inter-container communication
- Socket/IPC between containers
- Docker Compose
- WordPress + MySQL deployment
- Nginx load balancing

## Quick Start Guide

### For Version Control Questions (1-6)
```bash
cd 1  # or any VCS question folder
chmod +x demo_script.sh
./demo_script.sh
```

### For Docker Questions (34-58)
```bash
cd 43  # Flask example
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```

### For Go Questions (30-32)
```bash
cd 30
go run goroutines_demo.go
go run channels_demo.go
go run interfaces_demo.go
```

### For Package Creation (11-14)
```bash
cd 11  # RPM example
# Follow instructions.md for detailed steps
```

## Difficulty Levels

- **Beginner (B)**: Questions 1-33
- **Expert (E)**: Questions 34-58 (Docker-focused)

## Prerequisites

### General Tools
- Linux (Ubuntu/CentOS/Fedora)
- Git
- Text editor
- Terminal

### For Docker Questions
- Docker Engine
- Docker Compose
- Docker Hub account (for push operations)

### For Programming Questions
- Python 3.x
- Java JDK 11+
- Go 1.16+
- GCC/G++

### For Package Management
- RPM-based: rpmbuild, rpmdevtools
- DEB-based: dpkg-dev, debhelper, devscripts

## Notes

- All scripts are tested on Linux systems
- Docker questions require Docker to be installed and running
- Some questions require multiple machines/VMs (NIS/NFS)
- Telnet is insecure; use for educational purposes only
- Kernel compilation requires significant time and disk space

## Safety Warnings

1. **Kernel Modification (Q33)**: Always backup before installing custom kernel
2. **Network Services (Q23-26, 55-58)**: Telnet is insecure, use SSH in production
3. **Docker Privileged Mode**: Some containers may require --privileged flag
4. **Package Installation**: Test in VM before production systems

## Contributing

This is a lab question bank. Each implementation is self-contained and can be executed independently.

## License

Educational use only. Individual FOSS tools have their own licenses.
