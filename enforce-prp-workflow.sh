#!/bin/bash

# enforce-prp-workflow.sh - Main workflow orchestrator with advanced PRP v3 integration

echo "🚀 Advanced PRP Workflow v3 - Enforcing Correct Order"
echo "====================================================="
echo ""
echo "🎯 This workflow integrates:"
echo "   • Advanced PRP template v3 (implementation-focused)"
echo "   • Cursor IDE rules for enhanced workflow"
echo "   • Language-specific pattern adaptation"
echo "   • Comprehensive validation loops"
echo ""

# Check if we're in a project directory
if [ ! -f "INITIAL.md" ]; then
    echo "❌ ERROR: Not in a project directory!"
    echo "   Run this from a project folder with INITIAL.md"
    echo "   Use generate-project.sh to create a new project first"
    echo ""
    echo "   Note: INITIAL.md (not initial.md) is required for v3 workflow"
    exit 1
fi

echo "📋 Advanced Workflow Steps:"
echo "1. Read project context from INITIAL.md"
echo "2. Update advanced PRP template v3 for project language"
echo "3. Generate implementation-focused PRP with validation loops"
echo "4. Setup Cursor IDE rules for enhanced workflow"
echo ""

# Execute each step in sequence
./workflows/step-1-read-context.sh || exit 1
echo ""
./workflows/step-2-update-template.sh || exit 1
echo ""
./workflows/step-3-create-prp.sh || exit 1
echo ""
./workflows/step-4-setup-cursor.sh || exit 1
echo ""

# Validate workflow completion
./workflows/validate-workflow.sh
echo ""
echo "✅ Advanced PRP Workflow v3 completed successfully!"
echo "📝 Your implementation-focused PRP is ready!"
echo ""
echo "🎯 Next steps:"
echo "   • Review the generated PRP for completeness"
echo "   • Use Cursor IDE with enhanced rules"
echo "   • Follow the 4-level validation loop"
echo "   • Begin implementation with precision guidance"
