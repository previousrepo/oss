from flask import Flask
import socket
import os

app = Flask(__name__)

@app.route('/')
def hello():
    hostname = socket.gethostname()
    return f'''
    <html>
        <head><title>Load Balanced App</title></head>
        <body style="font-family: Arial; text-align: center; padding: 50px;">
            <h1>Load Balanced Application</h1>
            <h2>Served by: {hostname}</h2>
            <p>Refresh the page to see different servers responding!</p>
        </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
