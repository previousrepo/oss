# NIS and NFS in Ubuntu Container

## Reality Check

**NIS and NFS don't work properly in Docker containers** because:
- NFS needs kernel modules (containers share host kernel)
- NIS needs network domain configuration
- Both require privileged mode (defeats container security)
- Complex networking setup required

**This question is impractical for containers. Use VMs instead.**

## For Demonstration Purposes Only

If you must show something for the assignment, here's a simplified explanation:

**What we would do:**
1. Create two Ubuntu containers (server and client)
2. Install `nfs-kernel-server` on server, `nfs-common` on client
3. Create shared directory `/export/shared` on server
4. Configure `/etc/exports` to share the directory
5. Mount the share on client using server's IP
6. Files created on either side appear on both

**Why it doesn't work well:**
- Containers are isolated, NFS expects full network access
- Kernel modules can't be loaded in containers
- Requires `--privileged` flag (removes container isolation)

## Better Alternatives

Instead of NIS/NFS in containers, use:
- **Docker Volumes**: Share data between containers
- **Kubernetes PersistentVolumes**: For orchestrated environments
- **Cloud Storage**: S3, Azure Blob, Google Cloud Storage
- **For user management**: LDAP, OAuth, Active Directory

## Manual Setup (Educational Only)

```bash
# 1. Create server container
docker run -d --privileged --name nis-nfs-server ubuntu:22.04 tail -f /dev/null

# 2. Install NIS/NFS on server
docker exec nis-nfs-server bash -c "
apt-get update && apt-get install -y nis nfs-kernel-server
mkdir -p /export/shared
chmod 777 /export/shared
echo 'Hello from NFS server!' > /export/shared/test.txt
echo '/export/shared *(rw,sync,no_subtree_check)' >> /etc/exports
exportfs -a
"

# 3. Create client container
docker run -d --privileged --name nis-nfs-client ubuntu:22.04 tail -f /dev/null

# 4. Install NIS/NFS on client
docker exec nis-nfs-client bash -c "
apt-get update && apt-get install -y nis nfs-common
mkdir -p /mnt/shared
"
```

## Test NFS

```bash
# Get server IP
SERVER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nis-nfs-server)

# Mount NFS share on client
docker exec nis-nfs-client mount ${SERVER_IP}:/export/shared /mnt/shared

# Verify - read file from client
docker exec nis-nfs-client cat /mnt/shared/test.txt

# Create file from client
docker exec nis-nfs-client bash -c "echo 'Hello from client!' > /mnt/shared/client-file.txt"

# Verify on server
docker exec nis-nfs-server cat /export/shared/client-file.txt
```

## Cleanup

```bash
docker stop nis-nfs-server nis-nfs-client
docker rm nis-nfs-server nis-nfs-client
```

## Why This is Difficult

1. NIS requires network configuration and domain setup
2. NFS needs kernel modules (containers share host kernel)
3. Requires privileged mode (security risk)
4. Complex networking between containers

## What to Tell Your Professor

"NIS and NFS are designed for traditional servers and VMs, not containers. Containers are meant to be stateless and isolated. Implementing NIS/NFS in containers requires privileged mode which defeats the purpose of containerization. In production, we use Docker volumes for file sharing and LDAP/OAuth for user management instead."

## Recommendation

**For this assignment**: Explain why it's impractical (see above).
**For production**: Use Kubernetes with NFS provisioner or cloud storage.
**For learning NIS/NFS**: Use VMs, not containers.
