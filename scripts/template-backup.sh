#!/bin/bash

# Template Backup and Restore Script
# Manages template backups and restoration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TEMPLATE_DIR="templates"
BACKUP_DIR="backups"
BASE_TEMPLATE="templates/prp-base.md"
LANGUAGE_HINTS_DIR="templates/language-hints"
VERSIONED_DIR="templates/versioned-templates"
WORKFLOW_DIR="workflows"
SCRIPTS_DIR="scripts"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Function to display usage
show_usage() {
    echo "Template Backup and Restore Script for PRP System"
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  backup                  Create backup of current templates"
    echo "  restore                 Restore templates from backup"
    echo "  list-backups            List all available backups"
    echo "  delete-backup           Delete specific backup"
    echo "  auto-backup             Create automatic backup before changes"
    echo "  cleanup-backups         Clean up old backups"
    echo "  verify-backup           Verify backup integrity"
    echo ""
    echo "Options:"
    echo "  --name NAME             Custom backup name"
    echo "  --description DESC      Backup description"
    echo "  --backup-id ID          Specific backup ID for restore/delete"
    echo "  --keep-count N          Number of backups to keep (default: 10)"
    echo "  --force                 Force operation without confirmation"
    echo ""
    echo "Examples:"
    echo "  $0 backup --name \"before-major-update\" --description \"Backup before updating to v2.0\""
    echo "  $0 restore --backup-id 20241215_143022"
    echo "  $0 list-backups"
    echo "  $0 cleanup-backups --keep-count 5"
}

# Function to generate backup ID
generate_backup_id() {
    date +"%Y%m%d_%H%M%S"
}

# Function to create backup
create_backup() {
    local backup_name=""
    local description=""
    local force=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --name)
                backup_name="$2"
                shift 2
                ;;
            --description)
                description="$2"
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
    
    # Generate backup ID
    local backup_id=$(generate_backup_id)
    local backup_path="$BACKUP_DIR/backup_$backup_id"
    
    # Create backup directory
    mkdir -p "$backup_path"
    
    echo -e "${BLUE}Creating backup: $backup_id${NC}"
    
    # Backup templates
    if [ -d "$TEMPLATE_DIR" ]; then
        echo -e "${BLUE}  Backing up templates...${NC}"
        cp -r "$TEMPLATE_DIR" "$backup_path/"
    fi
    
    # Backup workflows
    if [ -d "$WORKFLOW_DIR" ]; then
        echo -e "${BLUE}  Backing up workflows...${NC}"
        cp -r "$WORKFLOW_DIR" "$backup_path/"
    fi
    
    # Backup scripts
    if [ -d "$SCRIPTS_DIR" ]; then
        echo -e "${BLUE}  Backing up scripts...${NC}"
        cp -r "$SCRIPTS_DIR" "$backup_path/"
    fi
    
    # Create backup metadata
    local metadata_file="$backup_path/backup_metadata.json"
    cat > "$metadata_file" << EOF
{
    "backup_id": "$backup_id",
    "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
    "name": "$backup_name",
    "description": "$description",
    "files_backed_up": [
        "$TEMPLATE_DIR",
        "$WORKFLOW_DIR",
        "$SCRIPTS_DIR"
    ],
    "total_size": "$(du -sh "$backup_path" | cut -f1)",
    "checksum": "$(find "$backup_path" -type f -exec sha256sum {} \; | sort | sha256sum | cut -d' ' -f1)"
}
EOF
    
    # Create compressed backup
    local compressed_backup="$BACKUP_DIR/backup_$backup_id.tar.gz"
    cd "$BACKUP_DIR"
    tar -czf "backup_$backup_id.tar.gz" "backup_$backup_id"
    cd - > /dev/null
    
    # Remove uncompressed backup directory
    rm -rf "$backup_path"
    
    echo -e "${GREEN}Backup created successfully: $compressed_backup${NC}"
    echo -e "${BLUE}Backup ID:${NC} $backup_id"
    if [ -n "$backup_name" ]; then
        echo -e "${BLUE}Name:${NC} $backup_name"
    fi
    if [ -n "$description" ]; then
        echo -e "${BLUE}Description:${NC} $description"
    fi
}

