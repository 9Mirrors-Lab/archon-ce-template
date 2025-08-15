#!/bin/bash

# step-4-setup-cursor.sh - Setup Cursor IDE rules and project structure

echo "⚙️  Step 4: Setting up Cursor IDE rules and project structure..."
echo ""

# Check if .cursor/rules directory exists
if [ -d ".cursor/rules" ]; then
    echo "   📁 Cursor rules directory found"
    
    # Create .cursor/rules directory in project if it doesn't exist
    mkdir -p .cursor/rules
    
    # Copy cursor rules to project .cursor/rules directory
    if [ -f ".cursor/rules/template-automation.mdc" ]; then
        cp .cursor/rules/template-automation.mdc .cursor/rules/
        echo "   ✅ Copied: .cursor/rules/template-automation.mdc"
    fi
    
    # Copy other cursor rules if they exist
    for rule_file in .cursor/rules/*.mdc; do
        if [ -f "$rule_file" ]; then
            filename=$(basename "$rule_file")
            cp "$rule_file" ".cursor/rules/${filename}"
            echo "   ✅ Copied: .cursor/rules/${filename}"
        fi
    done
else
    echo "   ⚠️  No .cursor/rules directory found"
fi

# Create project structure hints
echo "   🏗️  Creating project structure hints..."

cat > PROJECT_STRUCTURE.md << 'STRUCTURE_EOF'
# Project Structure Guide

This document provides guidance for implementing the PRP requirements.

## Implementation Order
1. **Core Infrastructure** - Set up basic project structure
2. **Data Models** - Define data structures and schemas
3. **Core Logic** - Implement main business logic
4. **API Layer** - Create interfaces and endpoints
5. **UI Components** - Build user interface elements
6. **Integration** - Connect all components
7. **Testing** - Validate functionality
8. **Documentation** - Complete project documentation

## Key Files to Create
- [ ] Core implementation files
- [ ] Configuration files
- [ ] Test files
- [ ] Documentation files

## Next Steps
Review the generated PRP.md and begin implementation following the blueprint.
STRUCTURE_EOF

echo "   ✅ Created: PROJECT_STRUCTURE.md"
echo ""
echo "✅ Step 4: Cursor IDE setup completed successfully"
