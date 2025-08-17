# Rust CLI Data Processor

This is an example project showing how to use the Archon CE Template system with a Rust project.

## Project Structure

```
rust-example/
├── initial.md              # Project context (this file)
├── README.md              # Project documentation
├── Cargo.toml             # Rust package configuration
├── src/                   # Source code directory
│   ├── main.rs            # Application entry point
│   ├── lib.rs             # Library root
│   ├── cli.rs             # Command-line interface
│   ├── processor.rs       # Data processing logic
│   ├── formats/           # File format handlers
│   │   ├── csv.rs         # CSV processing
│   │   ├── json.rs        # JSON processing
│   │   └── xml.rs         # XML processing
│   ├── utils.rs           # Utility functions
│   └── error.rs           # Error handling
├── tests/                 # Test directory
│   ├── test_processor.rs  # Processor tests
│   ├── test_formats.rs    # Format handler tests
│   └── test_cli.rs        # CLI tests
├── examples/              # Example usage scripts
├── docs/                  # Documentation
│   ├── usage.md           # Usage guide
│   └── performance.md     # Performance guide
└── benches/               # Performance benchmarks
    └── benchmark.rs       # Benchmarking code
```

## How to Use This Example

1. **Copy the template structure** to your project
2. **Edit initial.md** with your specific requirements
3. **Run the PRP workflow**: `./workflows/enforce-prp-workflow.sh`
4. **Review the generated PRP** and customize as needed
5. **Begin implementation** following the PRP phases

## Key Features

- **High-performance Rust** for efficient data processing
- **Parallel processing** for large datasets
- **Memory-efficient streaming** for large files
- **Multiple format support** (CSV, JSON, XML)
- **Command-line interface** with clap
- **Comprehensive error handling** with anyhow
- **Performance benchmarking** with criterion
- **Cross-platform compatibility**

## Next Steps

After running the PRP workflow:
1. Review the generated `rust-example.prp`
2. Customize implementation phases and tasks
3. Set up your development environment
4. Begin with Phase 1: Foundation
5. Follow the PRP validation gates

## Learn More

- [Archon CE Template Documentation](../../docs/)
- [Rust Language Hints](../../templates/language-hints/rust.md)
- [Workflow Documentation](../../docs/workflow.md)
- [Usage Guide](../../docs/usage.md)