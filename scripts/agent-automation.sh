#!/bin/bash

# Agent Automation Script for PRP Template Management
# Automatically handles template versioning, updates, and repository sync
# Designed for AI agents to use without user intervention

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
BASE_TEMPLATE="templates/prp-base.md"
PROJECT_ROOT=""
AUTO_COMMIT_MESSAGE=""

# Function to display usage
show_usage() {
    echo -e "${CYAN}Agent Automation Script for PRP Template Management${NC}"
    echo "========================================================"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo -e "${BLUE}Commands:${NC}"
    echo "  auto-version            Automatically create version if changes detected"
    echo "  auto-update             Automatically update templates and sync to repo"
    echo "  auto-maintain           Full automated maintenance cycle"
    echo "  smart-sync              Intelligent sync with automatic conflict resolution"
    echo "  auto-commit             Automatic commit with intelligent message generation"
    echo ""
    echo -e "${BLUE}Options:${NC}"
    echo "  --project-path PATH     Project directory path"
    echo "  --commit-message MSG    Custom commit message"
    echo "  --force                 Force operations without confirmation"
    echo "  --verbose               Show detailed output"
    echo "  --dry-run               Show what would be done without doing it"
    echo ""
    echo -e "${BLUE}Examples:${NC}"
    echo "  $0 auto-version --project-path ./my-project"
    echo "  $0 auto-update --commit-message \"Enhanced enterprise patterns\""
    echo "  $0 auto-maintain --project-path ./my-project"
}

# Function to detect significant changes
detect_significant_changes() {
    local project_path="$1"
    local base_template="$2"
    
    echo -e "${BLUE}Detecting significant changes...${NC}"
    
    # Check if project has a modified PRD
    local project_prd="$project_path/PRP.md"
    if [ ! -f "$project_prd" ]; then
        echo -e "${YELLOW}No PRP.md found in project - no changes to detect${NC}"
        return 1
    fi
    
    # Compare project PRD with base template
    local diff_output=$(diff "$base_template" "$project_prd" 2>/dev/null || true)
    
    if [ -z "$diff_output" ]; then
        echo -e "${GREEN}No significant changes detected${NC}"
        return 1
    fi
    
    # Analyze change significance
    local change_lines=$(echo "$diff_output" | wc -l)
    local added_lines=$(echo "$diff_output" | grep -c "^>" || echo "0")
    local removed_lines=$(echo "$diff_output" | grep -c "^<" || echo "0")
    
    echo -e "${BLUE}Change analysis:${NC}"
    echo "  - Total changes: $change_lines lines"
    echo "  - Added: $added_lines lines"
    echo "  - Removed: $removed_lines lines"
    
    # Determine if changes are significant (configurable threshold)
    local significance_threshold=10
    if [ $change_lines -gt $significance_threshold ]; then
        echo -e "${GREEN}Significant changes detected - version update recommended${NC}"
        return 0
    else
        echo -e "${YELLOW}Minor changes detected - no version update needed${NC}"
        return 1
    fi
}

# Function to automatically create version
auto_create_version() {
    local project_path="$1"
    local custom_message="$2"
    
    echo -e "${BLUE}Automatically creating new template version...${NC}"
    
    # Generate intelligent commit message if not provided
    if [ -z "$custom_message" ]; then
        local project_name=$(basename "$project_path")
        local timestamp=$(date +"%Y-%m-%d")
        custom_message="Enhanced template for $project_name - $timestamp"
        
        # Try to extract key improvements from the PRD
        local prd_file="$project_path/PRP.md"
        if [ -f "$prd_file" ]; then
            # Look for key sections that might indicate improvements
            if grep -q "enterprise\|production\|advanced\|strict" "$prd_file"; then
                custom_message="Enhanced enterprise template for $project_name - $timestamp"
            elif grep -q "testing\|ci\|cd\|pipeline" "$prd_file"; then
                custom_message="Enhanced CI/CD template for $project_name - $timestamp"
            elif grep -q "security\|authentication\|authorization" "$prd_file"; then
                custom_message="Enhanced security template for $project_name - $timestamp"
            fi
        fi
    fi
    
    # Create version using template manager
    "$SCRIPT_DIR/template-manager.sh" create-version --message "$custom_message"
    
    echo -e "${GREEN}Version created automatically with message:${NC} $custom_message"
}

