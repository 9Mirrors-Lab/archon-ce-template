# Archon Community Edition Template

A language-agnostic project template system with PRP (Project Requirements Document) workflow enforcement.

## 🚀 Quick Start

```bash
# Clone the template
git clone https://github.com/9Mirrors-Lab/archon-ce-template.git

# Copy to your new project
cp -r archon-ce-template/* /path/to/your/new-project/

# Run the workflow
./workflows/enforce-prp-workflow.sh
```

## 📁 Structure

- `workflows/` - PRP workflow enforcement scripts
- `templates/` - Base PRP templates and language hints
- `commands/` - CLI commands for PRP operations
- `scripts/` - Utility scripts for template management
- `examples/` - Sample project structures

## 🔄 Workflow

1. **Read Context** - Parse `initial.md` for project details
2. **Update Template** - Adapt base PRP for project language
3. **Create PRP** - Generate project-specific requirements document

## 📚 Documentation

See `docs/` folder for detailed setup and usage instructions.

## 🎯 What This Does

The Archon CE Template system automatically:
- Detects your project's programming language
- Updates PRP templates with language-specific patterns
- Generates comprehensive project requirements documents
- Enforces a consistent workflow for all projects

## 🌟 Supported Languages

- **Python** - FastAPI, Django, Flask patterns
- **Next.js** - React, TypeScript, Tailwind patterns
- **Rust** - CLI, web, performance patterns
- **Common** - Universal best practices for any language

## 📖 Example Usage

```bash
# 1. Create new project
./generate-project.sh my-awesome-project

# 2. Edit project details
cd ../my-awesome-project
# Edit initial.md with your project details

# 3. Generate PRP
./workflows/enforce-prp-workflow.sh

# 4. Start implementation
# Your project-specific PRP is ready!
```

## 🔧 Requirements

- Git
- Bash shell
- Basic command line knowledge

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](docs/contributing.md) for guidelines.

---

**Ready to streamline your project setup?** 🚀

This template system ensures every project starts with a comprehensive, language-appropriate PRP that guides implementation from start to finish.