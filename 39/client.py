#!/usr/bin/env python3
import requests
import time
import json

API_URL = 'http://server:8000'

def main():
    time.sleep(2)  # Wait for server
    
    while True:
        try:
            # GET request
            print(f"Sending GET request to {API_URL}/api/status")
            response = requests.get(f"{API_URL}/api/status")
            print(f"GET Response: {response.json()}")
            
            time.sleep(3)
            
            # POST request
            data = {'message': 'Hello from API client!', 'timestamp': time.time()}
            print(f"Sending POST request to {API_URL}/api/data")
            print(f"POST Data: {data}")
            response = requests.post(f"{API_URL}/api/data", json=data)
            print(f"POST Response: {response.json()}")
            
            time.sleep(5)
            
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(5)

if __name__ == '__main__':
    main()
