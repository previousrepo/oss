# IPC Communication Between Docker Containers

## What is IPC?

IPC (Inter-Process Communication) uses Unix domain sockets - a file-based socket for communication between processes on the same host. Faster than TCP sockets.

## Build and Run

```bash
docker-compose up -d --build
```

## View Communication

```bash
# Server logs
docker logs -f ipc_server

# Client logs  
docker logs -f ipc_client
```

You'll see:
- Server: "Received via IPC: Hello via IPC!"
- Client: "Response via IPC: IPC Server received: Hello via IPC!"

## How It Works

Both containers share a volume (`/tmp`) where the Unix socket file (`ipc.sock`) is created. The client and server communicate through this shared socket file.

## Push to Docker Hub

```bash
docker tag 38-server YOUR_USERNAME/ipc-server
docker tag 38-client YOUR_USERNAME/ipc-client
docker push YOUR_USERNAME/ipc-server
docker push YOUR_USERNAME/ipc-client
```

## Stop

```bash
docker-compose down
```
