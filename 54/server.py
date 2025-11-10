#!/usr/bin/env python3
from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

class MyHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'
        return SimpleHTTPRequestHandler.do_GET(self)

def run(server_class=HTTPServer, handler_class=MyHandler, port=5000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Server running on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
