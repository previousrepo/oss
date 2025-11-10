package main

import (
	"fmt"
	"math"
)

// Demonstrating Interfaces - Go's polymorphism

type Shape interface {
	Area() float64
	Perimeter() float64
}

type Rectangle struct {
	Width, Height float64
}

type Circle struct {
	Radius float64
}

func (r Rectangle) Area() float64 {
	return r.Width * r.Height
}

func (r Rectangle) Perimeter() float64 {
	return 2 * (r.Width + r.Height)
}

func (c Circle) Area() float64 {
	return math.Pi * c.Radius * c.Radius
}

func (c Circle) Perimeter() float64 {
	return 2 * math.Pi * c.Radius
}

func printShapeInfo(s Shape) {
	fmt.Printf("Area: %.2f\n", s.Area())
	fmt.Printf("Perimeter: %.2f\n\n", s.Perimeter())
}

func main() {
	fmt.Println("=== Go Interfaces Demonstration ===\n")
	
	rect := Rectangle{Width: 10, Height: 5}
	circle := Circle{Radius: 7}
	
	fmt.Println("Rectangle:")
	printShapeInfo(rect)
	
	fmt.Println("Circle:")
	printShapeInfo(circle)
}
