# Flask Hello World Docker Application

## Build and Run

```bash
docker build -t flask-hello .
docker run -p 5000:5000 flask-hello
```

## Access

Open browser: http://localhost:5000

## Run in Background

```bash
docker run -d -p 5000:5000 --name flask-app flask-hello
```

## View Logs

```bash
docker logs -f flask-app
```

## Stop

```bash
docker stop flask-app
docker rm flask-app
```
