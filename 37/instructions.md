# Inter-Container Communication with Sockets

## Build and Run

### Start in detached mode (background)
```bash
docker-compose up -d --build
```

## Verify Communication

### Check server logs (should show incoming connections)
```bash
docker logs -f socket_server
```

You should see:
```
Server listening on 0.0.0.0:9999
Connection from ('172.18.0.3', 54321)
Received: Hello from client!
```

### Check client logs (should show messages sent)
```bash
docker logs -f socket_client
```

You should see:
```
Connecting to server:9999
Sending: Hello from client!
Response: Server received: Hello from client!
```

Press Ctrl+C to stop viewing logs.

## Test Communication Manually

### Send a test message from client
```bash
docker exec -it socket_client python -c "
import socket
s = socket.socket()
s.connect(('server', 9999))
s.send(b'Test message')
print(s.recv(1024).decode())
s.close()
"
```

## View Real-Time Communication

```bash
# Watch both logs simultaneously
docker-compose logs -f
```

You'll see messages being exchanged every 5 seconds:
- Client sends: "Hello from client!"
- Server responds: "Server received: Hello from client!"

## Push to Docker Hub

```bash
docker tag 37-server YOUR_USERNAME/socket-server
docker tag 37-client YOUR_USERNAME/socket-client

docker push YOUR_USERNAME/socket-server
docker push YOUR_USERNAME/socket-client
```

## Stop

```bash
docker-compose down
```

## Architecture

```
┌─────────────────┐         ┌─────────────────┐
│  Client         │         │  Server         │
│  Container      │────────▶│  Container      │
│  (socket_client)│  Port   │  (socket_server)│
│                 │  9999   │                 │
└─────────────────┘         └─────────────────┘
        │                           │
        └───────────────────────────┘
              app_network
```

The client sends messages to the server every 5 seconds, and the server responds back. Both containers communicate using Docker's internal network (app_network) without exposing ports to the host.