# Function to list backups
list_backups() {
    echo -e "${BLUE}Available Backups:${NC}"
    echo ""
    
    local backup_files=$(find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f 2>/dev/null | sort -r)
    
    if [ -z "$backup_files" ]; then
        echo -e "${YELLOW}No backups found${NC}"
        return
    fi
    
    echo "ID                    | Size    | Date                | Name"
    echo "---------------------|---------|---------------------|------------------"
    
    while IFS= read -r backup_file; do
        local backup_id=$(basename "$backup_file" .tar.gz | sed 's/backup_//')
        local size=$(du -h "$backup_file" | cut -f1)
        local date=$(date -r "$backup_file" "+%Y-%m-%d %H:%M:%S")
        
        # Try to extract name from metadata if available
        local temp_dir=$(mktemp -d)
        local name=""
        
        if tar -tzf "$backup_file" | grep -q "backup_metadata.json"; then
            tar -xzf "$backup_file" -C "$temp_dir" "*/backup_metadata.json" 2>/dev/null || true
            local metadata_file=$(find "$temp_dir" -name "backup_metadata.json" | head -1)
            if [ -f "$metadata_file" ]; then
                name=$(grep -o '"name": "[^"]*"' "$metadata_file" | cut -d'"' -f4 || echo "")
            fi
        fi
        
        rm -rf "$temp_dir"
        
        printf "%-20s | %-7s | %-19s | %s\n" "$backup_id" "$size" "$date" "$name"
    done <<< "$backup_files"
}

# Function to restore backup
restore_backup() {
    local backup_id=""
    local force=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --backup-id)
                backup_id="$2"
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
    
    if [ -z "$backup_id" ]; then
        echo -e "${RED}Error: --backup-id is required${NC}"
        exit 1
    fi
    
    local backup_file="$BACKUP_DIR/backup_$backup_id.tar.gz"
    
    if [ ! -f "$backup_file" ]; then
        echo -e "${RED}Error: Backup not found: $backup_id${NC}"
        echo -e "${YELLOW}Available backups:${NC}"
        list_backups
        exit 1
    fi
    
    # Confirm restoration
    if [ "$force" != true ]; then
        echo -e "${YELLOW}Warning: This will overwrite current templates!${NC}"
        echo -e "${BLUE}Backup to restore:${NC} $backup_id"
        echo -e "${BLUE}Backup file:${NC} $backup_file"
        echo ""
        read -p "Are you sure you want to continue? (y/N): " confirm
        
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Restoration cancelled${NC}"
            exit 0
        fi
    fi
    
    echo -e "${BLUE}Restoring backup: $backup_id${NC}"
    
    # Create temporary directory for extraction
    local temp_dir=$(mktemp -d)
    
    # Extract backup
    echo -e "${BLUE}  Extracting backup...${NC}"
    tar -xzf "$backup_file" -C "$temp_dir"
    
    # Find extracted backup directory
    local extracted_dir=$(find "$temp_dir" -maxdepth 1 -type d -name "backup_*" | head -1)
    
    if [ -z "$extracted_dir" ]; then
        echo -e "${RED}Error: Invalid backup format${NC}"
        rm -rf "$temp_dir"
        exit 1
    fi
    
    # Create backup of current state before restoration
    local current_backup_id=$(generate_backup_id)
    local current_backup_path="$BACKUP_DIR/backup_$current_backup_id"
    mkdir -p "$current_backup_path"
    
    echo -e "${BLUE}  Creating backup of current state...${NC}"
    if [ -d "$TEMPLATE_DIR" ]; then
        cp -r "$TEMPLATE_DIR" "$current_backup_path/"
    fi
    if [ -d "$WORKFLOW_DIR" ]; then
        cp -r "$WORKFLOW_DIR" "$current_backup_path/"
    fi
    if [ -d "$SCRIPTS_DIR" ]; then
        cp -r "$SCRIPTS_DIR" "$current_backup_path/"
    fi
    
    # Compress current backup
    cd "$BACKUP_DIR"
    tar -czf "backup_$current_backup_id.tar.gz" "backup_$current_backup_id"
    cd - > /dev/null
    rm -rf "$current_backup_path"
    
    echo -e "${BLUE}  Current state backed up as: $current_backup_id${NC}"
    
    # Restore templates
    echo -e "${BLUE}  Restoring templates...${NC}"
    if [ -d "$extracted_dir/templates" ]; then
        rm -rf "$TEMPLATE_DIR"
        cp -r "$extracted_dir/templates" .
    fi
    
    # Restore workflows
    echo -e "${BLUE}  Restoring workflows...${NC}"
    if [ -d "$extracted_dir/workflows" ]; then
        rm -rf "$WORKFLOW_DIR"
        cp -r "$extracted_dir/workflows" .
    fi
    
    # Restore scripts
    echo -e "${BLUE}  Restoring scripts...${NC}"
    if [ -d "$extracted_dir/scripts" ]; then
        rm -rf "$SCRIPTS_DIR"
        cp -r "$extracted_dir/scripts" .
    fi
    
    # Clean up
    rm -rf "$temp_dir"
    
    echo -e "${GREEN}Backup restored successfully: $backup_id${NC}"
    echo -e "${BLUE}Previous state backed up as:${NC} $current_backup_id"
}

