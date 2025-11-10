from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '''
    <html>
        <head><title>Hello Flask</title></head>
        <body>
            <h1>Hello World from Flask!</h1>
            <p>This is a simple Flask application running in Docker.</p>
        </body>
    </html>
    '''

@app.route('/health')
def health():
    return {'status': 'healthy'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
