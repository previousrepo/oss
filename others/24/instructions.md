# Question 24: Django Login Form on Port 8006

## Setup and Run

```bash
cd others/24

# Build the Docker image
docker build -t django-login:latest .

# Run the container
docker run -d -p 8006:8006 --name django-login-app django-login:latest

# Access the application
# Open browser: http://localhost:8006
```

## Create Superuser (Optional)

```bash
docker exec -it django-login-app python manage.py createsuperuser
```

## Test Credentials
After creating superuser, use those credentials or:
- Username: admin
- Password: admin123

## Stop and Clean Up

```bash
docker stop django-login-app
docker rm django-login-app
docker rmi django-login:latest
```

## Features
- Django authentication system
- Login/Logout functionality
- Admin interface at /admin
- Bootstrap styled templates
- SQLite database
