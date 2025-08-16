# Rust Language Hints

## Common Patterns
- Use Cargo for package management
- Follow Rust naming conventions
- Implement proper error handling with Result<T, E>
- Use Option<T> for nullable values
- Write comprehensive tests
- Use clap for CLI applications

## Project Structure
```
project_name/
├── src/
│   ├── main.rs
│   ├── lib.rs
│   └── modules/
│       ├── mod.rs
│       └── submodule.rs
├── tests/
│   └── integration_tests.rs
├── examples/
├── Cargo.toml
├── README.md
└── .gitignore
```

## Common Dependencies
- tokio for async runtime (if needed)
- serde for serialization
- clap for command-line argument parsing
- anyhow for error handling
- thiserror for custom error types
- criterion for benchmarking

## Error Handling Patterns
```rust
use anyhow::{Context, Result};

pub fn process_data(input: &str) -> Result<String> {
    let parsed = input.parse::<i32>()
        .context("Failed to parse input as integer")?;
    Ok(parsed.to_string())
}
```

## Testing Patterns
```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_process_data() {
        let result = process_data("42").unwrap();
        assert_eq!(result, "42");
    }

    #[test]
    fn test_process_data_invalid() {
        let result = process_data("invalid");
        assert!(result.is_err());
    }
}
```

## Module Patterns
```rust
// lib.rs
pub mod modules;

// modules/mod.rs
pub mod submodule;
pub use submodule::*;

// modules/submodule.rs
pub struct MyStruct {
    pub field: String,
}

impl MyStruct {
    pub fn new(field: String) -> Self {
        Self { field }
    }
}
```