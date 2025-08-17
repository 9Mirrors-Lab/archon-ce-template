#!/bin/bash

# Language Detection Script for Archon CE Template
# Automatically detects the primary programming language of a project

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔍 Archon Language Detection${NC}"
echo -e "${BLUE}==========================${NC}"

# Function to detect language from files
detect_language() {
    local project_path="$1"
    
    # Count file types
    local python_files=$(find "$project_path" -name "*.py" -type f 2>/dev/null | wc -l)
    local js_files=$(find "$project_path" -name "*.js" -type f 2>/dev/null | wc -l)
    local ts_files=$(find "$project_path" -name "*.ts" -type f 2>/dev/null | wc -l)
    local tsx_files=$(find "$project_path" -name "*.tsx" -type f 2>/dev/null | wc -l)
    local jsx_files=$(find "$project_path" -name "*.jsx" -type f 2>/dev/null | wc -l)
    local rs_files=$(find "$project_path" -name "*.rs" -type f 2>/dev/null | wc -l)
    local go_files=$(find "$project_path" -name "*.go" -type f 2>/dev/null | wc -l)
    local java_files=$(find "$project_path" -name "*.java" -type f 2>/dev/null | wc -l)
    
    # Check for package managers
    local has_package_json=$(find "$project_path" -name "package.json" -type f 2>/dev/null | wc -l)
    local has_requirements_txt=$(find "$project_path" -name "requirements.txt" -type f 2>/dev/null | wc -l)
    local has_cargo_toml=$(find "$project_path" -name "Cargo.toml" -type f 2>/dev/null | wc -l)
    local has_go_mod=$(find "$project_path" -name "go.mod" -type f 2>/dev/null | wc -l)
    local has_pom_xml=$(find "$project_path" -name "pom.xml" -type f 2>/dev/null | wc -l)
    
    echo -e "   📊 File Analysis:"
    echo -e "      Python (.py): ${GREEN}$python_files${NC}"
    echo -e "      JavaScript (.js): ${GREEN}$js_files${NC}"
    echo -e "      TypeScript (.ts): ${GREEN}$ts_files${NC}"
    echo -e "      React TSX (.tsx): ${GREEN}$tsx_files${NC}"
    echo -e "      React JSX (.jsx): ${GREEN}$jsx_files${NC}"
    echo -e "      Rust (.rs): ${GREEN}$rs_files${NC}"
    echo -e "      Go (.go): ${GREEN}$go_files${NC}"
    echo -e "      Java (.java): ${GREEN}$java_files${NC}"
    
    echo -e "   📦 Package Managers:"
    echo -e "      Node.js (package.json): ${GREEN}$has_package_json${NC}"
    echo -e "      Python (requirements.txt): ${GREEN}$has_requirements_txt${NC}"
    echo -e "      Rust (Cargo.toml): ${GREEN}$has_cargo_toml${NC}"
    echo -e "      Go (go.mod): ${GREEN}$has_go_mod${NC}"
    echo -e "      Java (pom.xml): ${GREEN}$has_pom_xml${NC}"
    
    # Determine primary language
    local total_js=$((js_files + ts_files + tsx_files + jsx_files))
    local total_python=$python_files
    local total_rust=$rs_files
    local total_go=$go_files
    local total_java=$java_files
    
    # Language detection logic
    if [ $total_js -gt 0 ] && [ $has_package_json -gt 0 ]; then
        if [ $ts_files -gt 0 ] || [ $tsx_files -gt 0 ]; then
            echo -e "   🎯 Detected Language: ${GREEN}TypeScript/Next.js${NC}"
            echo "typescript"
        else
            echo -e "   🎯 Detected Language: ${GREEN}JavaScript/Node.js${NC}"
            echo "javascript"
        fi
    elif [ $total_python -gt 0 ] && [ $has_requirements_txt -gt 0 ]; then
        echo -e "   🎯 Detected Language: ${GREEN}Python${NC}"
        echo "python"
    elif [ $total_rust -gt 0 ] && [ $has_cargo_toml -gt 0 ]; then
        echo -e "   🎯 Detected Language: ${GREEN}Rust${NC}"
        echo "rust"
    elif [ $total_go -gt 0 ] && [ $has_go_mod -gt 0 ]; then
        echo -e "   🎯 Detected Language: ${GREEN}Go${NC}"
        echo "go"
    elif [ $total_java -gt 0 ] && [ $has_pom_xml -gt 0 ]; then
        echo -e "   🎯 Detected Language: ${GREEN}Java${NC}"
        echo "java"
    else
        echo -e "   ⚠️  Language not clearly detected, using common patterns"
        echo "common"
    fi
}

# Main execution
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: $0 [project_path]"
    echo "  project_path: Path to project directory (default: current directory)"
    echo "  --help, -h: Show this help message"
    exit 0
fi

PROJECT_PATH="${1:-.}"
if [ ! -d "$PROJECT_PATH" ]; then
    echo -e "${YELLOW}❌ Error: Project path '$PROJECT_PATH' not found${NC}"
    exit 1
fi

echo -e "Project Path: ${GREEN}$PROJECT_PATH${NC}"
echo ""

# Detect language
detect_language "$PROJECT_PATH"
