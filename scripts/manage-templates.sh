#!/bin/bash

# Comprehensive Template Management Script
# Orchestrates all template operations for the PRP system

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="templates"
BACKUP_DIR="backups"
BASE_TEMPLATE="templates/prp-base.md"

# Function to display usage
show_usage() {
    echo -e "${CYAN}Comprehensive Template Management for PRP System${NC}"
    echo "=================================================="
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo -e "${BLUE}Core Commands:${NC}"
    echo "  init                    Initialize template system"
    echo "  status                  Show system status"
    echo "  backup                  Create backup before changes"
    echo "  restore                 Restore from backup"
    echo ""
    echo -e "${BLUE}Template Management:${NC}"
    echo "  create-version          Create new template version"
    echo "  update-language         Update template for specific language"
    echo "  validate                Validate all templates"
    echo "  sync                    Sync with remote repository"
    echo ""
    echo -e "${BLUE}Project Operations:${NC}"
    echo "  new-project             Create new project with templates"
    echo "  integrate-project       Integrate templates into existing project"
    echo "  update-project          Update project with latest templates"
    echo ""
    echo -e "${BLUE}Maintenance:${NC}"
    echo "  cleanup                 Clean up old backups and versions"
    echo "  repair                  Repair corrupted templates"
    echo "  migrate                 Migrate to new template format"
    echo ""
    echo -e "${BLUE}Options:${NC}"
    echo "  --project-path PATH     Project directory path"
    echo "  --language LANG         Programming language (python, nextjs, rust)"
    echo "  --force                 Force operation without confirmation"
    echo "  --verbose               Show detailed output"
    echo "  --help                  Show this help message"
    echo ""
    echo -e "${BLUE}Examples:${NC}"
    echo "  $0 init"
    echo "  $0 new-project --project-path ./my-project --language nextjs"
    echo "  $0 create-version --message \"Updated for modern frameworks\""
    echo "  $0 integrate-project --project-path ./existing-project"
}

# Function to check dependencies
check_dependencies() {
    echo -e "${BLUE}Checking dependencies...${NC}"
    
    local missing_deps=()
    
    # Check for required commands
    local required_commands=("git" "tar" "sha256sum")
    for cmd in "${required_commands[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            missing_deps+=("$cmd")
        fi
    done
    
    # Check for required scripts
    local required_scripts=(
        "template-manager.sh"
        "template-sync.sh"
        "template-validator.sh"
        "template-backup.sh"
    )
    
    for script in "${required_scripts[@]}"; do
        if [ ! -f "$SCRIPT_DIR/$script" ]; then
            missing_deps+=("$script")
        fi
    done
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        echo -e "${RED}Missing dependencies:${NC}"
        for dep in "${missing_deps[@]}"; do
            echo "  - $dep"
        done
        echo ""
        echo -e "${YELLOW}Please ensure all required dependencies are available${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}All dependencies satisfied${NC}"
}

