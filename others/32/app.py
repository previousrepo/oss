#!/usr/bin/env python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import os

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/health':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps({'status': 'healthy'}).encode())
        elif self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            html = f"""
            <html>
            <head><title>Dockerfile Demo</title></head>
            <body>
                <h1>All Dockerfile Fields Demonstrated</h1>
                <h2>Environment Variables:</h2>
                <ul>
                    <li>APP_HOME: {os.getenv('APP_HOME', 'Not set')}</li>
                    <li>APP_USER: {os.getenv('APP_USER', 'Not set')}</li>
                    <li>APP_VERSION: {os.getenv('APP_VERSION', 'Not set')}</li>
                </ul>
                <h2>Endpoints:</h2>
                <ul>
                    <li><a href="/health">/health</a> - Health check</li>
                    <li><a href="/info">/info</a> - System info</li>
                </ul>
            </body>
            </html>
            """
            self.wfile.write(html.encode())
        elif self.path == '/info':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            info = {
                'app_home': os.getenv('APP_HOME'),
                'app_user': os.getenv('APP_USER'),
                'app_version': os.getenv('APP_VERSION'),
                'working_dir': os.getcwd()
            }
            self.wfile.write(json.dumps(info, indent=2).encode())
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 8000), SimpleHandler)
    print('Server running on port 8000...')
    server.serve_forever()
