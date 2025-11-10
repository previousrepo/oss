# FTP and Telnet Configuration on Ubuntu

## FTP Server Setup (vsftpd)

### Installation
```bash
sudo apt-get update
sudo apt-get install vsftpd
```

### Configuration
Edit `/etc/vsftpd.conf`:
```bash
sudo nano /etc/vsftpd.conf
```

Key settings:
```
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
pasv_enable=YES
pasv_min_port=10000
pasv_max_port=10100
```

### Create Public Folder
```bash
sudo mkdir -p /srv/ftp/pub
sudo chmod 755 /srv/ftp/pub
sudo chown nobody:nogroup /srv/ftp/pub
```

For anonymous access, add to config:
```
anonymous_enable=YES
anon_root=/srv/ftp
no_anon_password=YES
anon_upload_enable=NO
anon_mkdir_write_enable=NO
```

### Restart Service
```bash
sudo systemctl restart vsftpd
sudo systemctl enable vsftpd
```

### Test FTP
```bash
ftp localhost
# or
ftp 192.168.1.100
```

## Telnet Server Setup

### Installation
```bash
sudo apt-get install telnetd xinetd
```

### Configuration
Create `/etc/xinetd.d/telnet`:
```bash
sudo nano /etc/xinetd.d/telnet
```

Content:
```
service telnet
{
    disable = no
    flags = REUSE
    socket_type = stream
    wait = no
    user = root
    server = /usr/sbin/in.telnetd
    log_on_failure += USERID
}
```

### Restart Service
```bash
sudo systemctl restart xinetd
sudo systemctl enable xinetd
```

### Test Telnet
```bash
telnet localhost
# or
telnet 192.168.1.100
```

## Security Warning
Telnet transmits data in plain text. Use SSH instead for production:
```bash
sudo apt-get install openssh-server
ssh user@hostname
```

## Firewall Configuration
```bash
sudo ufw allow 21/tcp  # FTP
sudo ufw allow 23/tcp  # Telnet
sudo ufw allow 10000:10100/tcp  # FTP passive ports
```
