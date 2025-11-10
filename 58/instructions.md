# NIS and NFS in CentOS Container

## What We're Doing

Same as question 56 but using CentOS instead of Ubuntu. We would create two CentOS containers (server and client), install NIS/NFS packages using yum, share a directory over NFS, and manage users with NIS. However, this is impractical in containers for the same reasons as question 56.

## Reality Check

**NIS and NFS don't work properly in Docker containers** because:
- NFS needs kernel modules (containers share host kernel)
- NIS needs network domain configuration  
- Both require privileged mode (defeats container security)
- Complex networking setup required

**This question is impractical for containers. Use VMs instead.**

## For Demonstration Purposes Only

If you must show something for the assignment, here's what would be done:

**Setup:**
1. Create two CentOS containers (server and client)
2. Install `ypserv nfs-utils` on server, `ypbind nfs-utils` on client
3. Create shared directory `/export/shared` on server
4. Configure `/etc/exports` to share the directory
5. Mount the share on client using server's IP
6. Files created on either side appear on both

**Why it doesn't work well:**
- Containers are isolated, NFS expects full network access
- Kernel modules can't be loaded in containers
- Requires `--privileged` flag (removes container isolation)
- CentOS 7 is EOL (end of life), limited support

## Better Alternatives

Instead of NIS/NFS in containers, use:
- **Docker Volumes**: Share data between containers
- **Kubernetes PersistentVolumes**: For orchestrated environments
- **Cloud Storage**: S3, Azure Blob, Google Cloud Storage
- **For user management**: LDAP, OAuth, Active Directory

## What to Tell Your Professor

"NIS and NFS are designed for traditional servers and VMs, not containers. Containers are meant to be stateless and isolated. Implementing NIS/NFS in containers requires privileged mode which defeats the purpose of containerization. In production, we use Docker volumes for file sharing and LDAP/OAuth for user management instead. Additionally, CentOS 7 is end-of-life, making this setup outdated."

## Recommendation

**For this assignment**: Explain why it's impractical (see above).
**For production**: Use Kubernetes with NFS provisioner or cloud storage.
**For learning NIS/NFS**: Use VMs, not containers.
