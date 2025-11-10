from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '''
    <html>
        <head>
            <title>Flask Hello World</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                }
                .container {
                    text-align: center;
                    background: white;
                    padding: 50px;
                    border-radius: 10px;
                    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
                }
                h1 {
                    color: #333;
                    margin-bottom: 20px;
                }
                p {
                    color: #666;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🎉 Hello World from Flask!</h1>
                <p>This is a simple Flask application running in Docker.</p>
                <p>Running on port 5000</p>
            </div>
        </body>
    </html>
    '''

@app.route('/health')
def health():
    return {'status': 'healthy', 'message': 'Flask app is running'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