# Function to automatically update base template
auto_update_base_template() {
    local project_path="$1"
    
    echo -e "${BLUE}Automatically updating base template...${NC}"
    
    local project_prd="$project_path/PRP.md"
    if [ ! -f "$project_prd" ]; then
        echo -e "${RED}Error: No PRP.md found in project${NC}"
        return 1
    fi
    
    # Backup current base template
    local backup_file="$BASE_TEMPLATE.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$BASE_TEMPLATE" "$backup_file"
    echo -e "${BLUE}Created backup:${NC} $backup_file"
    
    # Update base template with project improvements
    cp "$project_prd" "$BASE_TEMPLATE"
    echo -e "${GREEN}Base template updated with project improvements${NC}"
    
    # Detect language and update accordingly
    local language=""
    if [ -f "$project_path/package.json" ]; then
        language="nextjs"
    elif [ -f "$project_path/Cargo.toml" ]; then
        language="rust"
    elif [ -f "$project_path/requirements.txt" ] || [ -f "$project_path/setup.py" ]; then
        language="python"
    fi
    
    if [ -n "$language" ]; then
        echo -e "${BLUE}Detected language:${NC} $language"
        echo -e "${BLUE}Updating language-specific optimizations...${NC}"
        "$SCRIPT_DIR/template-manager.sh" update-language --lang "$language" --project-path "$project_path"
    fi
}

# Function to automatically sync to repository
auto_sync_to_repository() {
    local commit_message="$1"
    
    echo -e "${BLUE}Automatically syncing to repository...${NC}"
    
    # Check if we're in a git repository
    if [ ! -d ".git" ]; then
        echo -e "${YELLOW}Not in a git repository - skipping sync${NC}"
        return 0
    fi
    
    # Check for changes
    if git diff-index --quiet HEAD --; then
        echo -e "${GREEN}No changes to commit${NC}"
        return 0
    fi
    
    # Generate commit message if not provided
    if [ -z "$commit_message" ]; then
        local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        commit_message="Auto-update templates - $timestamp"
        
        # Try to generate more descriptive message
        local staged_files=$(git diff --cached --name-only 2>/dev/null || echo "")
        if [ -n "$staged_files" ]; then
            if echo "$staged_files" | grep -q "prp-base.md"; then
                commit_message="Enhanced base PRP template with project improvements - $timestamp"
            elif echo "$staged_files" | grep -q "versioned-templates"; then
                commit_message="Added new template version - $timestamp"
            fi
        fi
    fi
    
    # Stage all changes
    echo -e "${BLUE}Staging changes...${NC}"
    git add .
    
    # Commit changes
    echo -e "${BLUE}Committing changes...${NC}"
    git commit -m "$commit_message"
    
    # Push to remote
    echo -e "${BLUE}Pushing to remote repository...${NC}"
    if git push origin main; then
        echo -e "${GREEN}Successfully synced to repository${NC}"
        echo -e "${BLUE}Commit message:${NC} $commit_message"
    else
        echo -e "${YELLOW}Push failed - changes are committed locally${NC}"
        echo -e "${BLUE}You can push manually with: git push origin main${NC}"
    fi
}

# Function to run full automated maintenance cycle
auto_maintain() {
    local project_path="$1"
    local force="$2"
    
    echo -e "${CYAN}Running full automated maintenance cycle...${NC}"
    echo ""
    
    # Step 1: Check for significant changes
    if detect_significant_changes "$project_path" "$BASE_TEMPLATE"; then
        echo -e "${GREEN}✓ Significant changes detected${NC}"
        
        # Step 2: Create new version
        auto_create_version "$project_path"
        
        # Step 3: Update base template
        auto_update_base_template "$project_path"
        
        # Step 4: Sync to repository
        auto_sync_to_repository
        
        echo -e "${GREEN}✓ Full maintenance cycle completed${NC}"
    else
        echo -e "${BLUE}✓ No significant changes - maintenance not needed${NC}"
    fi
    
    # Step 5: Run validation
    echo -e "${BLUE}Running template validation...${NC}"
    "$SCRIPT_DIR/template-validator.sh" --all
    
    echo -e "${GREEN}Automated maintenance cycle completed${NC}"
}

