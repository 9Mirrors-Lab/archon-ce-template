#!/bin/bash

# step-1-read-context.sh - Read and validate INITIAL.md for advanced PRP v3

echo "📖 Step 1: Reading project context (Advanced PRP v3)..."
echo "   Note: Using INITIAL.md (capitalized) for v3 workflow"
echo ""

if [ ! -f "INITIAL.md" ]; then
    echo "❌ ERROR: INITIAL.md not found!"
    echo "   Create INITIAL.md with project context first"
    echo "   Use generate-project.sh to create a new project"
    echo ""
    echo "   Advanced PRP v3 requires INITIAL.md (capitalized)"
    exit 1
fi

# Validate INITIAL.md content for advanced PRP v3
if ! grep -q "## Project Type" INITIAL.md; then
    echo "❌ ERROR: INITIAL.md missing Project Type specification"
    echo "   Add '## Project Type [your-project-type]' to INITIAL.md"
    exit 1
fi

if ! grep -q "## Project Name" INITIAL.md; then
    echo "❌ ERROR: INITIAL.md missing Project Name specification"
    echo "   Add '## Project Name [your-project-name]' to INITIAL.md"
    exit 1
fi

if ! grep -q "## Description" INITIAL.md; then
    echo "❌ ERROR: INITIAL.md missing Description"
    echo "   Add '## Description' section to INITIAL.md"
    exit 1
fi

if ! grep -q "## Technology Stack" INITIAL.md; then
    echo "❌ ERROR: INITIAL.md missing Technology Stack"
    echo "   Add '## Technology Stack' section to INITIAL.md"
    exit 1
fi

# Extract and display key information
PROJECT_TYPE=$(grep "## Project Type" INITIAL.md | cut -d: -f2 | tr -d ' ')
PROJECT_NAME=$(grep "## Project Name" INITIAL.md | cut -d: -f2 | tr -d ' ')

echo "   ✅ ## Project Type $PROJECT_TYPE"
echo "   ✅ ## Project Name $PROJECT_NAME"
echo "   ✅ ## Description Present"
echo "   ✅ ## Technology Stack Present"
echo "   ✅ Project context validated for advanced PRP v3"
echo ""
echo "✅ Step 1: Advanced project context read successfully"
