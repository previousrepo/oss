#!/usr/bin/env python3
"""
Sample contribution to an open source project
This demonstrates fixing common bugs and adding features
"""

# BEFORE: Original buggy code
class DataProcessor_Original:
    def process_data(self, data):
        # Bug 1: No input validation
        result = []
        for item in data:
            result.append(item.upper())
        return result
    
    def calculate_stats(self, numbers):
        # Bug 2: Division by zero
        return {
            'sum': sum(numbers),
            'average': sum(numbers) / len(numbers),
            'count': len(numbers)
        }
    
    def find_item(self, items, key):
        # Bug 3: No handling for not found
        for item in items:
            if item['id'] == key:
                return item


# AFTER: Fixed and improved code
class DataProcessor:
    """Process and analyze data with proper error handling."""
    
    def process_data(self, data):
        """Process data items to uppercase.
        
        Args:
            data: List of string items to process
            
        Returns:
            List of uppercase strings
            
        Raises:
            TypeError: If data is not iterable or contains non-strings
        """
        if not hasattr(data, '__iter__'):
            raise TypeError("Data must be iterable")
        
        result = []
        for item in data:
            if not isinstance(item, str):
                raise TypeError(f"Expected string, got {type(item).__name__}")
            result.append(item.upper())
        return result
    
    def calculate_stats(self, numbers):
        """Calculate statistics for a list of numbers.
        
        Args:
            numbers: List of numeric values
            
        Returns:
            Dictionary with sum, average, and count
            
        Raises:
            ValueError: If numbers list is empty
            TypeError: If numbers contains non-numeric values
        """
        if not numbers:
            raise ValueError("Cannot calculate stats for empty list")
        
        # Validate all items are numbers
        for num in numbers:
            if not isinstance(num, (int, float)):
                raise TypeError(f"Expected number, got {type(num).__name__}")
        
        total = sum(numbers)
        return {
            'sum': total,
            'average': total / len(numbers),
            'count': len(numbers),
            'min': min(numbers),  # Added feature
            'max': max(numbers)   # Added feature
        }
    
    def find_item(self, items, key):
        """Find item by key in list of dictionaries.
        
        Args:
            items: List of dictionaries
            key: Key value to search for
            
        Returns:
            Found item dictionary or None if not found
            
        Raises:
            TypeError: If items is not a list or contains non-dicts
        """
        if not isinstance(items, list):
            raise TypeError("Items must be a list")
        
        for item in items:
            if not isinstance(item, dict):
                raise TypeError("Items must contain dictionaries")
            if item.get('id') == key:
                return item
        
        return None  # Explicit return for not found


# Tests for the fixes
def test_data_processor():
    """Test the DataProcessor class."""
    processor = DataProcessor()
    
    # Test 1: process_data with valid input
    result = processor.process_data(['hello', 'world'])
    assert result == ['HELLO', 'WORLD'], "Should convert to uppercase"
    
    # Test 2: process_data with invalid input
    try:
        processor.process_data(['hello', 123])
        assert False, "Should raise TypeError"
    except TypeError:
        pass  # Expected
    
    # Test 3: calculate_stats with valid input
    stats = processor.calculate_stats([1, 2, 3, 4, 5])
    assert stats['sum'] == 15
    assert stats['average'] == 3.0
    assert stats['count'] == 5
    assert stats['min'] == 1
    assert stats['max'] == 5
    
    # Test 4: calculate_stats with empty list
    try:
        processor.calculate_stats([])
        assert False, "Should raise ValueError"
    except ValueError:
        pass  # Expected
    
    # Test 5: find_item found
    items = [{'id': 1, 'name': 'Item 1'}, {'id': 2, 'name': 'Item 2'}]
    result = processor.find_item(items, 1)
    assert result == {'id': 1, 'name': 'Item 1'}
    
    # Test 6: find_item not found
    result = processor.find_item(items, 999)
    assert result is None, "Should return None for not found"
    
    print("All tests passed!")


if __name__ == '__main__':
    test_data_processor()
    print("\nContribution Summary:")
    print("1. Fixed: Added input validation to process_data")
    print("2. Fixed: Added empty list check in calculate_stats")
    print("3. Fixed: Added explicit None return in find_item")
    print("4. Added: min and max statistics")
    print("5. Added: Comprehensive error messages")
    print("6. Added: Full documentation with docstrings")
    print("7. Added: Type checking for all inputs")
