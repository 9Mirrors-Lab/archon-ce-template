#!/bin/bash

# validate-workflow.sh - Validate workflow completion

echo "🔍 Validating workflow completion..."
echo ""

# Check required files
REQUIRED_FILES=("INITIAL.md" "PRP.md" "PROJECT_STRUCTURE.md")
MISSING_FILES=()

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "   ✅ $file"
    else
        echo "   ❌ $file (missing)"
        MISSING_FILES+=("$file")
    fi
done

echo ""

if [ ${#MISSING_FILES[@]} -eq 0 ]; then
    echo "🎉 All required files created successfully!"
    echo ""
    echo "📋 Workflow Summary:"
    echo "   • Project context: INITIAL.md"
    echo "   • Implementation PRP: PRP.md"
    echo "   • Project structure: PROJECT_STRUCTURE.md"
    echo "   • Cursor rules: .cursor/rules/*.mdc files"
    echo ""
    echo "🚀 You're ready to begin implementation!"
else
    echo "⚠️  Some files are missing:"
    for file in "${MISSING_FILES[@]}"; do
        echo "   - $file"
    done
    echo ""
    echo "   Review the workflow steps and ensure all files are created."
fi

echo ""
echo "✅ Workflow validation completed"
