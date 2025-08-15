#!/bin/bash

# Template Sync Script
# Synchronizes templates between local projects and the template repository

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TEMPLATE_REPO="archon-ce-template"
TEMPLATE_REPO_URL="https://github.com/9Mirrors-Lab/archon-ce-template.git"
LOCAL_TEMPLATE_DIR="$HOME/.archon-templates"
PROJECT_ROOT=""

# Function to display usage
show_usage() {
    echo "Template Sync Script for PRP System"
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  init                    Initialize local template directory"
    echo "  sync                    Sync templates from remote repository"
    echo "  push-changes           Push local template changes to remote"
    echo "  install-project        Install templates to a project directory"
    echo "  update-project         Update project with latest templates"
    echo "  status                 Show sync status"
    echo ""
    echo "Examples:"
    echo "  $0 init"
    echo "  $0 sync"
    echo "  $0 install-project --path ./my-project"
    echo "  $0 update-project --path ./my-project"
}

# Function to check if git is available
check_git() {
    if ! command -v git >/dev/null 2>&1; then
        echo -e "${RED}Error: Git is required but not installed${NC}"
        exit 1
    fi
}

# Function to initialize local template directory
init_templates() {
    echo -e "${BLUE}Initializing local template directory...${NC}"
    
    if [ -d "$LOCAL_TEMPLATE_DIR" ]; then
        echo -e "${YELLOW}Local template directory already exists${NC}"
        echo -e "${BLUE}Location:${NC} $LOCAL_TEMPLATE_DIR"
        
        # Check if it's a git repository
        if [ -d "$LOCAL_TEMPLATE_DIR/.git" ]; then
            echo -e "${GREEN}Git repository detected${NC}"
            cd "$LOCAL_TEMPLATE_DIR"
            
            # Check remote
            local remote_url=$(git remote get-url origin 2>/dev/null || echo "")
            if [ "$remote_url" = "$TEMPLATE_REPO_URL" ]; then
                echo -e "${GREEN}Remote repository is correct${NC}"
            else
                echo -e "${YELLOW}Remote repository mismatch. Updating...${NC}"
                git remote set-url origin "$TEMPLATE_REPO_URL"
            fi
            
            # Pull latest changes
            echo -e "${BLUE}Pulling latest changes...${NC}"
            git pull origin main
        else
            echo -e "${YELLOW}Not a git repository. Reinitializing...${NC}"
            rm -rf "$LOCAL_TEMPLATE_DIR"
            git clone "$TEMPLATE_REPO_URL" "$LOCAL_TEMPLATE_DIR"
        fi
    else
        echo -e "${BLUE}Cloning template repository...${NC}"
        git clone "$TEMPLATE_REPO_URL" "$LOCAL_TEMPLATE_DIR"
    fi
    
    echo -e "${GREEN}Local template directory initialized successfully${NC}"
    echo -e "${BLUE}Location:${NC} $LOCAL_TEMPLATE_DIR"
}

# Function to sync templates from remote
sync_templates() {
    echo -e "${BLUE}Syncing templates from remote repository...${NC}"
    
    if [ ! -d "$LOCAL_TEMPLATE_DIR" ]; then
        echo -e "${RED}Error: Local template directory not initialized${NC}"
        echo -e "${YELLOW}Run '$0 init' first${NC}"
        exit 1
    fi
    
    cd "$LOCAL_TEMPLATE_DIR"
    
    # Check if there are local changes
    if ! git diff-index --quiet HEAD --; then
        echo -e "${YELLOW}Warning: Local changes detected${NC}"
        echo -e "${BLUE}Stashing local changes...${NC}"
        git stash
        local stashed=true
    else
        local stashed=false
    fi
    
    # Fetch and pull latest changes
    echo -e "${BLUE}Fetching latest changes...${NC}"
    git fetch origin
    
    echo -e "${BLUE}Pulling latest changes...${NC}"
    git pull origin main
    
    # Restore stashed changes if any
    if [ "$stashed" = true ]; then
        echo -e "${BLUE}Restoring local changes...${NC}"
        git stash pop
    fi
    
    echo -e "${GREEN}Templates synced successfully${NC}"
    
    # Show latest commit info
    local latest_commit=$(git log -1 --oneline)
    echo -e "${BLUE}Latest commit:${NC} $latest_commit"
}

# Function to push local changes to remote
push_changes() {
    echo -e "${BLUE}Pushing local template changes to remote...${NC}"
    
    if [ ! -d "$LOCAL_TEMPLATE_DIR" ]; then
        echo -e "${RED}Error: Local template directory not initialized${NC}"
        echo -e "${YELLOW}Run '$0 init' first${NC}"
        exit 1
    fi
    
    cd "$LOCAL_TEMPLATE_DIR"
    
    # Check if there are changes to commit
    if git diff-index --quiet HEAD --; then
        echo -e "${YELLOW}No changes to commit${NC}"
        return
    fi
    
    # Show status
    echo -e "${BLUE}Changes to commit:${NC}"
    git status --short
    
    # Prompt for commit message
    echo ""
    read -p "Enter commit message: " commit_message
    
    if [ -z "$commit_message" ]; then
        echo -e "${RED}Error: Commit message is required${NC}"
        exit 1
    fi
    
    # Add and commit changes
    echo -e "${BLUE}Adding changes...${NC}"
    git add .
    
    echo -e "${BLUE}Committing changes...${NC}"
    git commit -m "$commit_message"
    
    # Push to remote
    echo -e "${BLUE}Pushing to remote...${NC}"
    git push origin main
    
    echo -e "${GREEN}Changes pushed successfully${NC}"
}

