from flask import Flask, render_template, request, redirect, session, flash
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)

# Dummy user database
users = {
    'admin': 'admin123',
    'user': 'user123'
}

@app.route('/')
def index():
    if 'username' in session:
        return redirect('/dashboard')
    return redirect('/login')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        if username in users and users[username] == password:
            session['username'] = username
            flash('Login successful!', 'success')
            return redirect('/dashboard')
        else:
            flash('Invalid credentials!', 'error')
    
    return render_template('login.html')

@app.route('/dashboard')
def dashboard():
    if 'username' not in session:
        return redirect('/login')
    return render_template('dashboard.html', username=session['username'])

@app.route('/logout')
def logout():
    session.pop('username', None)
    flash('Logged out successfully!', 'success')
    return redirect('/login')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7000, debug=True)
