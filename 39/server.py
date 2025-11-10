#!/usr/bin/env python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import json

class APIHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        
        response = {
            'status': 'success',
            'message': 'Hello from API Server!',
            'endpoint': self.path
        }
        
        self.wfile.write(json.dumps(response).encode())
        print(f"GET request from {self.client_address[0]} - Path: {self.path}")
    
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        
        try:
            data = json.loads(post_data.decode())
            print(f"POST request from {self.client_address[0]} - Data: {data}")
            
            response = {
                'status': 'success',
                'message': 'Data received',
                'received': data
            }
            
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps(response).encode())
            
        except Exception as e:
            self.send_response(400)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            error = {'status': 'error', 'message': str(e)}
            self.wfile.write(json.dumps(error).encode())
    
    def log_message(self, format, *args):
        pass  # Suppress default logging

def main():
    server = HTTPServer(('0.0.0.0', 8000), APIHandler)
    print("API Server listening on port 8000")
    server.serve_forever()

if __name__ == '__main__':
    main()
