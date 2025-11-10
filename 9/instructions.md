# Contributing to Open Source Software

## Step-by-Step Guide

### 1. Find a Project
Choose from:
- GitHub Explore
- Good First Issue labels
- Projects you use regularly

Example projects:
- Python: https://github.com/psf/requests
- Java: https://github.com/apache/commons-lang
- C++: https://github.com/nlohmann/json

### 2. Fork the Repository
```bash
# On GitHub, click "Fork" button
# Then clone your fork
git clone https://github.com/YOUR_USERNAME/PROJECT_NAME.git
cd PROJECT_NAME
```

### 3. Set Up Development Environment
```bash
# Add upstream remote
git remote add upstream https://github.com/ORIGINAL_OWNER/PROJECT_NAME.git

# Create feature branch
git checkout -b fix-bug-123
```

### 4. Make Your Contribution

#### Example: Python Bug Fix
```python
# Before (buggy code)
def calculate_total(items):
    total = 0
    for item in items:
        total += item.price
    return total

# After (fixed code)
def calculate_total(items):
    if not items:
        return 0
    total = 0
    for item in items:
        if hasattr(item, 'price'):
            total += item.price
    return total
```

#### Example: Java Feature Addition
```java
// Before
public class StringUtils {
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
}

// After (added feature)
public class StringUtils {
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
    
    // New feature: check if string is blank (empty or whitespace)
    public static boolean isBlank(String str) {
        return str == null || str.trim().length() == 0;
    }
}
```

### 5. Test Your Changes
```bash
# Run existing tests
python -m pytest tests/
# or
mvn test
# or
make test

# Add new tests for your changes
```

### 6. Commit Your Changes
```bash
git add .
git commit -m "Fix: Handle empty list in calculate_total

- Added null/empty check
- Added attribute validation
- Prevents AttributeError
- Fixes issue #123"
```

### 7. Push to Your Fork
```bash
git push origin fix-bug-123
```

### 8. Create Pull Request
1. Go to your fork on GitHub
2. Click "Compare & pull request"
3. Fill in PR template:
   - Description of changes
   - Related issue number
   - Testing done
   - Screenshots (if UI change)
4. Submit PR

### 9. Respond to Feedback
- Address reviewer comments
- Make requested changes
- Push updates to same branch

### 10. After Merge
```bash
# Update your fork
git checkout main
git pull upstream main
git push origin main
```

## Example Contribution Project

### Simple Python Project with Bug

```python
# calculator.py (original with bugs)
class Calculator:
    def divide(self, a, b):
        return a / b  # Bug: No zero division check
    
    def average(self, numbers):
        return sum(numbers) / len(numbers)  # Bug: Empty list
    
    def factorial(self, n):
        if n == 0:
            return 1
        return n * self.factorial(n - 1)  # Bug: No negative check
```

### Your Contribution (Fixed)

```python
# calculator.py (fixed)
class Calculator:
    def divide(self, a, b):
        """Divide two numbers.
        
        Args:
            a: Numerator
            b: Denominator
            
        Returns:
            Result of division
            
        Raises:
            ValueError: If b is zero
        """
        if b == 0:
            raise ValueError("Cannot divide by zero")
        return a / b
    
    def average(self, numbers):
        """Calculate average of numbers.
        
        Args:
            numbers: List of numbers
            
        Returns:
            Average value or 0 if empty list
        """
        if not numbers:
            return 0
        return sum(numbers) / len(numbers)
    
    def factorial(self, n):
        """Calculate factorial.
        
        Args:
            n: Non-negative integer
            
        Returns:
            Factorial of n
            
        Raises:
            ValueError: If n is negative
        """
        if n < 0:
            raise ValueError("Factorial not defined for negative numbers")
        if n == 0:
            return 1
        return n * self.factorial(n - 1)
```

### Test File

```python
# test_calculator.py
import pytest
from calculator import Calculator

def test_divide_by_zero():
    calc = Calculator()
    with pytest.raises(ValueError):
        calc.divide(10, 0)

def test_average_empty_list():
    calc = Calculator()
    assert calc.average([]) == 0

def test_factorial_negative():
    calc = Calculator()
    with pytest.raises(ValueError):
        calc.factorial(-5)
```

## Best Practices

1. **Read Contributing Guidelines**: Check CONTRIBUTING.md
2. **Follow Code Style**: Use project's style guide
3. **Write Tests**: Cover your changes
4. **Small PRs**: One feature/fix per PR
5. **Clear Commits**: Descriptive commit messages
6. **Update Documentation**: If needed
7. **Be Patient**: Reviews take time
8. **Be Respectful**: Professional communication
