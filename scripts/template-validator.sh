#!/bin/bash

# Template Validator Script
# Validates PRP template structure and content

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TEMPLATE_DIR="templates"
BASE_TEMPLATE="templates/prp-base.md"
LANGUAGE_HINTS_DIR="templates/language-hints"
VERSIONED_DIR="templates/versioned-templates"

# Validation results
declare -a errors=()
declare -a warnings=()
declare -a info=()

# Function to add validation message
add_message() {
    local type="$1"
    local message="$2"
    
    case $type in
        "error")
            errors+=("$message")
            ;;
        "warning")
            warnings+=("$message")
            ;;
        "info")
            info+=("$message")
            ;;
    esac
}

# Function to display usage
show_usage() {
    echo "Template Validator for PRP System"
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --template PATH        Validate specific template file"
    echo "  --all                  Validate all templates"
    echo "  --strict               Treat warnings as errors"
    echo "  --output FORMAT        Output format: text, json, xml"
    echo "  --help                 Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --all"
    echo "  $0 --template ./my-template.md"
    echo "  $0 --strict --output json"
}

# Function to validate markdown structure
validate_markdown_structure() {
    local file_path="$1"
    local file_name=$(basename "$file_path")
    
    echo -e "${BLUE}Validating markdown structure: $file_name${NC}"
    
    # Check if file exists
    if [ ! -f "$file_path" ]; then
        add_message "error" "File not found: $file_path"
        return 1
    fi
    
    # Check file size
    local file_size=$(wc -c < "$file_path")
    if [ $file_size -eq 0 ]; then
        add_message "error" "File is empty: $file_path"
        return 1
    fi
    
    # Check for required sections (for base template)
    if [[ "$file_name" == "prp-base.md" ]]; then
        local required_sections=(
            "## Goal"
            "## User Persona"
            "## Why"
            "## What"
            "## Context"
            "## Implementation Blueprint"
            "## Validation Loop"
            "## Final Validation Checklist"
            "## Anti-Patterns"
        )
        
        local content=$(cat "$file_path")
        for section in "${required_sections[@]}"; do
            if ! echo "$content" | grep -q "^$section"; then
                add_message "error" "Missing required section: $section in $file_name"
            fi
        done
    fi
    
    # Check for basic markdown syntax
    local content=$(cat "$file_path")
    
    # Check for proper heading hierarchy
    local heading_levels=$(echo "$content" | grep -E "^#{1,6}\s" | sed 's/^#\{1,6\}\s.*//' | tr -d '\n')
    if [[ "$heading_levels" =~ ^#+$ ]]; then
        # Check for skipped levels (e.g., # followed by ###)
        local prev_level=0
        while IFS= read -r line; do
            if [[ "$line" =~ ^#+ ]]; then
                local current_level=${#BASH_REMATCH[0]}
                if [ $current_level -gt $((prev_level + 1)) ] && [ $prev_level -gt 0 ]; then
                    add_message "warning" "Skipped heading level in $file_name: $line"
                fi
                prev_level=$current_level
            fi
        done < "$file_path"
    fi
    
    # Check for broken links
    local links=$(echo "$content" | grep -o '\[[^]]*\]([^)]*)' || true)
    if [ -n "$links" ]; then
        while IFS= read -r link; do
            if [[ "$link" =~ \[([^\]]*)\]\(([^)]*)\) ]]; then
                local link_text="${BASH_REMATCH[1]}"
                local link_url="${BASH_REMATCH[2]}"
                
                # Check for empty links
                if [ -z "$link_text" ]; then
                    add_message "warning" "Empty link text in $file_name: $link"
                fi
                
                # Check for empty URLs
                if [ -z "$link_url" ]; then
                    add_message "warning" "Empty link URL in $file_name: $link"
                fi
            fi
        done <<< "$links"
    fi
    
    # Check for code blocks
    local code_blocks=$(echo "$content" | grep -c '```' || echo "0")
    if [ $((code_blocks % 2)) -ne 0 ]; then
        add_message "warning" "Unmatched code block markers in $file_name"
    fi
    
    add_message "info" "Markdown structure validation completed for $file_name"
}

# Function to validate template content
validate_template_content() {
    local file_path="$1"
    local file_name=$(basename "$file_path")
    
    echo -e "${BLUE}Validating template content: $file_name${NC}"
    
    local content=$(cat "$file_path")
    
    # Check for placeholder text that should be replaced
    local placeholders=$(echo "$content" | grep -E "TODO|FIXME|PLACEHOLDER|TBD" || true)
    if [ -n "$placeholders" ]; then
        while IFS= read -r placeholder; do
            add_message "warning" "Placeholder text found in $file_name: $placeholder"
        done <<< "$placeholders"
    fi
    
    # Check for language-specific content in base template
    if [[ "$file_name" == "prp-base.md" ]]; then
        local language_specific=(
            "Python"
            "pip install"
            "requirements.txt"
            "\.py"
        )
        
        for pattern in "${language_specific[@]}"; do
            if echo "$content" | grep -q "$pattern"; then
                add_message "info" "Language-specific content found in base template: $pattern"
            fi
        done
    fi
    
    # Check for consistent formatting
    local lines=$(echo "$content" | wc -l)
    local empty_lines=$(echo "$content" | grep -c "^$" || echo "0")
    local empty_percentage=$((empty_lines * 100 / lines))
    
    if [ $empty_percentage -gt 30 ]; then
        add_message "warning" "High percentage of empty lines in $file_name: ${empty_percentage}%"
    fi
    
    # Check for consistent indentation
    local mixed_indentation=$(echo "$content" | grep -E "^[ ]*\t" || true)
    if [ -n "$mixed_indentation" ]; then
        add_message "warning" "Mixed indentation (spaces and tabs) found in $file_name"
    fi
    
    add_message "info" "Content validation completed for $file_name"
}

# Function to validate language hints
validate_language_hints() {
    echo -e "${BLUE}Validating language hints...${NC}"
    
    if [ ! -d "$LANGUAGE_HINTS_DIR" ]; then
        add_message "error" "Language hints directory not found: $LANGUAGE_HINTS_DIR"
        return
    fi
    
    local hint_files=$(find "$LANGUAGE_HINTS_DIR" -name "*.md" -type f)
    
    if [ -z "$hint_files" ]; then
        add_message "warning" "No language hint files found in $LANGUAGE_HINTS_DIR"
        return
    fi
    
    while IFS= read -r hint_file; do
        local hint_name=$(basename "$hint_file" .md)
        echo -e "${BLUE}  Validating language hint: $hint_name${NC}"
        
        # Check if hint file has content
        local content=$(cat "$hint_file")
        if [ -z "$content" ]; then
            add_message "warning" "Empty language hint file: $hint_name"
            continue
        fi
        
        # Check for language-specific patterns
        local patterns=$(echo "$content" | grep -E "language|framework|tool|library" || true)
        if [ -z "$patterns" ]; then
            add_message "warning" "Language hint file may lack specific patterns: $hint_name"
        fi
        
        add_message "info" "Language hint validation completed for $hint_name"
    done <<< "$hint_files"
}

# Function to validate versioned templates
validate_versioned_templates() {
    echo -e "${BLUE}Validating versioned templates...${NC}"
    
    if [ ! -d "$VERSIONED_DIR" ]; then
        add_message "info" "Versioned templates directory not found: $VERSIONED_DIR"
        return
    fi
    
    local version_files=$(find "$VERSIONED_DIR" -name "prp-base-v*.md" -type f)
    
    if [ -z "$version_files" ]; then
        add_message "info" "No versioned templates found"
        return
    fi
    
    while IFS= read -r version_file; do
        local version_name=$(basename "$version_file" .md)
        echo -e "${BLUE}  Validating versioned template: $version_name${NC}"
        
        # Check version header
        local content=$(cat "$version_file")
        if ! echo "$content" | grep -q "^# PRP Base Template - Version"; then
            add_message "warning" "Missing version header in $version_name"
        fi
        
        # Check creation timestamp
        if ! echo "$content" | grep -q "^\*\*Created:\*\*"; then
            add_message "warning" "Missing creation timestamp in $version_name"
        fi
        
        # Check change message
        if ! echo "$content" | grep -q "^\*\*Message:\*\*"; then
            add_message "warning" "Missing change message in $version_name"
        fi
        
        add_message "info" "Versioned template validation completed for $version_name"
    done <<< "$version_files"
}

# Function to validate workflow scripts
validate_workflow_scripts() {
    echo -e "${BLUE}Validating workflow scripts...${NC}"
    
    local workflow_dir="workflows"
    if [ ! -d "$workflow_dir" ]; then
        add_message "error" "Workflows directory not found: $workflow_dir"
        return
    fi
    
    local workflow_scripts=$(find "$workflow_dir" -name "*.sh" -type f)
    
    if [ -z "$workflow_scripts" ]; then
        add_message "warning" "No workflow scripts found in $workflow_dir"
        return
    fi
    
    while IFS= read -r script; do
        local script_name=$(basename "$script")
        echo -e "${BLUE}  Validating workflow script: $script_name${NC}"
        
        # Check if script is executable
        if [ ! -x "$script" ]; then
            add_message "warning" "Workflow script is not executable: $script_name"
        fi
        
        # Check for shebang
        local first_line=$(head -n 1 "$script")
        if [[ "$first_line" != "#!/bin/bash"* ]]; then
            add_message "warning" "Missing or incorrect shebang in $script_name"
        fi
        
        # Check for basic script structure
        local content=$(cat "$script")
        if ! echo "$content" | grep -q "set -e"; then
            add_message "warning" "Missing 'set -e' in $script_name"
        fi
        
        add_message "info" "Workflow script validation completed for $script_name"
    done <<< "$workflow_scripts"
}

# Function to output validation results
output_results() {
    local format="${1:-text}"
    local strict="${2:-false}"
    
    case $format in
        "text")
            echo ""
            echo "=== Validation Results ==="
            echo ""
            
            if [ ${#errors[@]} -gt 0 ]; then
                echo -e "${RED}Errors (${#errors[@]}):${NC}"
                for error in "${errors[@]}"; do
                    echo "  ❌ $error"
                done
                echo ""
            fi
            
            if [ ${#warnings[@]} -gt 0 ]; then
                echo -e "${YELLOW}Warnings (${#warnings[@]}):${NC}"
                for warning in "${warnings[@]}"; do
                    echo "  ⚠️  $warning"
                done
                echo ""
            fi
            
            if [ ${#info[@]} -gt 0 ]; then
                echo -e "${BLUE}Info (${#info[@]}):${NC}"
                for info_msg in "${info[@]}"; do
                    echo "  ℹ️  $info_msg"
                done
                echo ""
            fi
            
            # Summary
            echo "=== Summary ==="
            echo "Errors: ${#errors[@]}"
            echo "Warnings: ${#warnings[@]}"
            echo "Info: ${#info[@]}"
            
            if [ ${#errors[@]} -gt 0 ]; then
                echo -e "${RED}Validation FAILED${NC}"
                exit 1
            elif [ "$strict" = "true" ] && [ ${#warnings[@]} -gt 0 ]; then
                echo -e "${YELLOW}Validation FAILED (strict mode)${NC}"
                exit 1
            else
                echo -e "${GREEN}Validation PASSED${NC}"
            fi
            ;;
            
        "json")
            echo "{"
            echo "  \"validation\": {"
            echo "    \"errors\": ["
            for i in "${!errors[@]}"; do
                echo "      \"${errors[$i]}\"$([ $i -lt $((${#errors[@]} - 1)) ] && echo "," || echo "")"
            done
            echo "    ],"
            echo "    \"warnings\": ["
            for i in "${!warnings[@]}"; do
                echo "      \"${warnings[$i]}\"$([ $i -lt $((${#warnings[@]} - 1)) ] && echo "," || echo "")"
            done
            echo "    ],"
            echo "    \"info\": ["
            for i in "${!info[@]}"; do
                echo "      \"${info_msg[$i]}\"$([ $i -lt $((${#info[@]} - 1)) ] && echo "," || echo "")"
            done
            echo "    ]"
            echo "  }"
            echo "}"
            ;;
            
        "xml")
            echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
            echo "<validation>"
            echo "  <errors>"
            for error in "${errors[@]}"; do
                echo "    <error>$error</error>"
            done
            echo "  </errors>"
            echo "  <warnings>"
            for warning in "${warnings[@]}"; do
                echo "    <warning>$warning</warning>"
            done
            echo "  </warnings>"
            echo "  <info>"
            for info_msg in "${info[@]}"; do
                echo "    <info>$info_msg</info>"
            done
            echo "  </info>"
            echo "</validation>"
            ;;
    esac
}

# Function to run full validation
run_full_validation() {
    echo -e "${BLUE}Running full template validation...${NC}"
    echo ""
    
    # Validate base template
    if [ -f "$BASE_TEMPLATE" ]; then
        validate_markdown_structure "$BASE_TEMPLATE"
        validate_template_content "$BASE_TEMPLATE"
    else
        add_message "error" "Base template not found: $BASE_TEMPLATE"
    fi
    
    # Validate language hints
    validate_language_hints
    
    # Validate versioned templates
    validate_versioned_templates
    
    # Validate workflow scripts
    validate_workflow_scripts
    
    echo ""
    echo -e "${BLUE}Full validation completed${NC}"
}

# Function to validate specific template
validate_specific_template() {
    local template_path="$1"
    
    echo -e "${BLUE}Validating specific template: $template_path${NC}"
    echo ""
    
    validate_markdown_structure "$template_path"
    validate_template_content "$template_path"
    
    echo ""
    echo -e "${BLUE}Specific template validation completed${NC}"
}

# Main script logic
main() {
    local template_path=""
    local validate_all=false
    local strict_mode=false
    local output_format="text"
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --template)
                template_path="$2"
                shift 2
                ;;
            --all)
                validate_all=true
                shift
                ;;
            --strict)
                strict_mode=true
                shift
                ;;
            --output)
                output_format="$2"
                shift 2
                ;;
            --help)
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
    
    # Default to all if no specific options
    if [ -z "$template_path" ] && [ "$validate_all" = false ]; then
        validate_all=true
    fi
    
    # Run validation
    if [ "$validate_all" = true ]; then
        run_full_validation
    elif [ -n "$template_path" ]; then
        validate_specific_template "$template_path"
    fi
    
    # Output results
    output_results "$output_format" "$strict_mode"
}

# Run main function
main "$@"