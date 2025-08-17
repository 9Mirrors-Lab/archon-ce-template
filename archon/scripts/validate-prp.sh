#!/bin/bash

# PRP Validation Script for Archon CE Template
# Validates generated PRPs against quality standards and completeness

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Default PRP file
PRP_FILE="${1:-*.prp}"

echo -e "${BLUE}🔍 Archon PRP Validation${NC}"
echo -e "${BLUE}========================${NC}"

# Function to validate PRP file
validate_prp() {
    local prp_file="$1"
    local validation_score=0
    local total_checks=0
    
    echo -e "Validating: ${GREEN}$prp_file${NC}"
    echo ""
    
    # Check if file exists
    if [ ! -f "$prp_file" ]; then
        echo -e "${RED}❌ Error: PRP file '$prp_file' not found${NC}"
        return 1
    fi
    
    # Required sections check
    echo -e "${YELLOW}📋 Required Sections Check:${NC}"
    
    local sections=("Goal" "User Persona" "Why" "What" "All Needed Context" "Implementation Blueprint" "Validation Loop" "Anti-Patterns")
    
    for section in "${sections[@]}"; do
        total_checks=$((total_checks + 1))
        if grep -q "## $section" "$prp_file"; then
            echo -e "   ✅ $section: ${GREEN}Found${NC}"
            validation_score=$((validation_score + 1))
        else
            echo -e "   ❌ $section: ${RED}Missing${NC}"
        fi
    done
    
    echo ""
    
    # Content quality checks
    echo -e "${YELLOW}📝 Content Quality Checks:${NC}"
    
    # Check for placeholder text
    total_checks=$((total_checks + 1))
    if grep -q "\[To be filled" "$prp_file"; then
        echo -e "   ⚠️  Placeholder text: ${YELLOW}Found (needs completion)${NC}"
        validation_score=$((validation_score + 1))
    else
        echo -e "   ✅ Placeholder text: ${GREEN}None found (good)${NC}"
        validation_score=$((validation_score + 1))
    fi
    
    # Check for implementation tasks
    total_checks=$((total_checks + 1))
    if grep -q "Task [0-9]" "$prp_file"; then
        echo -e "   ✅ Implementation tasks: ${GREEN}Found${NC}"
        validation_score=$((validation_score + 1))
    else
        echo -e "   ❌ Implementation tasks: ${RED}Missing${NC}"
    fi
    
    # Check for validation loops
    total_checks=$((total_checks + 1))
    if grep -q "Level [1-4]" "$prp_file"; then
        echo -e "   ✅ Validation loops: ${GREEN}Found${NC}"
        validation_score=$((validation_score + 1))
    else
        echo -e "   ❌ Validation loops: ${RED}Missing${NC}"
    fi
    
    # Check for anti-patterns
    total_checks=$((total_checks + 1))
    if grep -q "Anti-Patterns" "$prp_file"; then
        echo -e "   ✅ Anti-patterns: ${GREEN}Found${NC}"
        validation_score=$((validation_score + 1))
    else
        echo -e "   ❌ Anti-patterns: ${RED}Missing${NC}"
    fi
    
    echo ""
    
    # File structure checks
    echo -e "${YELLOW}📁 File Structure Checks:${NC}"
    
    # Check file size
    total_checks=$((total_checks + 1))
    local line_count=$(wc -l < "$prp_file")
    if [ $line_count -gt 50 ]; then
        echo -e "   ✅ File size: ${GREEN}${line_count} lines (substantial)${NC}"
        validation_score=$((validation_score + 1))
    else
        echo -e "   ⚠️  File size: ${YELLOW}${line_count} lines (may be too brief)${NC}"
        validation_score=$((validation_score + 1))
    fi
    
    # Check for proper markdown formatting
    total_checks=$((total_checks + 1))
    if grep -q "^## " "$prp_file"; then
        echo -e "   ✅ Markdown headers: ${GREEN}Properly formatted${NC}"
        validation_score=$((validation_score + 1))
    else
        echo -e "   ❌ Markdown headers: ${RED}Improperly formatted${NC}"
    fi
    
    echo ""
    
    # Calculate and display score
    local percentage=$((validation_score * 100 / total_checks))
    
    echo -e "${YELLOW}📊 Validation Results:${NC}"
    echo -e "   Score: ${GREEN}$validation_score/$total_checks${NC}"
    echo -e "   Percentage: ${GREEN}${percentage}%${NC}"
    
    # Determine grade
    if [ $percentage -ge 90 ]; then
        echo -e "   Grade: ${GREEN}A (Excellent)${NC}"
    elif [ $percentage -ge 80 ]; then
        echo -e "   Grade: ${GREEN}B (Good)${NC}"
    elif [ $percentage -ge 70 ]; then
        echo -e "   Grade: ${YELLOW}C (Satisfactory)${NC}"
    elif [ $percentage -ge 60 ]; then
        echo -e "   Grade: ${YELLOW}D (Needs Improvement)${NC}"
    else
        echo -e "   Grade: ${RED}F (Failing)${NC}"
    fi
    
    echo ""
    
    # Recommendations
    if [ $percentage -lt 80 ]; then
        echo -e "${YELLOW}💡 Recommendations:${NC}"
        if grep -q "\[To be filled" "$prp_file"; then
            echo -e "   • Complete all placeholder sections from INITIAL.md"
        fi
        if ! grep -q "Task [0-9]" "$prp_file"; then
            echo -e "   • Add specific implementation tasks with clear steps"
        fi
        if ! grep -q "Level [1-4]" "$prp_file"; then
            echo -e "   • Include comprehensive validation loops"
        fi
        echo -e "   • Review and refine content quality"
    else
        echo -e "${GREEN}🎉 PRP is ready for implementation!${NC}"
    fi
    
    echo ""
    
    return 0
}

# Main execution
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: $0 [prp_file]"
    echo "  prp_file: Path to PRP file to validate (default: *.prp)"
    echo "  --help, -h: Show this help message"
    exit 0
fi

# Find PRP files if pattern is used
if [[ "$PRP_FILE" == *"*"* ]]; then
    PRP_FILES=$(find . -name "$PRP_FILE" -type f 2>/dev/null)
    if [ -z "$PRP_FILES" ]; then
        echo -e "${YELLOW}⚠️  No PRP files found matching pattern: $PRP_FILE${NC}"
        exit 1
    fi
else
    PRP_FILES="$PRP_FILE"
fi

# Validate each PRP file
for file in $PRP_FILES; do
    validate_prp "$file"
    echo -e "${BLUE}────────────────────────────────────────${NC}"
    echo ""
done

echo -e "${BLUE}✅ PRP validation complete!${NC}"
