# Usage Guide

## Quick Start

1. **Setup your project** (see [Setup Guide](setup.md))
2. **Edit initial.md** with project details
3. **Run the workflow**: `./workflows/enforce-prp-workflow.sh`
4. **Review and customize** the generated PRP
5. **Begin implementation** following the PRP

## Workflow Overview

The PRP workflow consists of three main steps:

### Step 1: Read Context
- Parses `initial.md` for project details
- Validates required information is present
- Extracts language, purpose, and requirements

### Step 2: Update Template
- Detects project language automatically
- Updates base PRP template with language-specific patterns
- Creates versioned templates for reuse

### Step 3: Create PRP
- Generates project-specific PRP document
- Replaces placeholders with actual content
- Creates backups and metadata

## CLI Commands

### prp create
Creates a new PRP based on project context:

```bash
prp create                    # Create with default settings
prp create --template=nextjs  # Use Next.js specific template
prp create --output=my-prp.md # Specify output filename
```

### prp execute
Executes the implementation plan from a PRP:

```bash
prp execute                    # Execute entire PRP
prp execute --phase=1          # Execute specific phase
prp execute --task="Setup DB"  # Execute specific task
prp execute --dry-run          # Show execution plan
```

### prp validate
Validates a PRP against quality standards:

```bash
prp validate                    # Validate current PRP
prp validate --fix              # Auto-fix common issues
prp validate --strict           # Use strict validation rules
```

## Customization

### Modifying Templates
Templates are located in `templates/` directory:
- `prp-base.md` - Base template for all projects
- `language-hints/` - Language-specific patterns
- `versioned-templates/` - Saved language versions

### Adding Language Support
1. Create new language hint file: `templates/language-hints/yourlang.md`
2. Follow the existing pattern structure
3. Include common patterns, project structure, and examples
4. Test with a sample project

### Custom Validation Rules
Create custom validation rules in JSON format:

```json
{
  "company_standards": {
    "required_sections": ["security", "compliance"],
    "quality_threshold": 0.9
  },
  "architecture_guidelines": {
    "preferred_patterns": ["microservices", "event-driven"],
    "forbidden_patterns": ["monolith", "tight-coupling"]
  }
}
```

## Implementation

### Following the PRP
1. **Review the generated PRP** thoroughly
2. **Understand the phases** and their dependencies
3. **Start with Phase 1** (Foundation)
4. **Complete each task** before moving to the next
5. **Update progress** in the PRP as you work
6. **Run validation** regularly to ensure quality

### Task Management
- Each task should be **atomic** (1-4 hours of work)
- **Dependencies** should be clearly identified
- **Success criteria** must be measurable
- **Error handling** should be planned

### Quality Assurance
- **Code reviews** for each completed task
- **Testing** at multiple levels (unit, integration, e2e)
- **Documentation** updates as implementation progresses
- **Performance** monitoring and optimization

## Troubleshooting

### Common Issues

**Workflow fails at Step 1:**
- Ensure `initial.md` exists and is properly formatted
- Check that Language and Purpose are specified
- Verify file permissions

**Template update fails:**
- Check if language hints exist for your language
- Verify template files are present
- Check script permissions

**PRP generation fails:**
- Ensure all previous steps completed successfully
- Check for missing project context
- Verify script dependencies

### Getting Help
- Check the [workflow documentation](workflow.md)
- Review [example projects](../examples/)
- Open an issue on GitHub
- Check the troubleshooting section

## Best Practices

- **Keep initial.md focused** on high-level requirements
- **Use specific, measurable** success criteria
- **Plan for testing** from the beginning
- **Document decisions** and their rationale
- **Regular validation** ensures quality
- **Version control** your PRP changes
- **Collaborate** with team members on PRP content