#!/bin/bash

# step-2-update-template.sh - Update base template for project language

echo "�� Step 2: Updating base template for project language..."
echo ""

# Detect project language from INITIAL.md
LANGUAGE=""
if grep -q "Next.js\|React\|TypeScript" INITIAL.md; then
    LANGUAGE="nextjs"
elif grep -q "Python\|Flask\|Django" INITIAL.md; then
    LANGUAGE="python"
elif grep -q "Rust\|Cargo" INITIAL.md; then
    LANGUAGE="rust"
else
    echo "⚠️  Warning: Could not detect specific language, using generic template"
    LANGUAGE="generic"
fi

echo "   Detected language: $LANGUAGE"

# Check if language-specific hints exist
if [ -d "templates/language-hints" ] && [ -f "templates/language-hints/${LANGUAGE}.md" ]; then
    echo "   ✅ Language-specific hints found: templates/language-hints/${LANGUAGE}.md"
    
    # Create project-specific template
    cp templates/prp-base.md PRP-TEMPLATE-${LANGUAGE}.md
    
    echo "   ✅ Created: PRP-TEMPLATE-${LANGUAGE}.md"
    echo "   📝 Customize this template for your specific project needs"
else
    echo "   ⚠️  No language-specific hints found, using base template"
    cp templates/prp-base.md PRP-TEMPLATE.md
    echo "   ✅ Created: PRP-TEMPLATE.md"
fi

echo ""
echo "✅ Step 2: Template updated successfully"
