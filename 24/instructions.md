# NIS and NFS Configuration on Ubuntu

## NIS (Network Information Service) Setup

### Server Configuration

#### Install NIS
```bash
sudo apt-get update
sudo apt-get install nis
```

During installation, set domain name: `example.local`

#### Configure NIS Server
Edit `/etc/default/nis`:
```bash
NISSERVER=master
```

Edit `/etc/ypserv.securenets`:
```
255.255.255.0   192.168.1.0
```

#### Create Users and Groups
```bash
# Create 2 groups
sudo groupadd developers
sudo groupadd testers

# Create 5 users
sudo useradd -m -g developers -s /bin/bash user1
sudo useradd -m -g developers -s /bin/bash user2
sudo useradd -m -g developers -s /bin/bash user3
sudo useradd -m -g testers -s /bin/bash user4
sudo useradd -m -g testers -s /bin/bash user5

# Set passwords
echo "user1:password1" | sudo chpasswd
echo "user2:password2" | sudo chpasswd
echo "user3:password3" | sudo chpasswd
echo "user4:password4" | sudo chpasswd
echo "user5:password5" | sudo chpasswd
```

#### Initialize NIS Database
```bash
sudo /usr/lib/yp/ypinit -m
```

#### Start NIS Services
```bash
sudo systemctl restart nis
sudo systemctl enable nis
```

### Client Configuration

#### Install NIS Client
```bash
sudo apt-get install nis
```

Set domain: `example.local`

#### Configure Client
Edit `/etc/yp.conf`:
```
domain example.local server 192.168.1.100
```

Edit `/etc/nsswitch.conf`:
```
passwd:         compat nis
group:          compat nis
shadow:         compat nis
```

#### Start NIS Client
```bash
sudo systemctl restart nis
```

#### Test NIS
```bash
ypcat passwd
ypcat group
```

## NFS (Network File System) Setup

### Server Configuration

#### Install NFS
```bash
sudo apt-get install nfs-kernel-server
```

#### Create Shared Directory
```bash
sudo mkdir -p /srv/nfs/shared
sudo chown nobody:nogroup /srv/nfs/shared
sudo chmod 777 /srv/nfs/shared
```

#### Configure Exports
Edit `/etc/exports`:
```
/srv/nfs/shared 192.168.1.0/24(rw,sync,no_subtree_check)
```

#### Export and Start
```bash
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
sudo systemctl enable nfs-kernel-server
```

### Client Configuration

#### Install NFS Client
```bash
sudo apt-get install nfs-common
```

#### Create Mount Point
```bash
sudo mkdir -p /mnt/nfs/shared
```

#### Mount NFS Share
```bash
sudo mount 192.168.1.100:/srv/nfs/shared /mnt/nfs/shared
```

#### Auto-mount on Boot
Edit `/etc/fstab`:
```
192.168.1.100:/srv/nfs/shared /mnt/nfs/shared nfs defaults 0 0
```

#### Test NFS
```bash
df -h | grep nfs
touch /mnt/nfs/shared/test.txt
```

## Verification

### Test User Access
```bash
# On client machine
su - user1
cd /mnt/nfs/shared
touch user1_file.txt
```

### Check Groups
```bash
groups user1
groups user4
```

## Configuration Files Summary

**NIS Server:**
- `/etc/default/nis`
- `/etc/ypserv.securenets`
- `/var/yp/Makefile`

**NIS Client:**
- `/etc/yp.conf`
- `/etc/nsswitch.conf`

**NFS Server:**
- `/etc/exports`

**NFS Client:**
- `/etc/fstab`
