# Customization Guide

## Overview

The Archon CE Template system is designed to be **highly customizable** while maintaining consistency and reliability. This guide covers how to adapt the system for your specific needs.

## Template Customization

### Modifying Base PRP Template (`templates/prp-base.md`)

**Location:** `templates/prp-base.md`

**What you can customize:**
- Section structure and order
- Required fields and validation rules
- Default content and examples
- Language-specific patterns
- Validation gate requirements

**Example customizations:**
```markdown
# Add custom section
## 🏢 Company Standards
- [ ] Follows company coding standards
- [ ] Meets security requirements
- [ ] Complies with accessibility guidelines

# Modify validation gates
### Security & Compliance
- [ ] OWASP Top 10 addressed
- [ ] GDPR compliance verified
- [ ] Security audit completed
```

**Best practices:**
- **Backup original** before making changes
- **Test changes** with sample projects
- **Document modifications** in comments
- **Maintain compatibility** with existing workflows
- **Version control** your customizations

### Language-Specific Hints (`templates/language-hints/`)

**Location:** `templates/language-hints/[language].md`

**What you can customize:**
- Common patterns and best practices
- Project structure recommendations
- Dependency management
- Testing strategies
- Error handling approaches

**Example customizations:**
```markdown
# Add company-specific patterns
## Company Standards
- Use internal component library
- Follow design system guidelines
- Implement company authentication
- Use approved third-party services

# Add project templates
## Project Templates
- **API Service**: FastAPI + PostgreSQL + Redis
- **Web App**: Next.js + Tailwind + Prisma + PostgreSQL
- **CLI Tool**: Click + Rich + Typer
```

**Adding new languages:**
1. Create new language file: `templates/language-hints/yourlang.md`
2. Follow existing structure and format
3. Include comprehensive patterns and examples
4. Test with sample projects
5. Add to language detection script

### Versioned Templates (`templates/versioned-templates/`)

**Location:** `templates/versioned-templates/`

**Purpose:** Preserve successful template versions for reuse.

**Naming convention:** `[language]-template-v[version].md`

**When versions are created:**
- New language support added
- Significant template improvements
- Company standards updated
- Major structural changes

**Managing versions:**
- **Keep recent versions** (last 5-10)
- **Archive old versions** to separate directory
- **Document version changes** in changelog
- **Test compatibility** with existing projects

## Workflow Customization

### Adding New Workflow Steps

**Location:** `workflows/` directory

**Naming convention:** `step-N-description.sh`

**Example new step:**
```bash
#!/bin/bash
# step-4-validate-prp.sh - Validate generated PRP

echo "🔍 Step 4: Validating generated PRP..."

# Run PRP validation
./scripts/validate-prp.sh

if [ $? -eq 0 ]; then
    echo "✅ Step 4: PRP validation passed"
else
    echo "❌ ERROR: PRP validation failed"
    exit 1
fi
```

**Integration:**
1. Add step to main workflow (`enforce-prp-workflow.sh`)
2. Update validation script (`validate-workflow.sh`)
3. Test with sample projects
4. Update documentation

### Modifying Existing Steps

**Backup strategy:**
```bash
# Before modification
cp workflows/step-2-update-template.sh workflows/step-2-update-template.sh.backup

# After testing
cp workflows/step-2-update-template.sh workflows/step-2-update-template.sh.backup.$(date +%Y%m%d)
```

**Testing changes:**
1. **Create test project** with known configuration
2. **Run workflow** with modified step
3. **Verify outputs** match expectations
4. **Check error handling** with invalid inputs
5. **Validate compatibility** with other steps

### Custom Validation Rules

**Location:** `scripts/` directory

**Example custom validation:**
```bash
#!/bin/bash
# validate-company-standards.sh - Company-specific validation

# Check company requirements
if ! grep -q "Company Standards" "$PRP_FILE"; then
    echo "❌ ERROR: Missing company standards section"
    exit 1
fi

echo "✅ Company standards validation passed"
```

**Integration:**
1. Add to validation workflow
2. Update validation scripts
3. Include in CLI commands
4. Document requirements

## Script Customization

### Utility Scripts (`scripts/`)

**Location:** `scripts/` directory

**What you can customize:**
- Language detection logic
- Template update strategies
- PRP generation rules
- Validation criteria
- Backup and versioning

