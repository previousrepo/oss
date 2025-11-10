# FTP and Telnet in CentOS Container

## What We're Doing

We create a CentOS container with FTP (vsftpd) and Telnet servers installed. The FTP server allows anonymous file access to `/srv/ftp/pub` directory on port 21. The Telnet server provides remote terminal access on port 23. We map these to host ports 2121 and 2323 to avoid conflicts. This is the same as question 55 but using CentOS instead of Ubuntu (yum instead of apt).

## Build and Run

```bash
# Remove old container if exists
docker rm -f ftp-telnet-centos 2>/dev/null

# Build image
docker build -t centos-ftp-telnet .

# Run container
docker run -d -p 2121:21 -p 2323:23 --name ftp-telnet-centos centos-ftp-telnet

# Wait for services to start
sleep 5
```

## Test FTP

### Option 1: Using netcat (manual FTP commands)
```bash
nc localhost 2121
# You'll see: 220 (vsFTPd ...)

# Type these commands:
USER anonymous
PASS 
SYST
QUIT
```

### Option 2: Using curl
```bash
curl ftp://anonymous@localhost:2121/
```

### Option 3: Using browser
Open: ftp://localhost:2121

## Test Telnet

```bash
# Using netcat
nc localhost 2323
# You'll see telnet prompt
```

## Configuration Files

- FTP: `/etc/vsftpd/vsftpd.conf`
- Telnet: `/etc/xinetd.d/telnet`
- Public folder: `/srv/ftp/pub`

## Verify Services

```bash
docker exec ftp-telnet-centos ss -tuln | grep -E ':21|:23'
```

## Stop

```bash
docker stop ftp-telnet-centos
docker rm ftp-telnet-centos
```

**WARNING**: Telnet is insecure. Use SSH in production.