# Function to run intelligent sync
smart_sync() {
    local project_path="$1"
    
    echo -e "${CYAN}Running intelligent sync...${NC}"
    
    # Check local status
    local local_status=$(git status --porcelain 2>/dev/null | wc -l)
    local remote_status=""
    
    # Check remote status
    if git remote get-url origin >/dev/null 2>&1; then
        git fetch origin >/dev/null 2>&1
        local local_commit=$(git rev-parse HEAD)
        local remote_commit=$(git rev-parse origin/main 2>/dev/null || echo "")
        
        if [ "$local_commit" != "$remote_commit" ]; then
            remote_status="behind"
        else
            remote_status="up-to-date"
        fi
    else
        remote_status="no-remote"
    fi
    
    echo -e "${BLUE}Sync status:${NC}"
    echo "  - Local changes: $local_status"
    echo "  - Remote status: $remote_status"
    
    # Handle different scenarios
    if [ $local_status -gt 0 ] && [ "$remote_status" = "behind" ]; then
        echo -e "${YELLOW}Both local changes and remote updates detected${NC}"
        echo -e "${BLUE}Stashing local changes...${NC}"
        git stash
        
        echo -e "${BLUE}Pulling remote updates...${NC}"
        git pull origin main
        
        echo -e "${BLUE}Restoring local changes...${NC}"
        git stash pop
        
        # Check for conflicts
        if git diff --name-only --diff-filter=U | grep -q .; then
            echo -e "${RED}Merge conflicts detected - manual resolution required${NC}"
            return 1
        fi
        
        echo -e "${GREEN}Intelligent sync completed successfully${NC}"
        
    elif [ $local_status -gt 0 ]; then
        echo -e "${BLUE}Local changes detected - syncing to remote${NC}"
        auto_sync_to_repository
        
    elif [ "$remote_status" = "behind" ]; then
        echo -e "${BLUE}Remote updates detected - pulling changes${NC}"
        git pull origin main
        echo -e "${GREEN}Remote updates synced successfully${NC}"
        
    else
        echo -e "${GREEN}Everything is up to date${NC}"
    fi
}

# Function to auto-commit with intelligent message
auto_commit() {
    local custom_message="$1"
    
    echo -e "${BLUE}Running automatic commit...${NC}"
    
    # Check for changes
    if git diff-index --quiet HEAD --; then
        echo -e "${GREEN}No changes to commit${NC}"
        return 0
    fi
    
    # Generate intelligent commit message
    if [ -z "$custom_message" ]; then
        local staged_files=$(git diff --cached --name-only 2>/dev/null || echo "")
        local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        
        if echo "$staged_files" | grep -q "prp-base.md"; then
            custom_message="Enhanced base PRP template - $timestamp"
        elif echo "$staged_files" | grep -q "versioned-templates"; then
            custom_message="Added new template version - $timestamp"
        elif echo "$staged_files" | grep -q "language-hints"; then
            custom_message="Updated language-specific optimizations - $timestamp"
        else
            custom_message="Template system updates - $timestamp"
        fi
    fi
    
    # Stage and commit
    git add .
    git commit -m "$custom_message"
    
    echo -e "${GREEN}Automatic commit completed${NC}"
    echo -e "${BLUE}Message:${NC} $custom_message"
}

# Main script logic
main() {
    if [ $# -eq 0 ]; then
        show_usage
        exit 1
    fi
    
    case $1 in
        "auto-version")
            shift
            local project_path=""
            local custom_message=""
            
            while [[ $# -gt 0 ]]; do
                case $1 in
                    --project-path)
                        project_path="$2"
                        shift 2
                        ;;
                    --commit-message)
                        custom_message="$2"
                        shift 2
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
            
            if detect_significant_changes "$project_path" "$BASE_TEMPLATE"; then
                auto_create_version "$project_path" "$custom_message"
            fi
            ;;
            
        "auto-update")
            shift
            local project_path=""
            local commit_message=""
            
            while [[ $# -gt 0 ]]; do
                case $1 in
                    --project-path)
                        project_path="$2"
                        shift 2
                        ;;
                    --commit-message)
                        commit_message="$2"
                        shift 2
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
            
            auto_update_base_template "$project_path"
            auto_sync_to_repository "$commit_message"
            ;;
            
        "auto-maintain")
            shift
            local project_path=""
            local force=false
            
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
            
            auto_maintain "$project_path" "$force"
            ;;
            
        "smart-sync")
            shift
            local project_path=""
            
            while [[ $# -gt 0 ]]; do
                case $1 in
                    --project-path)
                        project_path="$2"
                        shift 2
                        ;;
                    *)
                        echo -e "${RED}Unknown option: $1${NC}"
                        exit 1
                        ;;
                esac
            done
            
            smart_sync "$project_path"
            ;;
            
        "auto-commit")
            shift
            local custom_message=""
            
            while [[ $# -gt 0 ]]; do
                case $1 in
                    --commit-message)
                        custom_message="$2"
                        shift 2
                        ;;
                    *)
                        echo -e "${RED}Unknown option: $1${NC}"
                        exit 1
                        ;;
                esac
            done
            
            auto_commit "$custom_message"
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