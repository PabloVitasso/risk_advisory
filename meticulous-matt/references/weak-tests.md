# Weak Tests Reference

Patterns for identifying tests that provide false confidence.

## Test Quality Indicators

### Coverage Theater
Tests that execute code without verifying behavior:
- Tests that call functions but don't assert results
- Tests with only `expect(fn).not.toThrow()`
- Integration tests that check only HTTP 200

### Missing Negative Tests
- No tests for invalid input
- No tests for error conditions
- No tests for edge cases (null, empty, max values)

### Brittle Tests
- Tests coupled to implementation details
- Tests that break when refactoring (without behavior change)
- Tests checking internal state instead of outputs

### Slow Tests
- Unit tests making network calls
- Tests with unnecessary database operations
- Tests with `sleep()` or timing dependencies

## Patterns to Search For

### Empty or Minimal Assertions
```javascript
// JavaScript/TypeScript
expect(result).toBeDefined()
expect(result).toBeTruthy()
expect(result).not.toBeNull()
expect(fn).not.toThrow()
```

```python
# Python
assert result is not None
assert result  # Just checking truthy
assert True
self.assertTrue(True)
```

```ruby
# Ruby
expect(result).to be_truthy
expect(result).not_to be_nil
expect { action }.not_to raise_error
```

### Missing Assertions
```javascript
// Test body with no expect/assert
it('should do something', () => {
  doSomething();
  // No assertion!
});
```

```python
def test_something(self):
    result = do_something()
    # No assertion!
```

### Overly Specific Assertions
```javascript
// Testing implementation, not behavior
expect(mockFn).toHaveBeenCalledTimes(3)
expect(result.__internal_state).toBe('processing')
```

## Analysis Approach

### 1. Test-to-Code Ratio
Calculate lines of test code vs production code:
- Ratio below 0.5:1 often indicates gaps
- Check coverage reports if available

### 2. Assertion Density
Count assertions per test:
- Tests with 0-1 assertions need review
- Look for tests that are "checking something happened" vs "checking correct behavior"

### 3. Test Name Analysis
Vague test names often indicate vague tests:
- `test_it_works`
- `test_basic`
- `should_handle_data`

Good names describe expected behavior:
- `test_returns_error_when_user_not_found`
- `should_calculate_total_with_discount_applied`

### 4. Mock Overuse
Excessive mocking often hides integration problems:
- Count mocks per test
- Tests with 5+ mocks may be testing mocks, not code

### 5. Test Isolation
Check for tests that:
- Share state
- Must run in order
- Clean up after themselves (sign of shared state)

## Grep Patterns

```bash
# Find test files
find . -name "*test*" -o -name "*spec*" | grep -E "\.(js|ts|py|rb)$"

# Empty test bodies (approximate)
grep -A3 "it\(.*\)" --include="*.test.js" | grep -B2 "^--$"

# Weak assertions
grep -rn "toBeDefined\|toBeTruthy\|not.toBeNull" --include="*.test.{js,ts}"
grep -rn "is not None\|assert True" --include="*test*.py"

# Tests without assertions
grep -rn "def test_" --include="*test*.py" -A10 | grep -B10 "def test_" | grep -v "assert\|self\."
```

## Improvement Suggestions

For each weak test found, document:
1. What the test claims to verify
2. What it actually verifies (if anything)
3. What assertions should be added
4. Edge cases missing
