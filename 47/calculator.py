#!/usr/bin/env python3

def add(a, b):
    """Add two numbers"""
    return a + b

def subtract(a, b):
    """Subtract b from a"""
    return a - b

def multiply(a, b):
    """Multiply two numbers"""
    return a * b

def divide(a, b):
    """Divide a by b"""
    if b == 0:
        return "Error: Division by zero"
    return a / b

def power(a, b):
    """Calculate a to the power of b"""
    return a ** b

def main():
    print("=== Python Calculator ===")
    print("\nOperations:")
    print("1. Addition")
    print("2. Subtraction")
    print("3. Multiplication")
    print("4. Division")
    print("5. Power")
    
    choice = input("\nEnter choice (1-5): ")
    
    try:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))
        
        if choice == '1':
            result = add(num1, num2)
            print(f"\n{num1} + {num2} = {result}")
        elif choice == '2':
            result = subtract(num1, num2)
            print(f"\n{num1} - {num2} = {result}")
        elif choice == '3':
            result = multiply(num1, num2)
            print(f"\n{num1} * {num2} = {result}")
        elif choice == '4':
            result = divide(num1, num2)
            print(f"\n{num1} / {num2} = {result}")
        elif choice == '5':
            result = power(num1, num2)
            print(f"\n{num1} ^ {num2} = {result}")
        else:
            print("\nInvalid choice!")
    
    except ValueError:
        print("\nError: Invalid input!")

if __name__ == "__main__":
    main()
