# Flask Hello World Docker Application

## Build and Run

### Build the image
```bash
docker build -t flask-hello-world .
```

### Run the container
```bash
docker run -p 5000:5000 flask-hello-world
```

### Access the application
Open browser: http://localhost:5000

### Run in detached mode
```bash
docker run -d -p 5000:5000 --name flask-app flask-hello-world
```

### View logs
```bash
docker logs flask-app
```

### Stop container
```bash
docker stop flask-app
docker rm flask-app
```

## Push to Docker Hub

```bash
docker tag flask-hello-world YOUR_USERNAME/flask-hello-world
docker push YOUR_USERNAME/flask-hello-world
```
