# PRP Create Command - CLI Version

## Command: `prp create`

### Purpose
Creates a new Project Requirements Document (PRP) based on the current project context.

### Usage
```bash
prp create [options]

# Examples
prp create                    # Create PRP with default settings
prp create --template=nextjs  # Use Next.js specific template
prp create --output=my-prp.md # Specify output filename
```

### Options
- `--template=<language>` - Use language-specific template (python, nextjs, rust, etc.)
- `--output=<filename>` - Specify output filename (default: project-name.prp)
- `--force` - Overwrite existing PRP file if it exists
- `--validate` - Run validation after creation
- `--help` - Show help information

### Workflow
1. **Read Context** - Parse initial.md for project details
2. **Select Template** - Choose appropriate base template based on language
3. **Merge Context** - Combine template with project-specific information
4. **Generate PRP** - Create final PRP document
5. **Validate** - Ensure PRP meets quality standards
6. **Save** - Write PRP to output file and create backup

### Output
- Creates `[project-name].prp` file
- Generates backup in `backups/` directory
- Updates project metadata if applicable
- Logs creation process for audit trail

### Error Handling
- Validates initial.md exists and is properly formatted
- Checks template availability for specified language
- Provides clear error messages for common issues
- Suggests fixes for validation failures

### Examples

#### Basic Creation
```bash
$ prp create
✅ Reading project context...
✅ Language detected: Python
✅ Template selected: Python
✅ PRP generated: my-project.prp
✅ Validation passed
✅ PRP created successfully!
```

#### With Custom Options
```bash
$ prp create --template=nextjs --output=requirements.md
✅ Reading project context...
✅ Language detected: JavaScript
✅ Template selected: Next.js
✅ PRP generated: requirements.md
✅ Validation passed
✅ PRP created successfully!
```

#### Error Handling
```bash
$ prp create
❌ ERROR: initial.md not found!
   Create initial.md with project context first
   Use generate-project.sh to create a new project

$ prp create --template=unknown
❌ ERROR: Template 'unknown' not found!
   Available templates: python, nextjs, rust, common
   Use --help for more information
```