package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func homeHandler(w http.ResponseWriter, r *http.Request) {
	html := `
	<!DOCTYPE html>
	<html>
	<head>
		<title>Go Web Server</title>
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
			h1 { color: #333; }
			p { color: #666; }
		</style>
	</head>
	<body>
		<div class="container">
			<h1>🚀 Go Web Server</h1>
			<p>This is a simple web server written in Go!</p>
			<p>Current time: ` + time.Now().Format("2006-01-02 15:04:05") + `</p>
		</div>
	</body>
	</html>
	`
	fmt.Fprintf(w, html)
}

func apiHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	fmt.Fprintf(w, `{"status":"success","message":"Hello from Go API!","timestamp":"%s"}`, time.Now().Format(time.RFC3339))
}

func main() {
	http.HandleFunc("/", homeHandler)
	http.HandleFunc("/api", apiHandler)
	
	fmt.Println("Server starting on :8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
