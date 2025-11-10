#!/usr/bin/env python3
import socket
import time

SOCKET_PATH = '/tmp/ipc.sock'

def main():
    time.sleep(2)  # Wait for server
    
    while True:
        try:
            client_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            
            print(f"Connecting to IPC socket: {SOCKET_PATH}")
            client_socket.connect(SOCKET_PATH)
            
            message = "Hello via IPC!"
            print(f"Sending via IPC: {message}")
            client_socket.send(message.encode('utf-8'))
            
            response = client_socket.recv(1024).decode('utf-8')
            print(f"Response via IPC: {response}")
            
            client_socket.close()
            time.sleep(5)
            
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(5)

if __name__ == '__main__':
    main()
