# Project: Rust CLI Data Processor

## Project Context
Language: Rust
Framework: None (CLI application)
Purpose: Build a high-performance command-line tool for processing large datasets with memory efficiency and parallel processing

## Key Requirements
- Process CSV, JSON, and XML files
- Support for multiple input/output formats
- Parallel processing for large datasets
- Memory-efficient streaming for large files
- Configurable data transformations
- Progress reporting and logging
- Error handling with detailed messages
- Command-line argument parsing
- Configuration file support
- Performance benchmarking

## Technical Constraints
- Rust 1.70+
- Zero external runtime dependencies
- Cross-platform compatibility (Windows, macOS, Linux)
- Memory usage < 100MB for 1GB files
- Processing speed > 100MB/s
- Support for files up to 10GB
- UTF-8 encoding support
- Error recovery and resumability

## Success Criteria
- Process 1GB file in < 10 seconds
- Memory usage stays under 100MB
- Zero data corruption or loss
- Cross-platform compatibility verified
- Comprehensive error handling
- Performance benchmarks documented
- User-friendly error messages