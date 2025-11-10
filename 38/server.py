#!/usr/bin/env python3
import socket
import os

SOCKET_PATH = '/tmp/ipc.sock'

def main():
    # Remove socket if it exists
    if os.path.exists(SOCKET_PATH):
        os.remove(SOCKET_PATH)
    
    # Create Unix socket
    server_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server_socket.bind(SOCKET_PATH)
    server_socket.listen(1)
    
    print(f"IPC Server listening on {SOCKET_PATH}")
    
    while True:
        client_socket, _ = server_socket.accept()
        print("Client connected via IPC")
        
        data = client_socket.recv(1024).decode('utf-8')
        print(f"Received via IPC: {data}")
        
        response = f"IPC Server received: {data}"
        client_socket.send(response.encode('utf-8'))
        
        client_socket.close()

if __name__ == '__main__':
    main()
