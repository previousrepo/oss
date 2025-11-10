package main

import (
	"fmt"
	"sync"
	"time"
)

// Demonstrating Goroutines - Go's lightweight threads

func worker(id int, wg *sync.WaitGroup) {
	defer wg.Done()
	
	fmt.Printf("Worker %d starting\n", id)
	time.Sleep(time.Second)
	fmt.Printf("Worker %d done\n", id)
}

func main() {
	fmt.Println("=== Go Goroutines Demonstration ===\n")
	
	var wg sync.WaitGroup
	
	// Launch 5 goroutines
	for i := 1; i <= 5; i++ {
		wg.Add(1)
		go worker(i, &wg)
	}
	
	// Wait for all goroutines to complete
	wg.Wait()
	fmt.Println("\nAll workers completed!")
}