# Function to delete backup
delete_backup() {
    local backup_id=""
    local force=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --backup-id)
                backup_id="$2"
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
    
    if [ -z "$backup_id" ]; then
        echo -e "${RED}Error: --backup-id is required${NC}"
        exit 1
    fi
    
    local backup_file="$BACKUP_DIR/backup_$backup_id.tar.gz"
    
    if [ ! -f "$backup_file" ]; then
        echo -e "${RED}Error: Backup not found: $backup_id${NC}"
        exit 1
    fi
    
    # Confirm deletion
    if [ "$force" != true ]; then
        echo -e "${YELLOW}Warning: This will permanently delete the backup!${NC}"
        echo -e "${BLUE}Backup to delete:${NC} $backup_id"
        echo -e "${BLUE}Backup file:${NC} $backup_file"
        echo ""
        read -p "Are you sure you want to continue? (y/N): " confirm
        
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Deletion cancelled${NC}"
            exit 0
        fi
    fi
    
    echo -e "${BLUE}Deleting backup: $backup_id${NC}"
    rm "$backup_file"
    echo -e "${GREEN}Backup deleted successfully: $backup_id${NC}"
}

# Function to create automatic backup
auto_backup() {
    echo -e "${BLUE}Creating automatic backup...${NC}"
    
    local backup_id=$(generate_backup_id)
    local description="Automatic backup before changes"
    
    create_backup --name "auto_$backup_id" --description "$description" --force
    
    echo -e "${GREEN}Automatic backup created: $backup_id${NC}"
}

# Function to cleanup old backups
cleanup_backups() {
    local keep_count=10
    local force=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --keep-count)
                keep_count="$2"
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
    
    echo -e "${BLUE}Cleaning up old backups...${NC}"
    echo -e "${YELLOW}Keeping the $keep_count most recent backups${NC}"
    
    # Get list of backup files sorted by modification time (newest first)
    local backup_files=$(find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -printf "%T@ %p\n" | sort -nr | cut -d' ' -f2-)
    
    local total_backups=$(echo "$backup_files" | wc -l)
    local to_delete=$((total_backups - keep_count))
    
    if [ $to_delete -le 0 ]; then
        echo -e "${GREEN}No cleanup needed. Only $total_backups backups exist.${NC}"
        return
    fi
    
    echo -e "${YELLOW}Will delete $to_delete old backups${NC}"
    
    # Confirm cleanup
    if [ "$force" != true ]; then
        echo ""
        read -p "Are you sure you want to continue? (y/N): " confirm
        
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Cleanup cancelled${NC}"
            exit 0
        fi
    fi
    
    # Delete old backups
    local count=0
    while IFS= read -r backup_file && [ $count -lt $to_delete ]; do
        local backup_id=$(basename "$backup_file" .tar.gz | sed 's/backup_//')
        echo -e "${RED}Deleting backup: $backup_id${NC}"
        rm "$backup_file"
        ((count++))
    done <<< "$backup_files"
    
    echo -e "${GREEN}Cleanup completed. Kept $keep_count most recent backups.${NC}"
}

