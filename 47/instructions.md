# Python Calculator Docker Application

## Build and Run

### Build the image
```bash
docker build -t python-calculator .
```

### Run interactively
```bash
docker run -it python-calculator
```

### Run with input
```bash
echo -e "1\n10\n5" | docker run -i python-calculator
```

## Example Usage

```
=== Python Calculator ===

Operations:
1. Addition
2. Subtraction
3. Multiplication
4. Division
5. Power

Enter choice (1-5): 1
Enter first number: 10
Enter second number: 5

10.0 + 5.0 = 15.0
```

## Push to Docker Hub

```bash
docker tag python-calculator YOUR_USERNAME/python-calculator
docker push YOUR_USERNAME/python-calculator
```
