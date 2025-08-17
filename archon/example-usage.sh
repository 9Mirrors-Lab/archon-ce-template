#!/bin/bash

# Example Usage Script for Archon PRP Generation
# This demonstrates how to use the system step by step

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Archon PRP Generation - Example Usage${NC}"
echo -e "${BLUE}==========================================${NC}"
echo ""

# Check if we're in a project directory
if [ ! -f "INITIAL.md" ]; then
    echo -e "${YELLOW}📝 Step 1: Create INITIAL.md${NC}"
    echo "   This file contains your project context and requirements"
    echo "   See examples in archon/examples/ for templates"
    echo ""
    
    # Create a sample INITIAL.md
    cat > INITIAL.md << 'EOF'
# Project: Example Project

## Language
python

## Purpose
A simple example project to demonstrate PRP generation

## Requirements
- User authentication system
- REST API endpoints
- Database integration
- Unit tests

## Constraints
- Must use FastAPI
- PostgreSQL database
- Python 3.9+

## Success Criteria
- Users can register and login
- API responds in under 200ms
- 90% test coverage
- Zero security vulnerabilities
EOF

    echo -e "${GREEN}✅ Created sample INITIAL.md${NC}"
    echo ""
fi

# Step 2: Generate PRP
echo -e "${YELLOW}📝 Step 2: Generate PRP${NC}"
echo "   Running the PRP generation workflow..."
echo ""

# Run the workflow
./archon/workflows/enforce-prp-workflow.sh

echo ""
echo -e "${YELLOW}📝 Step 3: Validate Generated PRP${NC}"
echo "   Running validation to check quality..."
echo ""

# Validate the generated PRP
PROJECT_NAME=$(basename "$(pwd)")
./archon/scripts/validate-prp.sh "$PROJECT_NAME.prp"

echo ""
echo -e "${GREEN}🎉 Example Complete!${NC}"
echo ""
echo -e "${BLUE}📋 What Happened:${NC}"
echo "1. ✅ Created sample INITIAL.md with project context"
echo "2. ✅ Generated comprehensive PRP using advanced template"
echo "3. ✅ Validated PRP against quality standards"
echo ""
echo -e "${BLUE}📁 Generated Files:${NC}"
echo "- INITIAL.md - Your project context"
echo "- $PROJECT_NAME.prp - Generated requirements document"
echo "- archon-language-hints.md - Language-specific patterns"
echo ""
echo -e "${BLUE}🚀 Next Steps:${NC}"
echo "1. Review and edit the generated PRP"
echo "2. Complete any placeholder sections"
echo "3. Add specific implementation tasks"
echo "4. Begin development following the blueprint"
echo ""
echo -e "${BLUE}💡 Pro Tips:${NC}"
echo "- Use 'archon/scripts/detect-language.sh' to analyze existing projects"
echo "- Customize templates in 'archon/templates/language-hints/'"
echo "- Extend validation rules in 'archon/scripts/validate-prp.sh'"
echo ""
echo -e "${GREEN}Ready to build amazing software! 🚀${NC}"
