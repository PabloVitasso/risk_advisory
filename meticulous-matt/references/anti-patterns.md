# Anti-Patterns Reference

Patterns to search for during codebase analysis.

## Code Smells

### Long Methods/Functions
```
# Look for functions over 50 lines
# Manual review of function lengths in key files
```

### God Objects/Classes
- Classes with 10+ public methods
- Files over 500 lines
- Classes that "know too much" about other parts of the system

### Feature Envy
- Methods that use more data from other classes than their own
- Excessive getter chains: `obj.getA().getB().getC().getValue()`

### Primitive Obsession
- Using strings for everything (IDs, statuses, types)
- Passing 5+ parameters of primitive types
- Magic strings/numbers without constants

### Duplicated Code
```bash
# Find similar code blocks (manual inspection often needed)
# Look for copy-paste patterns
```

## SOLID Violations

### Single Responsibility Violations
- Classes handling UI + business logic + data access
- Methods doing multiple unrelated things
- "Manager" or "Helper" classes (often catch-alls)

### Open/Closed Violations
- Switch statements on type codes
- Repeated if/else chains checking object types
- Methods that need modification for every new feature

### Liskov Substitution Violations
- Subclasses that throw "not implemented" exceptions
- Overrides that change method behavior unexpectedly
- Base class methods that check `instanceof`

### Interface Segregation Violations
- Interfaces with 10+ methods
- Classes implementing interfaces with unused methods
- "Fat" interfaces clients don't fully use

### Dependency Inversion Violations
- High-level modules importing low-level modules directly
- Hard-coded class instantiation (`new ConcreteClass()`)
- No dependency injection

## Test Anti-Patterns

### Weak Assertions
```
# Tests that only check "not null" or "no exception"
assert result is not None  # Too weak
assert response.status_code == 200  # Missing body checks
expect(result).toBeTruthy()  # What does truthy mean here?
```

### Test Duplication
- Same setup code in many tests (missing fixtures)
- Repeated assertion patterns (missing custom matchers)

### Flaky Tests
- Tests depending on timing
- Tests depending on external services
- Tests with random data without seeding

### Missing Edge Cases
- Only happy path tested
- No error/exception testing
- No boundary value testing

### Tests That Don't Test
```
# Tests that always pass
def test_something():
    result = do_thing()
    assert True  # Useless
```

## Architectural Anti-Patterns

### Circular Dependencies
- Module A imports B, B imports A
- Service layers calling back to controllers

### Missing Abstraction Layers
- UI code directly accessing database
- Business logic scattered across layers

### Anemic Domain Model
- Entity classes with only getters/setters
- All logic in "service" classes

### Distributed Monolith
- Microservices that must deploy together
- Services with synchronous chains of calls

### Hardcoded Configuration
- Environment-specific values in code
- Credentials in source files

## Grep Patterns for Discovery

```bash
# TODO/FIXME/HACK comments
grep -r "TODO\|FIXME\|HACK\|XXX" --include="*.{js,ts,py,rb,go,java}"

# Empty catch blocks
grep -rn "catch.*{[\s]*}" --include="*.{js,ts,java}"

# Console/print debugging left in
grep -rn "console\.log\|print(\|puts " --include="*.{js,ts,py,rb}"

# Hardcoded credentials patterns
grep -rn "password\s*=\|api_key\s*=\|secret\s*=" --include="*.{js,ts,py,rb,go}"

# Magic numbers
grep -rn "[^a-zA-Z][0-9]{2,}[^a-zA-Z0-9]" --include="*.{js,ts,py,rb}"

# Long parameter lists (5+ params)
# Requires manual inspection of function signatures
```
