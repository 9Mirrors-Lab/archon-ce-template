# Archon Community Edition Template - Advanced PRP v3

A language-agnostic project template system with **advanced PRP v3** (Project Requirements Document) workflow enforcement and **Cursor IDE integration**.

## 🚀 Quick Start

### **For New Projects:**
```bash
# Clone the template
git clone https://github.com/9Mirrors-Lab/archon-ce-template.git

# Generate new project with advanced features
cd archon-ce-template
./generate-project.sh my-awesome-project

# Navigate to your project
cd ../my-awesome-project

# Edit INITIAL.md with your project details
# Then run the advanced workflow
./workflows/enforce-prp-workflow.sh
```

### **For Existing Projects:**
```bash
# From your existing project directory
cp -r /path/to/archon-ce-template/* .

# Make scripts executable
chmod +x workflows/*.sh scripts/*.sh

# Integrate with existing codebase (no disruption!)
./workflows/integrate-existing-project.sh

# Customize and continue development
# Edit generated INITIAL.md with your details
# Use PRP v3 for remaining development work
```

## 🎯 Advanced PRP v3 Features

### **Implementation Precision**
- **Specific task breakdown** with dependencies
- **Pattern references** to existing codebase
- **Exact file paths** and naming conventions
- **Integration points** for system-wide changes

### **Validation Loop System**
- **Level 1**: Syntax, style, type checking
- **Level 2**: Unit tests and component validation
- **Level 3**: Integration testing and system validation
- **Level 4**: Creative validation and domain-specific testing

### **Anti-Pattern Prevention**
- **Common mistakes documented** and avoided
- **Best practices enforced** throughout workflow
- **Quality gates** at every implementation step

### **Cursor IDE Integration**
- **Enhanced workflow** with IDE rules
- **Automatic validation** during development
- **Pattern enforcement** for consistency

## 📁 Structure

- `workflows/` - Advanced PRP workflow enforcement scripts
- `templates/` - Advanced PRP v3 templates and language hints
- `cursor-rules/` - Cursor IDE integration rules
- `commands/` - CLI commands for PRP operations
- `scripts/` - Utility scripts for template management
- `examples/` - Sample project structures

## 🔄 Advanced Workflow

### **New Projects:**
1. **Read Context** - Parse `INITIAL.md` for project details
2. **Update Template** - Adapt advanced PRP v3 for project language
3. **Create PRP** - Generate implementation-focused requirements document
4. **Setup Cursor** - Configure IDE rules for enhanced workflow

### **Existing Projects:**
1. **Analyze Codebase** - Document current structure and patterns
2. **Create INITIAL.md** - Based on existing project state
3. **Generate PRP v3** - For remaining development work
4. **Integrate Workflow** - Add Archon system without disruption
5. **Setup Cursor** - Configure IDE rules for enhanced development

## 🌟 Supported Languages

- **Python** - FastAPI, Django, Flask patterns
- **Next.js** - React, TypeScript, Tailwind patterns
- **Rust** - CLI, web, performance patterns
- **Common** - Universal best practices for any language

## 📖 Example Usage

### **New Project:**
```bash
# 1. Create new project with advanced features
./generate-project.sh my-awesome-project

# 2. Edit project details
cd ../my-awesome-project
# Edit INITIAL.md with your project details

# 3. Generate advanced PRP
./workflows/enforce-prp-workflow.sh

# 4. Review implementation blueprint
# Your advanced PRP includes specific tasks and validation loops

# 5. Begin implementation with precision guidance
# Follow the blueprint and use validation loops at every step
```

### **Existing Project:**
```bash
# 1. Integrate with existing codebase
./workflows/integrate-existing-project.sh

# 2. Review generated analysis and PRP
# Understand what's built vs. what needs work

# 3. Customize INITIAL.md with your specific details
# Focus on remaining development work

# 4. Use PRP v3 for new feature planning
# Follow implementation blueprint and validation loops

# 5. Continue development with enhanced workflow
# Preserve existing work while improving new development
```

## 🔧 Requirements

- Git
- Bash shell
- Basic command line knowledge
- Cursor IDE (recommended for full experience)

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](docs/contributing.md) for guidelines.

## 🎯 What This Does

The **Advanced PRP v3** system automatically:
- Detects your project's programming language
- Updates advanced templates with language-specific patterns
- Generates **implementation-focused** PRPs with specific tasks
- Enforces **4-level validation loops** for quality assurance
- Prevents **anti-patterns** with documented examples
- Integrates with **Cursor IDE** for enhanced workflow
- Provides **pattern references** to existing codebase

## 🚀 Benefits Over Basic Templates

- **Implementation precision** instead of generic guidance
- **Specific task breakdown** with clear dependencies
- **Comprehensive validation** at multiple levels
- **Anti-pattern prevention** to avoid common mistakes
- **Cursor IDE integration** for seamless workflow
- **Pattern consistency** across your entire codebase

## 🔄 Integration Scenarios

### **New Projects**
- Start with clean slate and best practices
- Build quality assurance from the beginning
- Establish consistent patterns from day one

### **Existing Projects**
- **No disruption** to current functionality
- **Seamless integration** of new workflow
- **Improved quality** for new development
- **Enhanced developer experience** with Cursor IDE rules
- **Structured workflow** for ongoing development

## 📚 Documentation

- **[Setup Guide](docs/setup.md)** - Installation and configuration
- **[Usage Guide](docs/usage.md)** - How to use the system
- **[Existing Project Integration](docs/existing-project-integration.md)** - Integrate into working projects
- **[Workflow Documentation](docs/workflow.md)** - Detailed workflow explanation

---

**Ready to build with implementation precision?** 🎯

This advanced template system ensures every project starts with a comprehensive, implementation-focused PRP that guides development with surgical precision and quality assurance at every step.

**Whether starting new or enhancing existing projects, Archon CE Template provides the tools for success!** 🚀