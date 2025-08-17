# Python Language Hints

## Common Patterns
- Use virtual environments (venv, conda)
- Follow PEP 8 style guidelines
- Use type hints for function parameters
- Implement proper error handling with try/except
- Use requirements.txt or pyproject.toml for dependencies

## Project Structure
```
project_name/
├── src/
│   └── project_name/
│       ├── __init__.py
│       ├── core.py
│       └── utils.py
├── tests/
│   ├── __init__.py
│   ├── test_core.py
│   └── test_utils.py
├── docs/
├── requirements.txt
├── pyproject.toml
├── README.md
└── .gitignore
```

## Common Dependencies
- pytest for testing
- black for code formatting
- flake8 for linting
- mypy for type checking
- python-dotenv for environment variables

## Testing Patterns
```python
import pytest
from project_name.core import some_function

def test_some_function():
    result = some_function("test_input")
    assert result == "expected_output"
```

## Error Handling Patterns
```python
try:
    result = risky_operation()
except SpecificError as e:
    logger.error(f"Operation failed: {e}")
    raise CustomError("User-friendly message") from e
```