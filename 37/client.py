#!/usr/bin/env python3
import socket
import sys
import time

SERVER_HOST = 'server'  # Docker service name
SERVER_PORT = 9999

def main():
    # Wait for server to be ready
    time.sleep(2)
    
    while True:
        try:
            # Create socket
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            
            # Connect to server
            print(f"Connecting to {SERVER_HOST}:{SERVER_PORT}")
            client_socket.connect((SERVER_HOST, SERVER_PORT))
            
            # Send message
            message = "Hello from client!"
            print(f"Sending: {message}")
            client_socket.send(message.encode('utf-8'))
            
            # Receive response
            response = client_socket.recv(1024).decode('utf-8')
            print(f"Response: {response}")
            
            client_socket.close()
            
            # Wait before next message
            time.sleep(5)
            
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(5)

if __name__ == '__main__':
    main()