**Example customizations:**
```bash
# Add company language support
if [ "$LANGUAGE" = "COMPANY_SPECIFIC" ]; then
    echo "   📝 Applying company-specific patterns..."
    # Add company patterns
    cat >> "templates/prp-base-updated.md" << EOF
## 🏢 Company Standards
- Use approved libraries only
- Follow security guidelines
- Implement audit logging
EOF
fi
```

**Best practices:**
- **Maintain compatibility** with existing scripts
- **Add configuration options** for flexibility
- **Implement proper error handling**
- **Log all operations** for debugging
- **Test thoroughly** before deployment

### CLI Commands (`commands/`)

**Location:** `commands/prp-commands/`

**What you can customize:**
- Command syntax and options
- Validation rules
- Output formats
- Integration with external tools
- Company-specific requirements

**Example customizations:**
```bash
# Add company validation
if [ "$COMPANY_MODE" = "true" ]; then
    echo "🔍 Running company validation..."
    ./scripts/validate-company-standards.sh "$PRP_FILE"
    if [ $? -ne 0 ]; then
        echo "❌ Company validation failed"
        exit 1
    fi
fi
```

**Integration:**
1. Update command documentation
2. Add configuration options
3. Test with company projects
4. Update help and examples

## Configuration Options

### Environment Variables

**Template customization:**
```bash
# .env or environment
TEMPLATE_CUSTOM_PATH="/path/to/custom/templates"
COMPANY_MODE="true"
VALIDATION_STRICTNESS="high"
BACKUP_RETENTION_DAYS="30"
```

**Script configuration:**
```bash
# In scripts
TEMPLATE_PATH="${TEMPLATE_CUSTOM_PATH:-templates}"
COMPANY_MODE="${COMPANY_MODE:-false}"
VALIDATION_LEVEL="${VALIDATION_STRICTNESS:-medium}"
```

### Configuration Files

**Template configuration:**
```json
// config/templates.json
{
  "default_language": "python",
  "company_standards": true,
  "validation_rules": ["security", "performance", "accessibility"],
  "custom_sections": ["compliance", "audit"],
  "versioning": {
    "auto_version": true,
    "retention_days": 90
  }
}
```

**Workflow configuration:**
```json
// config/workflow.json
{
  "steps": ["read_context", "update_template", "create_prp", "validate"],
  "parallel_execution": false,
  "error_handling": "strict",
  "logging": "detailed",
  "backup_strategy": "incremental"
}
```

## Integration with External Tools

### CI/CD Integration

**GitHub Actions example:**
```yaml
name: PRP Validation
on: [push, pull_request]
jobs:
  validate-prp:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup PRP Workflow
        run: ./workflows/setup-prp-workflow.sh
      - name: Validate PRP
        run: ./workflows/validate-workflow.sh
```

**GitLab CI example:**
```yaml
stages:
  - validate-prp

prp-validation:
  stage: validate-prp
  script:
    - ./workflows/setup-prp-workflow.sh
    - ./workflows/validate-workflow.sh
```

### IDE Integration

**VS Code extension:**
- Syntax highlighting for PRP files
- Workflow execution commands
- Validation feedback
- Template customization
- Project generation

**JetBrains plugin:**
- PRP file support
- Workflow integration
- Template management
- Validation tools

## Testing Customizations

### Test Strategy

1. **Unit tests** for individual scripts
2. **Integration tests** for workflow steps
3. **End-to-end tests** for complete workflows
4. **Regression tests** for existing functionality
5. **Performance tests** for large projects

### Test Environment

```bash
# Create test environment
mkdir test-project
cd test-project
cp -r ../archon-ce-template/* .
chmod +x workflows/*.sh scripts/*.sh

# Test with sample data
echo "Language: Python" > initial.md
echo "Purpose: Test project" >> initial.md
./workflows/enforce-prp-workflow.sh
```

### Validation Checklist

- [ ] **Functionality** - All features work as expected
- [ ] **Compatibility** - Existing projects still work
- [ ] **Performance** - No significant slowdowns
- [ ] **Error handling** - Graceful failure modes
- [ ] **Documentation** - Updated and accurate
- [ ] **Testing** - Comprehensive test coverage