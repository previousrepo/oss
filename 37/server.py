#!/usr/bin/env python3
import socket
import sys

HOST = '0.0.0.0'
PORT = 9999

def main():
    # Create socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    
    # Bind and listen
    server_socket.bind((HOST, PORT))
    server_socket.listen(1)
    
    print(f"Server listening on {HOST}:{PORT}")
    
    while True:
        # Accept connection
        client_socket, address = server_socket.accept()
        print(f"Connection from {address}")
        
        # Receive data
        data = client_socket.recv(1024).decode('utf-8')
        print(f"Received: {data}")
        
        # Send response
        response = f"Server received: {data}"
        client_socket.send(response.encode('utf-8'))
        
        client_socket.close()

if __name__ == '__main__':
    main()
