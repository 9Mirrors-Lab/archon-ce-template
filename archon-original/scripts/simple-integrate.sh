#!/bin/bash

# Simple Integration Script for PRP System
# Works directly from the current archon-ce-template directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$(dirname "$SCRIPT_DIR")"

show_usage() {
    echo -e "${BLUE}Simple PRP Integration Script${NC}"
    echo "=================================="
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --project-path PATH    Project directory to integrate (required)"
    echo "  --force                Overwrite existing files"
    echo "  -h, --help            Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 --project-path /path/to/your/project"
}

integrate_project() {
    local project_path=""
    local force=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --project-path)
                project_path="$2"
                shift 2
                ;;
            --force)
                force=true
                shift
                ;;
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                show_usage
                exit 1
                ;;
        esac
    done
    
    if [ -z "$project_path" ]; then
        echo -e "${RED}Error: --project-path is required${NC}"
        show_usage
        exit 1
    fi
    
    if [ ! -d "$project_path" ]; then
        echo -e "${RED}Error: Project directory does not exist: $project_path${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Integrating PRP templates into existing project: $project_path${NC}"
    
    # Check for existing PRP files
    local existing_files=("PRP.md" "prp-template.md" "enforce-prp-workflow.sh")
    local conflicts=()
    
    for file in "${existing_files[@]}"; do
        if [ -f "$project_path/$file" ]; then
            conflicts+=("$file")
        fi
    done
    
    if [ ${#conflicts[@]} -gt 0 ] && [ "$force" != true ]; then
        echo -e "${YELLOW}Warning: The following files already exist:${NC}"
        for file in "${existing_files[@]}"; do
            echo "  - $file"
        done
        echo ""
        read -p "Do you want to overwrite them? (y/N): " confirm
        
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Integration cancelled${NC}"
            exit 0
        fi
    fi
    
    # Install templates
    echo -e "${BLUE}Installing templates...${NC}"
    
    # Copy template files
    local template_files=(
        "templates/prp-base.md"
        "templates/language-hints"
        "workflows"
        "commands"
        "scripts"
        "cursor-rules"
    )
    
    for file_or_dir in "${template_files[@]}"; do
        local source="$TEMPLATE_ROOT/$file_or_dir"
        local dest="$project_path/$(basename "$file_or_dir")"
        
        if [ -e "$source" ]; then
            echo -e "${BLUE}Copying:${NC} $file_or_dir"
            if [ -d "$source" ]; then
                cp -r "$source" "$dest"
            else
                cp "$source" "$dest"
            fi
        else
            echo -e "${YELLOW}Warning: $file_or_dir not found in templates${NC}"
        fi
    done
    
    # Copy main scripts
    local main_scripts=(
        "generate-project.sh"
        "enforce-prp-workflow.sh"
    )
    
    for script in "${main_scripts[@]}"; do
        local source="$TEMPLATE_ROOT/$script"
        local dest="$project_path/$script"
        
        if [ -f "$source" ]; then
            echo -e "${BLUE}Copying:${NC} $script"
            cp "$source" "$dest"
            chmod +x "$dest"
        else
            echo -e "${YELLOW}Warning: $script not found${NC}"
        fi
    done
    
    # Analyze existing codebase
    echo -e "${BLUE}Analyzing existing codebase...${NC}"
    local language=""
    
    # Detect language
    if [ -f "$project_path/package.json" ]; then
        language="nextjs"
    elif [ -f "$project_path/Cargo.toml" ]; then
        language="rust"
    elif [ -f "$project_path/requirements.txt" ] || [ -f "$project_path/setup.py" ] || [ -f "$project_path/pyproject.toml" ]; then
        language="python"
    else
        echo -e "${YELLOW}Warning: Could not detect project language${NC}"
        language="unknown"
    fi
    
    if [ "$language" != "unknown" ]; then
        echo -e "${BLUE}Detected language:${NC} $language"
        
        # Create INITIAL.md with project details
        create_initial_md "$project_path" "$language"
    fi
    
    # Create integration guide
    create_integration_guide "$project_path"
    
    echo -e "${GREEN}Integration completed successfully!${NC}"
    echo -e "${BLUE}Next steps:${NC}"
    echo "  1. Review the copied templates and scripts"
    echo "  2. Fill out INITIAL.md with your project details"
    echo "  3. Run: ./enforce-prp-workflow.sh"
}

create_initial_md() {
    local project_path="$1"
    local language="$2"
    
    cat > "$project_path/INITIAL.md" << EOF
# Project Initialization

## Project Type
$(case "$language" in
    "nextjs") echo "Next.js/TypeScript Frontend" ;;
    "python") echo "Python Backend" ;;
    "rust") echo "Rust Application" ;;
    *) echo "Unknown Language" ;;
esac)

## Project Name
[Your Project Name Here]

## Description
[Brief description of what this project does]

## Key Features
- [Feature 1]
- [Feature 2]
- [Feature 3]

## Technology Stack
- [List your main technologies]

## Goals
- [What you want to achieve]

## Current Status
- [What's already built]
- [What still needs development]

## Development Priorities
- [Priority 1]
- [Priority 2]
- [Priority 3]

## Timeline
[Your target completion date or milestones]
EOF

    echo -e "${BLUE}Created:${NC} INITIAL.md"
}

create_integration_guide() {
    local project_path="$1"
    
    cat > "$project_path/INTEGRATION_GUIDE.md" << EOF
# PRP Integration Guide

This project has been integrated with the Archon PRP (Project Requirements Document) system.

## What Was Added

### Templates
- \`templates/prp-base.md\` - Base PRP template
- \`templates/language-hints/\` - Language-specific guidance
- \`templates/versioned-templates/\` - Template versioning

### Workflows
- \`workflows/\` - PRP workflow enforcement scripts
- \`enforce-prp-workflow.sh\` - Main workflow script

### Commands
- \`commands/\` - CLI versions of PRP commands

### Scripts
- \`scripts/\` - Template management utilities

### Cursor Rules
- \`cursor-rules/\` - IDE-specific configuration

## Next Steps

1. **Fill out INITIAL.md** with your project details
2. **Run the workflow**: \`./enforce-prp-workflow.sh\`
3. **Follow the guided process** to create your PRP

## Workflow Process

The \`enforce-prp-workflow.sh\` script will:
1. Read your project context from INITIAL.md
2. Update the base template for your project type
3. Generate a customized PRP
4. Set up Cursor rules and project structure

## Customization

- Edit \`templates/prp-base.md\` to customize the base template
- Modify \`workflows/\` scripts to adjust the workflow
- Update \`cursor-rules/\` for your IDE preferences

## Support

For issues or questions, refer to the main repository documentation.
EOF

    echo -e "${BLUE}Created:${NC} INTEGRATION_GUIDE.md"
}

# Main execution
if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

integrate_project "$@"
