# Question 23: Flask Login Form on Port 7000

## Setup and Run

```bash
cd others/23

# Build the Docker image
docker build -t flask-login:latest .

# Run the container
docker run -d -p 7000:7000 --name flask-login-app flask-login:latest

# Access the application
# Open browser: http://localhost:7000
```

## Test Credentials
- Username: admin
- Password: password

## Stop and Clean Up

```bash
docker stop flask-login-app
docker rm flask-login-app
docker rmi flask-login:latest
```

## Features
- Simple login form with validation
- Session management
- Dashboard after successful login
- Logout functionality
- Bootstrap styling