# Function to initialize template system
init_system() {
    echo -e "${BLUE}Initializing template system...${NC}"
    
    # Check dependencies
    check_dependencies
    
    # Create necessary directories
    local dirs=(
        "$TEMPLATE_DIR"
        "$TEMPLATE_DIR/versioned-templates"
        "$TEMPLATE_DIR/language-hints"
        "$BACKUP_DIR"
        "workflows"
        "commands"
        "cursor-rules"
    )
    
    for dir in "${dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            echo -e "${BLUE}  Creating directory:${NC} $dir"
            mkdir -p "$dir"
        fi
    done
    
    # Initialize git repository if not already done
    if [ ! -d ".git" ]; then
        echo -e "${BLUE}  Initializing git repository...${NC}"
        git init
        echo "*.tar.gz" >> .gitignore
        echo "backups/" >> .gitignore
        echo "*.backup.*" >> .gitignore
    fi
    
    # Make scripts executable
    chmod +x "$SCRIPT_DIR"/*.sh
    
    echo -e "${GREEN}Template system initialized successfully${NC}"
}

# Function to show system status
show_status() {
    echo -e "${BLUE}Template System Status${NC}"
    echo "========================"
    echo ""
    
    # Check system health
    local health_checks=(
        "Dependencies"
        "Directories"
        "Templates"
        "Scripts"
        "Git Status"
    )
    
    for check in "${health_checks[@]}"; do
        case $check in
            "Dependencies")
                echo -e "${BLUE}Dependencies:${NC}"
                if command -v git >/dev/null 2>&1; then
                    echo -e "  ${GREEN}✓ Git${NC}"
                else
                    echo -e "  ${RED}✗ Git${NC}"
                fi
                if command -v tar >/dev/null 2>&1; then
                    echo -e "  ${GREEN}✓ Tar${NC}"
                else
                    echo -e "  ${RED}✗ Tar${NC}"
                fi
                ;;
                
            "Directories")
                echo -e "${BLUE}Directories:${NC}"
                local dirs=("$TEMPLATE_DIR" "$BACKUP_DIR" "workflows" "commands" "cursor-rules")
                for dir in "${dirs[@]}"; do
                    if [ -d "$dir" ]; then
                        echo -e "  ${GREEN}✓${NC} $dir"
                    else
                        echo -e "  ${RED}✗${NC} $dir"
                    fi
                done
                ;;
                
            "Templates")
                echo -e "${BLUE}Templates:${NC}"
                if [ -f "$BASE_TEMPLATE" ]; then
                    local template_size=$(du -h "$BASE_TEMPLATE" | cut -f1)
                    echo -e "  ${GREEN}✓${NC} Base template ($template_size)"
                else
                    echo -e "  ${RED}✗${NC} Base template"
                fi
                
                if [ -d "$TEMPLATE_DIR/versioned-templates" ]; then
                    local version_count=$(find "$TEMPLATE_DIR/versioned-templates" -name "*.md" | wc -l)
                    echo -e "  ${GREEN}✓${NC} Versioned templates ($version_count)"
                fi
                
                if [ -d "$TEMPLATE_DIR/language-hints" ]; then
                    local lang_count=$(find "$TEMPLATE_DIR/language-hints" -name "*.md" | wc -l)
                    echo -e "  ${GREEN}✓${NC} Language hints ($lang_count)"
                fi
                ;;
                
            "Scripts")
                echo -e "${BLUE}Scripts:${NC}"
                local scripts=("template-manager.sh" "template-sync.sh" "template-validator.sh" "template-backup.sh")
                for script in "${scripts[@]}"; do
                    if [ -f "$SCRIPT_DIR/$script" ] && [ -x "$SCRIPT_DIR/$script" ]; then
                        echo -e "  ${GREEN}✓${NC} $script"
                    else
                        echo -e "  ${RED}✗${NC} $script"
                    fi
                done
                ;;
                
            "Git Status")
                echo -e "${BLUE}Git Status:${NC}"
                if [ -d ".git" ]; then
                    local branch=$(git branch --show-current 2>/dev/null || echo "unknown")
                    local status=$(git status --porcelain 2>/dev/null | wc -l)
                    echo -e "  ${GREEN}✓${NC} Repository (branch: $branch)"
                    if [ $status -eq 0 ]; then
                        echo -e "    ${GREEN}✓${NC} Clean working directory"
                    else
                        echo -e "    ${YELLOW}⚠${NC} $status uncommitted changes"
                    fi
                else
                    echo -e "  ${RED}✗${NC} Not a git repository"
                fi
                ;;
        esac
        echo ""
    done
}

# Function to create new project
create_new_project() {
    local project_path=""
    local language=""
    local force=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --project-path)
                project_path="$2"
                shift 2
                ;;
            --language)
                language="$2"
                shift 2
                ;;
            --force)
                force=true
                shift
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$project_path" ]; then
        echo -e "${RED}Error: --project-path is required${NC}"
        exit 1
    fi
    
    if [ -z "$language" ]; then
        echo -e "${RED}Error: --language is required${NC}"
        exit 1
    fi
    
    # Validate language
    local valid_languages=("python" "nextjs" "rust")
    if [[ ! " ${valid_languages[@]} " =~ " ${language} " ]]; then
        echo -e "${RED}Error: Invalid language. Must be one of: ${valid_languages[*]}${NC}"
        exit 1
    fi
    
    # Check if project directory exists
    if [ -d "$project_path" ] && [ "$force" != true ]; then
        echo -e "${RED}Error: Project directory already exists: $project_path${NC}"
        echo -e "${YELLOW}Use --force to overwrite${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Creating new project: $project_path${NC}"
    echo -e "${BLUE}Language:${NC} $language"
    
    # Create project directory
    mkdir -p "$project_path"
    
    # Copy templates and scripts
    echo -e "${BLUE}  Installing templates...${NC}"
    "$SCRIPT_DIR/template-sync.sh" install-project --path "$project_path"
    
    # Update template for specific language
    echo -e "${BLUE}  Customizing template for $language...${NC}"
    "$SCRIPT_DIR/template-manager.sh" update-language --lang "$language" --project-path "$project_path"
    
    # Create project structure
    echo -e "${BLUE}  Creating project structure...${NC}"
    case $language in
        "python")
            mkdir -p "$project_path/src" "$project_path/tests" "$project_path/docs"
            touch "$project_path/requirements.txt" "$project_path/README.md"
            ;;
        "nextjs")
            mkdir -p "$project_path/src" "$project_path/public" "$project_path/styles"
            touch "$project_path/package.json" "$project_path/README.md"
            ;;
        "rust")
            mkdir -p "$project_path/src" "$project_path/tests" "$project_path/docs"
            touch "$project_path/Cargo.toml" "$project_path/README.md"
            ;;
    esac
    
    # Create INITIAL.md for PRP process
    cat > "$project_path/INITIAL.md" << EOF
# Project Initialization

## Project Type
$language

## Project Name
$(basename "$project_path")

## Description
[Describe your project here]

## Key Features
- [Feature 1]
- [Feature 2]
- [Feature 3]

## Technology Stack
- [List your technologies]

## Goals
[What do you want to achieve?]

## Timeline
[Expected completion date]
EOF
    
    echo -e "${GREEN}New project created successfully: $project_path${NC}"
    echo -e "${BLUE}Next steps:${NC}"
    echo "  1. Edit INITIAL.md with your project details"
    echo "  2. Run: ./enforce-prp-workflow.sh"
    echo "  3. Follow the PRP generation process"
}

# Function to integrate templates into existing project
integrate_existing_project() {
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
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$project_path" ]; then
        echo -e "${RED}Error: --project-path is required${NC}"
        exit 1
    fi
    
    if [ ! -d "$project_path" ]; then
        echo -e "${RED}Error: Project directory does not exist: $project_path${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Integrating templates into existing project: $project_path${NC}"
    
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
        for file in "${conflicts[@]}"; do
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
    echo -e "${BLUE}  Installing templates...${NC}"
    "$SCRIPT_DIR/template-sync.sh" install-project --path "$project_path"
    
    # Analyze existing codebase
    echo -e "${BLUE}  Analyzing existing codebase...${NC}"
    local language=""
    
    # Detect language
    if [ -f "$project_path/package.json" ]; then
        language="nextjs"
    elif [ -f "$project_path/Cargo.toml" ]; then
        language="rust"
    elif [ -f "$project_path/requirements.txt" ] || [ -f "$project_path/setup.py" ] || [ -f "$project_path/pyproject.toml" ]; then
        language="python"
    else
        echo -e "${YELLOW}  Warning: Could not detect project language${NC}"
        language="unknown"
    fi
    
    if [ "$language" != "unknown" ]; then
        echo -e "${BLUE}  Detected language:${NC} $language"
        
        # Update template for detected language
        "$SCRIPT_DIR/template-manager.sh" update-language --lang "$language" --project-path "$project_path"
    fi
    
    # Create integration guide
    cat > "$project_path/INTEGRATION_GUIDE.md" << EOF
# PRP Integration Guide

This project has been integrated with the Archon PRP (Project Requirements Document) system.

## What was added:
- PRP template and workflow scripts
- Language-specific optimizations
- Cursor rules for AI assistance
- Project management tools

## Next steps:
1. Review and customize the PRP template
2. Create your project's PRP using the workflow
3. Use the generated PRP to guide development

## Available commands:
- \`./enforce-prp-workflow.sh\` - Generate PRP from INITIAL.md
- \`./template-manager.sh list\` - List available templates
- \`./template-validator.sh --all\` - Validate templates

## Support:
- See the docs/ directory for detailed documentation
- Check examples/ for usage examples
EOF
    
    echo -e "${GREEN}Integration completed successfully${NC}"
    echo -e "${BLUE}Integration guide created:${NC} $project_path/INTEGRATION_GUIDE.md"
}

# Function to run maintenance operations
run_maintenance() {
    local operation=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            cleanup|repair|migrate)
                operation="$1"
                shift
                ;;
            *)
                echo -e "${RED}Unknown operation: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    case $operation in
        "cleanup")
            echo -e "${BLUE}Running cleanup operations...${NC}"
            
            # Clean up old backups
            "$SCRIPT_DIR/template-backup.sh" cleanup-backups --keep-count 5
            
            # Clean up old template versions
            "$SCRIPT_DIR/template-manager.sh" cleanup-old --keep 3
            
            echo -e "${GREEN}Cleanup completed${NC}"
            ;;
            
        "repair")
            echo -e "${BLUE}Running repair operations...${NC}"
            
            # Validate all templates
            "$SCRIPT_DIR/template-validator.sh" --all
            
            # Check for corrupted files
            local corrupted_files=()
            
            # Check base template
            if [ -f "$BASE_TEMPLATE" ]; then
                if ! head -n 1 "$BASE_TEMPLATE" | grep -q "^#"; then
                    corrupted_files+=("$BASE_TEMPLATE")
                fi
            fi
            
            if [ ${#corrupted_files[@]} -gt 0 ]; then
                echo -e "${YELLOW}Found potentially corrupted files:${NC}"
                for file in "${corrupted_files[@]}"; do
                    echo "  - $file"
                done
                
                # Try to restore from latest backup
                echo -e "${BLUE}Attempting to restore from backup...${NC}"
                "$SCRIPT_DIR/template-backup.sh" list-backups
                echo ""
                echo -e "${YELLOW}Use 'restore' command to restore from backup${NC}"
            else
                echo -e "${GREEN}No corrupted files detected${NC}"
            fi
            
            echo -e "${GREEN}Repair operations completed${NC}"
            ;;
            
        "migrate")
            echo -e "${BLUE}Running migration operations...${NC}"
            
            # Create backup before migration
            "$SCRIPT_DIR/template-backup.sh" auto-backup
            
            # Check current template version
            if [ -f "$BASE_TEMPLATE" ]; then
                local current_version=$(grep -o "Version [0-9]*" "$BASE_TEMPLATE" | head -1 | grep -o "[0-9]*" || echo "1")
                echo -e "${BLUE}Current template version:${NC} $current_version"
                
                # Create new version for migration
                "$SCRIPT_DIR/template-manager.sh" create-version --message "Migration to new format"
                
                echo -e "${GREEN}Migration completed${NC}"
            else
                echo -e "${RED}Error: Base template not found${NC}"
                exit 1
            fi
            ;;
    esac
}

# Main script logic
main() {
    if [ $# -eq 0 ]; then
        show_usage
        exit 1
    fi
    
    case $1 in
        "init")
            init_system
            ;;
        "status")
            show_status
            ;;
        "backup")
            "$SCRIPT_DIR/template-backup.sh" auto-backup
            ;;
        "restore")
            shift
            "$SCRIPT_DIR/template-backup.sh" restore "$@"
            ;;
        "create-version")
            shift
            "$SCRIPT_DIR/template-manager.sh" create-version "$@"
            ;;
        "update-language")
            shift
            "$SCRIPT_DIR/template-manager.sh" update-language "$@"
            ;;
        "validate")
            "$SCRIPT_DIR/template-validator.sh" --all
            ;;
        "sync")
            "$SCRIPT_DIR/template-sync.sh" sync
            ;;
        "new-project")
            shift
            create_new_project "$@"
            ;;
        "integrate-project")
            shift
            integrate_existing_project "$@"
            ;;
        "update-project")
            shift
            "$SCRIPT_DIR/template-sync.sh" update-project "$@"
            ;;
        "cleanup"|"repair"|"migrate")
            run_maintenance "$@"
            ;;
        "--help"|"help")
            show_usage
            ;;
        *)
            echo -e "${RED}Unknown command: $1${NC}"
            show_usage
            exit 1
            ;;
    esac
}

# Run main function
main "$@"