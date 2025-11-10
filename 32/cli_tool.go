package main

import (
	"flag"
	"fmt"
	"os"
	"strings"
)

func main() {
	// Define flags
	name := flag.String("name", "World", "Name to greet")
	upper := flag.Bool("upper", false, "Convert to uppercase")
	repeat := flag.Int("repeat", 1, "Number of times to repeat")
	
	flag.Parse()
	
	greeting := fmt.Sprintf("Hello, %s!", *name)
	
	if *upper {
		greeting = strings.ToUpper(greeting)
	}
	
	for i := 0; i < *repeat; i++ {
		fmt.Println(greeting)
	}
	
	// Show usage example
	if len(os.Args) == 1 {
		fmt.Println("\nUsage examples:")
		fmt.Println("  go run cli_tool.go -name=John")
		fmt.Println("  go run cli_tool.go -name=Jane -upper")
		fmt.Println("  go run cli_tool.go -name=Bob -repeat=3")
	}
}
