# FTP and Telnet in Ubuntu Container

## Build and Run

```bash
# Remove old container if exists
docker rm -f ftp-telnet-ubuntu 2>/dev/null

# Build image
docker build -t ubuntu-ftp-telnet .

# Run container
docker run -d -p 2121:21 -p 2323:23 --name ftp-telnet-ubuntu ubuntu-ftp-telnet

# Wait for services to start
sleep 5
```

## Test FTP

### Option 1: Using netcat (manual FTP commands)
```bash
nc localhost 2121
# You'll see: 220 (vsFTPd 3.0.5)

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

### Option 4: Install FTP client
```bash
# Install FTP client
sudo apt-get install ftp  # Ubuntu/Debian
# or
brew install inetutils    # macOS

# Then test
ftp localhost 2121
# Login as: anonymous
# Password: (just press Enter)
```

## Test Telnet

### Option 1: Using netcat (if you don't have telnet)
```bash
nc localhost 2323
```

### Option 2: Install telnet and test
```bash
# Install telnet
sudo apt-get install telnet  # Ubuntu/Debian
# or
brew install telnet          # macOS

# Then test
telnet localhost 2323
```

## Verify Services are Running

```bash
# Check if ports are listening
docker exec ftp-telnet-ubuntu netstat -tuln | grep -E '21|23'

# Check FTP service
docker exec ftp-telnet-ubuntu service vsftpd status

# Check Telnet service
docker exec ftp-telnet-ubuntu service xinetd status
```

## Configuration Files

- FTP: `/etc/vsftpd.conf`
- Telnet: `/etc/xinetd.d/telnet`
- Public folder: `/srv/ftp/pub`

## View Logs

```bash
docker logs ftp-telnet-ubuntu
```

## Stop

```bash
docker stop ftp-telnet-ubuntu
docker rm ftp-telnet-ubuntu
```

## Quick Test (No Client Installation Needed)

```bash
# Test FTP with curl
curl ftp://localhost:2121/

# Test Telnet with netcat
echo "test" | nc localhost 2323

# Or just verify ports are open
docker exec ftp-telnet-ubuntu ss -tuln | grep -E ':21|:23'
```

**WARNING**: Telnet is insecure. Use SSH in production.
