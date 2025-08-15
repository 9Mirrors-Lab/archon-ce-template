# Template Management Scripts

This directory contains comprehensive scripts for managing PRP templates, versions, and project integration.

## Quick Start

```bash
# Initialize the template system
./manage-templates.sh init

# Show system status
./manage-templates.sh status

# Create new project with templates
./manage-templates.sh new-project --project-path ./my-project --language nextjs

# Integrate templates into existing project
./manage-templates.sh integrate-project --project-path ./existing-project
```

## Script Overview

### 🚀 Main Management Script

#### `manage-templates.sh`
**The central orchestrator for all template operations.**

**Commands:**
- `init` - Initialize template system
- `status` - Show system health and status
- `backup` - Create automatic backup
- `restore` - Restore from backup
- `new-project` - Create new project with templates
- `integrate-project` - Integrate templates into existing project
- `cleanup` - Clean up old backups and versions
- `repair` - Repair corrupted templates
- `migrate` - Migrate to new template format

**Usage Examples:**
```bash
# Initialize system
./manage-templates.sh init

# Create Next.js project
./manage-templates.sh new-project --project-path ./my-app --language nextjs

# Integrate into existing project
./manage-templates.sh integrate-project --project-path ./legacy-project

# Check system health
./manage-templates.sh status
```

### 📋 Template Management

#### `template-manager.sh`
**Manages PRP template versions and language-specific customizations.**

**Commands:**
- `list` - List all available templates
- `create-version` - Create new version of base template
- `update-language` - Update template for specific language
- `restore-version` - Restore specific version
- `compare-versions` - Compare two template versions
- `cleanup-old` - Clean up old template versions

**Usage Examples:**
```bash
# List all templates
./template-manager.sh list

# Create new version
./template-manager.sh create-version --message "Updated for Next.js projects"

# Update template for specific language
./template-manager.sh update-language --lang nextjs --project-path ./my-project

# Restore previous version
./template-manager.sh restore-version --version 2

# Compare versions
./template-manager.sh compare-versions --v1 1 --v2 2
```

### 🔄 Template Synchronization

#### `template-sync.sh`
**Synchronizes templates between local projects and the template repository.**

**Commands:**
- `init` - Initialize local template directory
- `sync` - Sync templates from remote repository
- `push-changes` - Push local template changes to remote
- `install-project` - Install templates to a project directory
- `update-project` - Update project with latest templates
- `status` - Show sync status

**Usage Examples:**
```bash
# Initialize local templates
./template-sync.sh init

# Sync from remote
./template-sync.sh sync

# Install to project
./template-sync.sh install-project --path ./my-project

# Update project
./template-sync.sh update-project --path ./my-project

# Check sync status
./template-sync.sh status
```

### ✅ Template Validation

#### `template-validator.sh`
**Validates PRP template structure and content.**

**Commands:**
- `--all` - Validate all templates
- `--template PATH` - Validate specific template file
- `--strict` - Treat warnings as errors
- `--output FORMAT` - Output format (text, json, xml)

**Usage Examples:**
```bash
# Validate all templates
./template-validator.sh --all

# Validate specific template
./template-validator.sh --template ./my-template.md

# Strict validation (warnings as errors)
./template-validator.sh --all --strict

# JSON output
./template-validator.sh --all --output json
```

### 💾 Template Backup & Restore

#### `template-backup.sh`
**Manages template backups and restoration.**

**Commands:**
- `backup` - Create backup of current templates
- `restore` - Restore templates from backup
- `list-backups` - List all available backups
- `delete-backup` - Delete specific backup
- `auto-backup` - Create automatic backup before changes
- `cleanup-backups` - Clean up old backups
- `verify-backup` - Verify backup integrity

**Usage Examples:**
```bash
# Create backup
./template-backup.sh backup --name "before-update" --description "Backup before major update"

# List backups
./template-backup.sh list-backups

# Restore from backup
./template-backup.sh restore --backup-id 20241215_143022

# Verify backup
./template-backup.sh verify-backup --backup-id 20241215_143022

# Clean up old backups
./template-backup.sh cleanup-backups --keep-count 5
```

## Workflow Integration

### New Project Creation
```bash
# 1. Initialize template system
./manage-templates.sh init

# 2. Create new project
./manage-templates.sh new-project --project-path ./my-project --language nextjs

# 3. Edit INITIAL.md with project details
# 4. Run PRP workflow
cd my-project
./enforce-prp-workflow.sh
```

### Existing Project Integration
```bash
# 1. Integrate templates
./manage-templates.sh integrate-project --project-path ./existing-project

# 2. Follow integration guide
# 3. Customize templates as needed
# 4. Run PRP workflow
cd existing-project
./enforce-prp-workflow.sh
```

### Template Maintenance
```bash
# 1. Check system status
./manage-templates.sh status

# 2. Create backup before changes
./manage-templates.sh backup

# 3. Make changes to templates
# 4. Validate changes
./template-validator.sh --all

# 5. Create new version
./template-manager.sh create-version --message "Description of changes"
```

## Advanced Features

### Language-Specific Customization
The system automatically detects and customizes templates for:
- **Python** - pip, requirements.txt, .py files
- **Next.js** - npm, package.json, .tsx files  
- **Rust** - cargo, Cargo.toml, .rs files

### Version Control
- Automatic versioning with timestamps
- Change tracking and descriptions
- Easy rollback to previous versions
- Version comparison tools

### Backup Management
- Automatic backups before changes
- Compressed backup storage
- Integrity verification
- Configurable retention policies

### Validation System
- Markdown structure validation
- Content quality checks
- Language-specific validation
- Multiple output formats

## Configuration

### Environment Variables
```bash
# Template repository URL
TEMPLATE_REPO_URL="https://github.com/9Mirrors-Lab/archon-ce-template.git"

# Local template directory
LOCAL_TEMPLATE_DIR="$HOME/.archon-templates"

# Backup retention
KEEP_BACKUPS=10
KEEP_VERSIONS=5
```

### Directory Structure
```
scripts/
├── manage-templates.sh      # Main orchestrator
├── template-manager.sh      # Template versioning
├── template-sync.sh         # Repository sync
├── template-validator.sh    # Validation tools
├── template-backup.sh       # Backup management
└── README.md               # This file
```

## Troubleshooting

### Common Issues

**Script not executable:**
```bash
chmod +x scripts/*.sh
```

**Missing dependencies:**
```bash
# Check system requirements
./manage-templates.sh status

# Install missing tools
# - Git for version control
# - Tar for backup compression
# - Sha256sum for integrity checks
```

**Template corruption:**
```bash
# Validate templates
./template-validator.sh --all

# Restore from backup
./template-backup.sh list-backups
./template-backup.sh restore --backup-id <ID>
```

**Sync issues:**
```bash
# Check sync status
./template-sync.sh status

# Reinitialize if needed
./template-sync.sh init
```

### Getting Help

1. **Check system status:** `./manage-templates.sh status`
2. **Validate templates:** `./template-validator.sh --all`
3. **Review logs:** Check script output for error messages
4. **Check backups:** `./template-backup.sh list-backups`

## Contributing

When adding new scripts or modifying existing ones:

1. **Follow the pattern:** Use consistent error handling, colors, and structure
2. **Add validation:** Include input validation and error checking
3. **Update documentation:** Keep this README current
4. **Test thoroughly:** Verify scripts work in different scenarios
5. **Add to main script:** Integrate new functionality into `manage-templates.sh`

## License

This project is licensed under the MIT License - see the main LICENSE file for details.