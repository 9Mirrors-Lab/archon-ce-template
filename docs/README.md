# Archon CE Template Documentation

## 📚 Documentation Overview

This documentation covers all aspects of the Archon CE Template system, from basic setup to advanced integration scenarios.

## 🚀 Getting Started

### New Projects
- **[Setup Guide](setup.md)** - Installation and initial configuration
- **[Usage Guide](usage.md)** - How to use the template system
- **[Workflow Documentation](workflow.md)** - Detailed workflow explanation

### Existing Projects
- **[Existing Project Integration](existing-project-integration.md)** - Integrate into already-started projects
- **[Migration Guide](migration.md)** - Move from other systems to Archon

## 🔄 Workflows

### Basic Workflow
- **[Standard Workflow](workflow.md)** - 4-step PRP generation process
- **[Validation Loops](validation.md)** - 4-level quality assurance system

### Advanced Workflows
- **[Advanced PRP v3](advanced-prp-v3.md)** - Implementation-focused templates
- **[Cursor IDE Integration](cursor-integration.md)** - Enhanced development experience
- **[Language-Specific Patterns](language-patterns.md)** - Technology-specific guidance

## 🎯 Use Cases

### Project Types
- **[Python Projects](python-guide.md)** - FastAPI, Django, Flask patterns
- **[Next.js Projects](nextjs-guide.md)** - React, TypeScript, Tailwind patterns
- **[Rust Projects](rust-guide.md)** - CLI, web, performance patterns
- **[Custom Languages](custom-language.md)** - Adding support for new technologies

### Integration Scenarios
- **[Team Development](team-development.md)** - Collaborative PRP workflows
- **[CI/CD Integration](ci-cd-integration.md)** - Automated validation and testing
- **[Enterprise Integration](enterprise.md)** - Large-scale deployment and customization

## 🔧 Customization

### Templates
- **[Template Customization](customization.md)** - Modifying templates for your needs
- **[Language Hints](language-hints.md)** - Adding support for new languages
- **[Pattern Libraries](pattern-libraries.md)** - Building reusable pattern collections

### Workflows
- **[Workflow Customization](workflow-customization.md)** - Adapting workflows to your process
- **[Validation Rules](validation-rules.md)** - Customizing quality assurance
- **[Integration Hooks](integration-hooks.md)** - Connecting with external tools

## 📖 Examples

### Sample Projects
- **[Python Example](examples/python-example/)** - FastAPI user management system
- **[Next.js Example](examples/nextjs-example/)** - E-commerce platform
- **[Rust Example](examples/rust-example/)** - CLI data processor

### Integration Examples
- **[Existing Project Integration](examples/existing-project-integration/)** - Adding Archon to working project
- **[Team Workflow Example](examples/team-workflow/)** - Collaborative development process
- **[Enterprise Example](examples/enterprise-integration/)** - Large-scale deployment

## 🤝 Contributing

### Development
- **[Contributing Guide](../CONTRIBUTING.md)** - How to contribute to the project
- **[Development Setup](development-setup.md)** - Setting up development environment
- **[Testing Guide](testing.md)** - Running tests and quality assurance

### Community
- **[Community Guidelines](community.md)** - How to participate in the community
- **[Code of Conduct](code-of-conduct.md)** - Community standards and expectations
- **[Support Resources](support.md)** - Where to get help and support

## 🔍 Reference

### API Reference
- **[CLI Commands](cli-reference.md)** - Command-line interface reference
- **[Template API](template-api.md)** - Template system API reference
- **[Workflow API](workflow-api.md)** - Workflow system API reference

### Configuration
- **[Configuration Reference](config-reference.md)** - All configuration options
- **[Environment Variables](env-vars.md)** - Environment variable reference
- **[File Formats](file-formats.md)** - Supported file format specifications

## 📋 Quick Reference

### Common Commands
```bash
# New project
./generate-project.sh my-project
cd my-project
./workflows/enforce-prp-workflow.sh

# Existing project integration
cp -r /path/to/archon-ce-template/* .
./workflows/integrate-existing-project.sh

# Manual workflow steps
./workflows/step-1-read-context.sh
./workflows/step-2-update-template.sh
./workflows/step-3-create-prp.sh
./workflows/step-4-setup-cursor.sh
```

### File Structure
```
archon-ce-template/
├── workflows/           # PRP workflow scripts
├── templates/           # PRP templates and language hints
├── scripts/            # Utility scripts
├── .cursor/rules/       # Cursor IDE integration
├── examples/           # Sample projects
└── docs/               # This documentation
```

### Key Files
- `INITIAL.md` - Project context (required)
- `[project-name].prp` - Generated PRP document
- `archon-analysis/` - Codebase analysis results
- `.cursor/rules/` - Cursor IDE rules

## 🆘 Support

### Getting Help
- **Documentation**: Start with this guide and related pages
- **Examples**: Study the sample projects for practical guidance
- **Community**: Check GitHub issues and discussions
- **Analysis**: Use generated analysis files for troubleshooting

### Common Issues
- **[Troubleshooting Guide](troubleshooting.md)** - Solutions to common problems
- **[FAQ](faq.md)** - Frequently asked questions
- **[Error Reference](error-reference.md)** - Common error messages and solutions

## 🎯 What's Next

### Learning Path
1. **Start with Setup Guide** - Get the system running
2. **Try Basic Workflow** - Generate your first PRP
3. **Explore Examples** - See how others use the system
4. **Customize Templates** - Adapt to your specific needs
5. **Integrate with Team** - Scale the workflow across your organization

### Advanced Topics
- **Custom Language Support** - Add support for new technologies
- **Enterprise Integration** - Deploy at scale
- **Team Workflow Optimization** - Optimize for collaboration
- **Performance Tuning** - Optimize workflow performance

---

*Part of Archon CE Template Documentation*