# Function to verify backup integrity
verify_backup() {
    local backup_id=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --backup-id)
                backup_id="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
        esac
    done
    
    if [ -z "$backup_id" ]; then
        echo -e "${RED}Error: --backup-id is required${NC}"
        exit 1
    fi
    
    local backup_file="$BACKUP_DIR/backup_$backup_id.tar.gz"
    
    if [ ! -f "$backup_file" ]; then
        echo -e "${RED}Error: Backup not found: $backup_id${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Verifying backup integrity: $backup_id${NC}"
    
    # Check if tar file is valid
    if ! tar -tzf "$backup_file" > /dev/null 2>&1; then
        echo -e "${RED}Error: Backup file is corrupted or invalid${NC}"
        exit 1
    fi
    
    # Extract metadata to verify structure
    local temp_dir=$(mktemp -d)
    local metadata_file=""
    
    if tar -tzf "$backup_file" | grep -q "backup_metadata.json"; then
        tar -xzf "$backup_file" -C "$temp_dir" "*/backup_metadata.json" 2>/dev/null || true
        metadata_file=$(find "$temp_dir" -name "backup_metadata.json" | head -1)
    fi
    
    if [ -f "$metadata_file" ]; then
        echo -e "${BLUE}  Backup metadata found${NC}"
        
        # Verify checksum
        local stored_checksum=$(grep -o '"checksum": "[^"]*"' "$metadata_file" | cut -d'"' -f4 || echo "")
        if [ -n "$stored_checksum" ]; then
            echo -e "${BLUE}  Stored checksum:${NC} $stored_checksum"
            
            # Calculate current checksum
            local current_checksum=$(tar -xzf "$backup_file" -O | sha256sum | cut -d' ' -f1)
            echo -e "${BLUE}  Current checksum:${NC} $current_checksum"
            
            if [ "$stored_checksum" = "$current_checksum" ]; then
                echo -e "${GREEN}  Checksum verification: PASSED${NC}"
            else
                echo -e "${RED}  Checksum verification: FAILED${NC}"
                rm -rf "$temp_dir"
                exit 1
            fi
        fi
        
        # Show backup info
        local name=$(grep -o '"name": "[^"]*"' "$metadata_file" | cut -d'"' -f4 || echo "")
        local desc=$(grep -o '"description": "[^"]*"' "$metadata_file" | cut -d'"' -f4 || echo "")
        local timestamp=$(grep -o '"timestamp": "[^"]*"' "$metadata_file" | cut -d'"' -f4 || echo "")
        
        echo -e "${BLUE}  Backup name:${NC} $name"
        echo -e "${BLUE}  Description:${NC} $desc"
        echo -e "${BLUE}  Created:${NC} $timestamp"
    else
        echo -e "${YELLOW}  Warning: No metadata found in backup${NC}"
    fi
    
    # Clean up
    rm -rf "$temp_dir"
    
    echo -e "${GREEN}Backup integrity verification completed${NC}"
}

# Main script logic
main() {
    if [ $# -eq 0 ]; then
        show_usage
        exit 1
    fi
    
    case $1 in
        "backup")
            shift
            create_backup "$@"
            ;;
        "restore")
            shift
            restore_backup "$@"
            ;;
        "list-backups")
            list_backups
            ;;
        "delete-backup")
            shift
            delete_backup "$@"
            ;;
        "auto-backup")
            auto_backup
            ;;
        "cleanup-backups")
            shift
            cleanup_backups "$@"
            ;;
        "verify-backup")
            shift
            verify_backup "$@"
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