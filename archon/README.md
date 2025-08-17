# Archon CE Template - PRP Generation System

A powerful system for generating high-quality Project Requirements Documents (PRPs) using advanced templates and automated workflows.

## 🚀 Quick Start

### 1. Create Your Project Context

First, create an `INITIAL.md` file in your project directory:

```markdown
# Project: [Your Project Name]

## Language
[python|typescript|rust|go|java|common]

## Purpose
[Brief description of what this project does]

## Requirements
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

## Constraints
- [Constraint 1]
- [Constraint 2]

## Success Criteria
- [Criterion 1]
- [Criterion 2]
```

### 2. Generate Your PRP

Run the PRP generation workflow:

```bash
# Make scripts executable
chmod +x archon/workflows/*.sh archon/scripts/*.sh

# Generate PRP
./archon/workflows/enforce-prp-workflow.sh
```

### 3. Review and Refine

The system will generate a `[project-name].prp` file. Review and complete any placeholder sections.

### 4. Validate Your PRP

```bash
./archon/scripts/validate-prp.sh [project-name].prp
```

## 📁 System Structure

```
archon/
├── workflows/
│   └── enforce-prp-workflow.sh    # Main PRP generation workflow
├── scripts/
│   ├── detect-language.sh         # Language detection utility
│   └── validate-prp.sh           # PRP validation and scoring
├── templates/                     # Language-specific templates
├── examples/                      # Example projects and PRPs
└── docs/                         # Documentation and guides
```

## 🔧 How It Works

### The PRP Workflow

1. **Read Context** - Parse `INITIAL.md` for project details
2. **Detect Language** - Automatically identify programming language
3. **Apply Templates** - Use language-specific patterns and best practices
4. **Generate PRP** - Create comprehensive requirements document
5. **Setup Integration** - Configure Cursor IDE rules and validation
6. **Validate Quality** - Ensure PRP meets quality standards

### Language Detection

The system automatically detects your project's primary language by analyzing:
- File extensions (`.py`, `.ts`, `.rs`, `.go`, `.java`)
- Package manager files (`package.json`, `requirements.txt`, `Cargo.toml`)
- Project structure and patterns

### Template System

Each language has specialized templates including:
- **Common Patterns** - Best practices and conventions
- **Project Structure** - Recommended directory organization
- **Testing Strategies** - Language-specific testing approaches
- **Error Handling** - Common patterns and gotchas

## 📋 PRP Template Structure

Generated PRPs include these required sections:

- **Goal** - Feature goal, deliverables, success definition
- **User Persona** - Target users, use cases, pain points
- **Why** - Business value, integration benefits, problem solving
- **What** - User-visible behavior, technical requirements
- **All Needed Context** - Documentation, references, patterns
- **Implementation Blueprint** - Data models, tasks, integration
- **Validation Loop** - 4-level quality assurance system
- **Anti-Patterns** - Common mistakes to avoid

## 🎯 Validation System

### Level 1: Syntax & Style
- Ruff linting and formatting
- MyPy type checking
- Zero errors before proceeding

### Level 2: Unit Tests
- Test each component as created
- Follow existing test patterns
- Full coverage of public methods

### Level 3: Integration Testing
- Service startup validation
- Endpoint testing
- Database connectivity
- MCP tool validation

### Level 4: Creative Validation
- Domain-specific testing
- Performance validation
- Security scanning
- Load testing if applicable

## 🛠️ Advanced Usage

### Custom Language Support

Add support for new languages:

1. Create `archon/templates/language-hints/yourlang.md`
2. Follow existing template structure
3. Include comprehensive patterns and examples
4. Test with sample projects

### Custom Validation Rules

Extend validation with custom rules:

```bash
# Add custom validation
./archon/scripts/validate-prp.sh --custom-rules my-rules.json
```

### Integration with Archon

Connect with the main [Archon system](https://github.com/coleam00/Archon):

1. Generate PRPs using this template system
2. Import PRPs into Archon for project management
3. Use Archon's MCP server for AI integration
4. Leverage Archon's knowledge base for research

## 📚 Examples

See `archon/examples/` for sample projects:

- **Next.js E-commerce Platform** - Full-stack web application
- **Python FastAPI Service** - REST API with authentication
- **Rust CLI Tool** - Command-line data processor

## 🔍 Troubleshooting

### Common Issues

**"INITIAL.md not found"**
- Create `INITIAL.md` in your project root
- Use examples as templates

**"Language not detected"**
- Check `INITIAL.md` has `Language:` field
- Ensure project has recognizable file structure

**"PRP validation failed"**
- Complete placeholder sections
- Add implementation tasks
- Include validation loops

### Getting Help

1. Check the examples in `archon/examples/`
2. Review validation output for specific issues
3. Ensure all required sections are present
4. Complete placeholder text from `INITIAL.md`

## 🚀 Next Steps

After generating your PRP:

1. **Review and Complete** - Fill in all placeholder sections
2. **Define Tasks** - Break down implementation into specific tasks
3. **Set Priorities** - Order tasks by dependencies
4. **Begin Implementation** - Follow the blueprint step-by-step
5. **Run Validation** - Use validation loops at each level

## 📄 License

This system is part of the Archon CE Template project. See the main project for license details.

---

**Ready to build amazing software?** Start with `INITIAL.md` and run the workflow! 🚀
