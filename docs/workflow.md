# Workflow Documentation

## Overview

The PRP workflow is a **three-step process** that ensures proper project setup and PRP generation. Each step must complete successfully before proceeding to the next.

## Workflow Steps

### 🔄 Step 1: Read Context (`step-1-read-context.sh`)

**Purpose:** Parse and validate project context from `initial.md`

**What it does:**
- Checks if `initial.md` exists
- Validates required fields (Language, Purpose)
- Extracts key project information
- Ensures context is complete and valid

**Required fields in initial.md:**
```markdown
Language: [your-language]
Purpose: [project-purpose]
Framework: [framework-if-applicable]
Key Requirements: [list-of-requirements]
Technical Constraints: [list-of-constraints]
Success Criteria: [measurable-criteria]
```

**Success criteria:**
- ✅ `initial.md` file exists
- ✅ Language field is specified
- ✅ Purpose field is specified
- ✅ No critical validation errors

**Error handling:**
- Exits with error code 1 if validation fails
- Provides clear error messages
- Suggests fixes for common issues

### 🔄 Step 2: Update Template (`step-2-update-template.sh`)

**Purpose:** Adapt the base PRP template for the project's language and context

**What it does:**
- Detects project language from `initial.md`
- Loads appropriate language-specific hints
- Updates base template with language patterns
- Creates versioned templates for reuse

**Language detection:**
- Reads Language field from `initial.md`
- Maps to available language hints
- Falls back to common patterns if needed
- Supports: Python, Next.js, Rust, Go, Java, Ruby, PHP

**Template updates:**
- Adds language-specific sections
- Includes common patterns and structures
- Provides testing and error handling examples
- Maintains universal best practices

**Success criteria:**
- ✅ Language detected successfully
- ✅ Template updated with language patterns
- ✅ Versioned template created (if new language)
- ✅ No critical errors during update process

**Error handling:**
- Exits if template update fails
- Provides language detection feedback
- Logs template modification steps

### 🔄 Step 3: Create PRP (`step-3-create-prp.sh`)

**Purpose:** Generate the final project-specific PRP document

**What it does:**
- Combines updated template with project context
- Replaces all placeholders with actual content
- Extracts requirements and constraints
- Creates project metadata and backups

**Content generation:**
- Project name and basic information
- Language and framework details
- Key requirements from `initial.md`
- Technical constraints and success criteria
- Implementation phases and tasks
- Validation gates and quality checks

**File outputs:**
- `[project-name].prp` - Main PRP document
- `project-metadata.json` - Project information
- `backups/` - Timestamped PRP backups
- Template version tracking

**Success criteria:**
- ✅ PRP file generated successfully
- ✅ All placeholders replaced
- ✅ Project metadata created
- ✅ Backup files generated
- ✅ File validation passed

**Error handling:**
- Exits if PRP generation fails
- Warns about remaining placeholders
- Provides detailed error context
- Maintains backup safety

## Workflow Orchestration

### Main Workflow (`enforce-prp-workflow.sh`)

**Purpose:** Coordinate all workflow steps and ensure proper execution order

**What it does:**
- Validates project directory structure
- Executes steps in correct sequence
- Provides progress feedback
- Handles step failures gracefully

**Execution flow:**
```bash
# Check prerequisites
if [ ! -f "initial.md" ]; then
    echo "❌ ERROR: Not in a project directory!"
    exit 1
fi

echo "📋 Workflow Steps:"
echo "1. Read project context from initial.md"
echo "2. Update base PRP template for project language"
echo "3. Create project-specific PRP"
echo ""

# Execute each step in sequence
./workflows/step-1-read-context.sh || exit 1
./workflows/step-2-update-template.sh || exit 1
./workflows/step-3-create-prp.sh || exit 1

# Validate workflow completion
./workflows/validate-workflow.sh
```

**Error handling:**
- Exits immediately if any step fails
- Provides clear error context
- Maintains workflow state integrity
- Suggests recovery actions

### Validation (`validate-workflow.sh`)

**Purpose:** Ensure all workflow steps completed successfully

**What it does:**
- Checks for required output files
- Validates file contents and structure
- Confirms workflow completion
- Provides validation summary

**Required files:**
- `initial.md` - Project context
- `templates/prp-base-updated.md` - Updated template
- `*.prp` - Generated PRP document

**Validation checks:**
- File existence and accessibility
- Content completeness
- Structure integrity
- Metadata consistency

**Success criteria:**
- ✅ All required files present
- ✅ File contents valid
- ✅ Workflow state consistent
- ✅ No critical validation errors

## Workflow States

### State 1: Initial Setup
- Project directory created
- Template files copied
- `initial.md` needs to be created/edited

### State 2: Context Ready
- `initial.md` contains project details
- Ready to run workflow
- All prerequisites met

### State 3: Template Updated
- Base template adapted for language
- Language-specific patterns added
- Ready for PRP generation

### State 4: PRP Generated
- Project-specific PRP created
- All placeholders replaced
- Ready for implementation

### State 5: Workflow Complete
- All steps completed successfully
- Validation passed
- Project ready for development

## Error Recovery

### Step Failure Recovery
If any step fails:
1. **Check error messages** for specific issues
2. **Fix the problem** (missing files, permissions, etc.)
3. **Re-run the workflow** from the beginning
4. **Verify prerequisites** are met

### Partial Completion Recovery
If workflow stops partway:
1. **Check current state** using validation script
2. **Identify last successful step**
3. **Fix any issues** that caused failure
4. **Continue from failed step** or restart workflow

### Data Loss Prevention
- **Automatic backups** created at each step
- **Template versioning** preserves language-specific patterns
- **Project metadata** tracks workflow progress
- **Validation checks** prevent incomplete states

## Customization

### Adding New Steps
1. Create new step script in `workflows/` directory
2. Follow naming convention: `step-N-description.sh`
3. Implement proper error handling and exit codes
4. Update main workflow to include new step
5. Add validation checks for new step outputs

### Modifying Existing Steps
1. **Backup current step** before modification
2. **Test changes** with sample projects
3. **Update documentation** to reflect changes
4. **Maintain backward compatibility** when possible
5. **Version control** all modifications

### Workflow Extensions
- **Parallel execution** for independent steps
- **Conditional steps** based on project type
- **Integration hooks** for external tools
- **Custom validation** rules and checks
- **Reporting and analytics** for workflow metrics

## Best Practices

### Workflow Design
- **Keep steps atomic** and focused
- **Clear dependencies** between steps
- **Consistent error handling** across all steps
- **Comprehensive validation** at each stage
- **Detailed logging** for debugging

### Error Handling
- **Fail fast** on critical errors
- **Provide clear error messages**
- **Suggest recovery actions**
- **Maintain data integrity**
- **Log all error conditions**

### User Experience
- **Clear progress indicators**
- **Helpful error messages**
- **Simple recovery procedures**
- **Comprehensive documentation**
- **Example projects** for reference