# Function to install templates to a project
install_project() {
    local project_path=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --path)
                project_path="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$project_path" ]; then
        echo -e "${RED}Error: --path is required${NC}"
        exit 1
    fi
    
    if [ ! -d "$project_path" ]; then
        echo -e "${RED}Error: Project directory does not exist: $project_path${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Installing templates to project: $project_path${NC}"
    
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
        local source="$LOCAL_TEMPLATE_DIR/$file_or_dir"
        local dest="$project_path/$(basename "$file_or_dir")"
        
        if [ -e "$source" ]; then
            echo -e "${BLUE}Copying:${NC} $file_or_dir"
            if [ -d "$source" ]; then
                cp -r "$source" "$dest"
            else
                cp "$source" "$dest"
            fi
        else
            echo -e "${YELLOW}Warning:${NC} $file_or_dir not found in templates"
        fi
    done
    
    # Copy main scripts
    local main_scripts=(
        "generate-project.sh"
        "enforce-prp-workflow.sh"
    )
    
    for script in "${main_scripts[@]}"; do
        local source="$LOCAL_TEMPLATE_DIR/$script"
        local dest="$project_path/$script"
        
        if [ -f "$source" ]; then
            echo -e "${BLUE}Copying:${NC} $script"
            cp "$source" "$dest"
            chmod +x "$dest"
        fi
    done
    
    echo -e "${GREEN}Templates installed successfully to: $project_path${NC}"
}

# Function to update project with latest templates
update_project() {
    local project_path=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --path)
                project_path="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$project_path" ]; then
        echo -e "${RED}Error: --path is required${NC}"
        exit 1
    fi
    
    if [ ! -d "$project_path" ]; then
        echo -e "${RED}Error: Project directory does not exist: $project_path${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Updating project with latest templates: $project_path${NC}"
    
    # First sync templates
    sync_templates
    
    # Then install to project
    install_project --path "$project_path"
    
    echo -e "${GREEN}Project updated successfully${NC}"
}

# Function to show sync status
show_status() {
    echo -e "${BLUE}Template Sync Status${NC}"
    echo "========================"
    echo ""
    
    if [ ! -d "$LOCAL_TEMPLATE_DIR" ]; then
        echo -e "${RED}Local template directory:${NC} Not initialized"
        echo -e "${YELLOW}Run '$0 init' to get started${NC}"
        return
    fi
    
    echo -e "${GREEN}Local template directory:${NC} $LOCAL_TEMPLATE_DIR"
    
    cd "$LOCAL_TEMPLATE_DIR"
    
    # Check git status
    if [ -d ".git" ]; then
        echo -e "${GREEN}Git repository:${NC} Yes"
        
        # Check remote
        local remote_url=$(git remote get-url origin 2>/dev/null || echo "")
        if [ "$remote_url" = "$TEMPLATE_REPO_URL" ]; then
            echo -e "${GREEN}Remote repository:${NC} Correct"
        else
            echo -e "${RED}Remote repository:${NC} Mismatch ($remote_url)"
        fi
        
        # Check if up to date
        git fetch origin >/dev/null 2>&1
        local local_commit=$(git rev-parse HEAD)
        local remote_commit=$(git rev-parse origin/main)
        
        if [ "$local_commit" = "$remote_commit" ]; then
            echo -e "${GREEN}Status:${NC} Up to date"
        else
            echo -e "${YELLOW}Status:${NC} Behind remote (run '$0 sync' to update)"
        fi
        
        # Show latest commit
        local latest_commit=$(git log -1 --oneline)
        echo -e "${BLUE}Latest commit:${NC} $latest_commit"
        
        # Check for local changes
        if ! git diff-index --quiet HEAD --; then
            echo -e "${YELLOW}Local changes:${NC} Yes (run '$0 push-changes' to sync)"
        else
            echo -e "${GREEN}Local changes:${NC} None"
        fi
    else
        echo -e "${RED}Git repository:${NC} No (corrupted state)"
    fi
    
    echo ""
    echo -e "${BLUE}Available templates:${NC}"
    if [ -d "templates" ]; then
        local template_count=$(find templates -name "*.md" | wc -l)
        echo "  - $template_count template files"
        
        if [ -d "templates/versioned-templates" ]; then
            local version_count=$(find templates/versioned-templates -name "*.md" | wc -l)
            echo "  - $version_count versioned templates"
        fi
        
        if [ -d "templates/language-hints" ]; then
            local lang_count=$(find templates/language-hints -name "*.md" | wc -l)
            echo "  - $lang_count language hints"
        fi
    fi
}

# Main script logic
main() {
    check_git
    
    if [ $# -eq 0 ]; then
        show_usage
        exit 1
    fi
    
    case $1 in
        "init")
            init_templates
            ;;
        "sync")
            sync_templates
            ;;
        "push-changes")
            push_changes
            ;;
        "install-project")
            shift
            install_project "$@"
            ;;
        "update-project")
            shift
            update_project "$@"
            ;;
        "status")
            show_status
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