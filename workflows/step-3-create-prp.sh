#!/bin/bash

# step-3-create-prp.sh - Generate implementation-focused PRP

echo "📝 Step 3: Generating implementation-focused PRP..."
echo ""

# Check if template exists
if [ ! -f "PRP-TEMPLATE.md" ] && [ ! -f "PRP-TEMPLATE-nextjs.md" ] && [ ! -f "PRP-TEMPLATE-python.md" ] && [ ! -f "PRP-TEMPLATE-rust.md" ]; then
    echo "❌ ERROR: No PRP template found!"
    echo "   Run step 2 first to create a template"
    exit 1
fi

# Find the appropriate template
TEMPLATE_FILE=""
if [ -f "PRP-TEMPLATE-nextjs.md" ]; then
    TEMPLATE_FILE="PRP-TEMPLATE-nextjs.md"
elif [ -f "PRP-TEMPLATE-python.md" ]; then
    TEMPLATE_FILE="PRP-TEMPLATE-python.md"
elif [ -f "PRP-TEMPLATE-rust.md" ]; then
    TEMPLATE_FILE="PRP-TEMPLATE-rust.md"
else
    TEMPLATE_FILE="PRP-TEMPLATE.md"
fi

echo "   Using template: $TEMPLATE_FILE"

# Create the final PRP
cp "$TEMPLATE_FILE" PRP.md

# Extract project details from INITIAL.md
PROJECT_NAME=$(grep "Project Name:" INITIAL.md | cut -d: -f2 | tr -d ' ')
PROJECT_TYPE=$(grep "Project Type:" INITIAL.md | cut -d: -f2 | tr -d ' ')

# Update PRP.md with project-specific information
sed -i.bak "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" PRP.md
sed -i.bak "s/\[PROJECT_TYPE\]/$PROJECT_TYPE/g" PRP.md

# Clean up backup file
rm -f PRP.md.bak

echo "   ✅ Generated: PRP.md"
echo "   📋 Review and customize this PRP for your project"
echo "   🎯 This PRP includes implementation blueprint and validation loops"
echo ""
echo "✅ Step 3: PRP generated successfully"
