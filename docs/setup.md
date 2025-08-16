# Setup Guide

## Prerequisites

- Git installed on your system
- Basic knowledge of command line operations
- A project you want to set up with PRP workflow

## Installation

### Option 1: Clone and Copy
```bash
# Clone the template repository
git clone https://github.com/9Mirrors-Lab/archon-ce-template.git

# Copy to your new project directory
cp -r archon-ce-template/* /path/to/your/new-project/

# Navigate to your project
cd /path/to/your/new-project
```

### Option 2: Use generate-project.sh
```bash
# Clone the template repository
git clone https://github.com/9Mirrors-Lab/archon-ce-template.git

# Navigate to template directory
cd archon-ce-template

# Generate new project
./generate-project.sh my-awesome-project

# Navigate to new project
cd ../my-awesome-project
```

## Initial Setup

1. **Edit initial.md** with your project details:
   ```markdown
   # Project: My Awesome Project
   
   ## Project Context
   Language: Python
   Framework: FastAPI
   Purpose: Build a REST API for user management
   
   ## Key Requirements
   - User authentication
   - CRUD operations
   - API documentation
   
   ## Technical Constraints
   - Python 3.8+
   - PostgreSQL database
   - Docker deployment
   
   ## Success Criteria
   - API responds in < 200ms
   - 99.9% uptime
   - Comprehensive test coverage
   ```

2. **Run the PRP workflow**:
   ```bash
   ./workflows/enforce-prp-workflow.sh
   ```

3. **Review generated PRP** and customize as needed

## Project Structure

After setup, your project will have:

```
project-name/
├── workflows/           # PRP workflow scripts
├── templates/           # PRP templates and language hints
├── scripts/            # Utility scripts
├── backups/            # PRP backups
├── initial.md          # Project context
├── project-name.prp    # Generated PRP
├── project-metadata.json # Project metadata
└── [your project files]
```

## Next Steps

- [Customize the generated PRP](usage.md#customization)
- [Learn about the workflow](workflow.md)
- [Explore CLI commands](usage.md#cli-commands)
- [Start implementation](usage.md#implementation)