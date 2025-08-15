#!/bin/bash

# Template Manager Script
# Manages PRP template versions and language-specific customizations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TEMPLATE_DIR="templates"
VERSIONED_DIR="templates/versioned-templates"
LANGUAGE_HINTS_DIR="templates/language-hints"
BASE_TEMPLATE="templates/prp-base.md"

# Ensure directories exist
mkdir -p "$VERSIONED_DIR"
mkdir -p "$LANGUAGE_HINTS_DIR"

# Function to display usage
show_usage() {
    echo "Template Manager for PRP System"
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  list                    List all available templates"
    echo "  create-version          Create new version of base template"
    echo "  update-language         Update template for specific language"
    echo "  restore-version         Restore specific version"
    echo "  compare-versions        Compare two template versions"
    echo "  cleanup-old             Clean up old template versions"
    echo ""
    echo "Examples:"
    echo "  $0 list"
    echo "  $0 create-version --message \"Updated for Next.js projects\""
    echo "  $0 update-language --lang nextjs --project-path ./my-project"
    echo "  $0 restore-version --version 2"
}

# Function to list all templates
list_templates() {
    echo -e "${BLUE}Available Templates:${NC}"
    echo ""
    
    if [ -f "$BASE_TEMPLATE" ]; then
        echo -e "${GREEN}Base Template:${NC} $BASE_TEMPLATE"
    else
        echo -e "${RED}Base Template:${NC} Not found!"
    fi
    
    echo ""
    echo -e "${BLUE}Language-Specific Templates:${NC}"
    if [ -d "$LANGUAGE_HINTS_DIR" ]; then
        for lang_file in "$LANGUAGE_HINTS_DIR"/*.md; do
            if [ -f "$lang_file" ]; then
                lang_name=$(basename "$lang_file" .md)
                echo "  - $lang_name"
            fi
        done
    fi
    
    echo ""
    echo -e "${BLUE}Versioned Templates:${NC}"
    if [ -d "$VERSIONED_DIR" ]; then
        for version_file in "$VERSIONED_DIR"/prp-base-v*.md; do
            if [ -f "$version_file" ]; then
                version_num=$(basename "$version_file" .md | sed "s/prp-base-v//")
                echo "  - Version $version_num"
            fi
        done
    fi
}

# Function to create new version
create_version() {
    local message=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --message)
                message="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$message" ]; then
        echo -e "${RED}Error: --message is required${NC}"
        exit 1
    fi
    
    # Find next version number
    local next_version=1
    while [ -f "$VERSIONED_DIR/prp-base-v$next_version.md" ]; do
        ((next_version++))
    done
    
    # Create versioned copy
    local version_file="$VERSIONED_DIR/prp-base-v$next_version.md"
    cp "$BASE_TEMPLATE" "$version_file"
    
    # Add version header
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local header="# PRP Base Template - Version $next_version\n\n**Created:** $timestamp\n**Message:** $message\n\n---\n\n"
    
    # Prepend header to file
    echo -e "$header$(cat "$version_file")" > "$version_file"
    
    echo -e "${GREEN}Created version $next_version: $version_file${NC}"
    echo -e "${BLUE}Message:${NC} $message"
}

# Function to update template for specific language
update_language() {
    local lang=""
    local project_path=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --lang)
                lang="$2"
                shift 2
                ;;
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
    
    if [ -z "$lang" ]; then
        echo -e "${RED}Error: --lang is required${NC}"
        exit 1
    fi
    
    if [ -z "$project_path" ]; then
        echo -e "${RED}Error: --project-path is required${NC}"
        exit 1
    fi
    
    # Check if language hints exist
    local lang_file="$LANGUAGE_HINTS_DIR/$lang.md"
    if [ ! -f "$lang_file" ]; then
        echo -e "${RED}Error: Language hints not found for $lang${NC}"
        echo -e "${YELLOW}Available languages:${NC}"
        for available_lang in "$LANGUAGE_HINTS_DIR"/*.md; do
            if [ -f "$available_lang" ]; then
                echo "  - $(basename "$available_lang" .md)"
            fi
        done
        exit 1
    fi
    
    # Create project-specific template
    local project_template="$project_path/prp-template.md"
    
    # Copy base template
    cp "$BASE_TEMPLATE" "$project_template"
    
    # Apply language-specific updates
    echo -e "${BLUE}Applying language-specific updates for $lang...${NC}"
    
    # Read language hints
    local hints=$(cat "$lang_file")
    
    # Update template content based on language
    case $lang in
        "nextjs")
            # Replace Python-specific content with Next.js content
            sed -i.bak "s/Python/Next.js/g" "$project_template"
            sed -i.bak "s/python/Next.js/g" "$project_template"
            sed -i.bak "s/pip install/npm install/g" "$project_template"
            sed -i.bak "s/requirements.txt/package.json/g" "$project_template"
            sed -i.bak "s/\.py/\.tsx/g" "$project_template"
            rm -f "$project_template.bak"
            ;;
        "rust")
            # Replace Python-specific content with Rust content
            sed -i.bak "s/Python/Rust/g" "$project_template"
            sed -i.bak "s/python/rust/g" "$project_template"
            sed -i.bak "s/pip install/cargo add/g" "$project_template"
            sed -i.bak "s/requirements.txt/Cargo.toml/g" "$project_template"
            sed -i.bak "s/\.py/\.rs/g" "$project_template"
            rm -f "$project_template.bak"
            ;;
        "python")
            # Keep Python content as-is
            echo -e "${GREEN}Template already optimized for Python${NC}"
            ;;
        *)
            echo -e "${YELLOW}Warning: No specific optimizations for $lang${NC}"
            ;;
    esac
    
    echo -e "${GREEN}Created project-specific template: $project_template${NC}"
    echo -e "${BLUE}Language:${NC} $lang"
    echo -e "${BLUE}Applied hints from:${NC} $lang_file"
}

# Function to restore specific version
restore_version() {
    local version=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --version)
                version="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$version" ]; then
        echo -e "${RED}Error: --version is required${NC}"
        exit 1
    fi
    
    local version_file="$VERSIONED_DIR/prp-base-v$version.md"
    if [ ! -f "$version_file" ]; then
        echo -e "${RED}Error: Version $version not found${NC}"
        echo -e "${YELLOW}Available versions:${NC}"
        for available_version in "$VERSIONED_DIR"/prp-base-v*.md; do
            if [ -f "$available_version" ]; then
                ver_num=$(basename "$available_version" .md | sed "s/prp-base-v//")
                echo "  - $ver_num"
            fi
        done
        exit 1
    fi
    
    # Create backup of current base template
    local backup_file="$BASE_TEMPLATE.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$BASE_TEMPLATE" "$backup_file"
    echo -e "${YELLOW}Created backup: $backup_file${NC}"
    
    # Restore version
    cp "$version_file" "$BASE_TEMPLATE"
    echo -e "${GREEN}Restored version $version to base template${NC}"
}

# Function to compare versions
compare_versions() {
    local version1=""
    local version2=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --v1)
                version1="$2"
                shift 2
                ;;
            --v2)
                version2="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$version1" ] || [ -z "$version2" ]; then
        echo -e "${RED}Error: Both --v1 and --v2 are required${NC}"
        exit 1
    fi
    
    local file1="$VERSIONED_DIR/prp-base-v$version1.md"
    local file2="$VERSIONED_DIR/prp-base-v$version2.md"
    
    if [ ! -f "$file1" ]; then
        echo -e "${RED}Error: Version $version1 not found${NC}"
        exit 1
    fi
    
    if [ ! -f "$file2" ]; then
        echo -e "${RED}Error: Version $version2 not found${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Comparing versions $version1 and $version2...${NC}"
    echo ""
    
    # Use diff if available, otherwise show file sizes
    if command -v diff >/dev/null 2>&1; then
        diff -u "$file1" "$file2" || true
    else
        echo -e "${YELLOW}diff command not available. Showing file sizes:${NC}"
        echo "Version $version1: $(wc -c < "$file1") bytes"
        echo "Version $version2: $(wc -c < "$file2") bytes"
    fi
}

# Function to cleanup old versions
cleanup_old() {
    local keep_versions=5
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --keep)
                keep_versions="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    echo -e "${BLUE}Cleaning up old template versions...${NC}"
    echo -e "${YELLOW}Keeping the $keep_versions most recent versions${NC}"
    
    # Get list of version files sorted by version number
    local version_files=()
    for version_file in "$VERSIONED_DIR"/prp-base-v*.md; do
        if [ -f "$version_file" ]; then
            version_files+=("$version_file")
        fi
    done
    
    # Sort by version number
    IFS=$'\n' sorted_files=($(sort -V <<<"${version_files[*]}"))
    unset IFS
    
    local total_versions=${#sorted_files[@]}
    local to_delete=$((total_versions - keep_versions))
    
    if [ $to_delete -le 0 ]; then
        echo -e "${GREEN}No cleanup needed. Only $total_versions versions exist.${NC}"
        return
    fi
    
    echo -e "${YELLOW}Will delete $to_delete old versions${NC}"
    
    # Delete old versions
    for ((i=0; i<to_delete; i++)); do
        local file_to_delete="${sorted_files[$i]}"
        local version_num=$(basename "$file_to_delete" .md | sed "s/prp-base-v//")
        echo -e "${RED}Deleting version $version_num: $file_to_delete${NC}"
        rm "$file_to_delete"
    done
    
    echo -e "${GREEN}Cleanup completed. Kept $keep_versions most recent versions.${NC}"
}

# Main script logic
main() {
    if [ $# -eq 0 ]; then
        show_usage
        exit 1
    fi
    
    case $1 in
        "list")
            list_templates
            ;;
        "create-version")
            shift
            create_version "$@"
            ;;
        "update-language")
            shift
            update_language "$@"
            ;;
        "restore-version")
            shift
            restore_version "$@"
            ;;
        "compare-versions")
            shift
            compare_versions "$@"
            ;;
        "cleanup-old")
            shift
            cleanup_old "$@"
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