# Contributing to Archon CE Template

## Overview

Thank you for your interest in contributing to the Archon CE Template project! This guide explains how to contribute effectively and what we're looking for.

## What We're Looking For

### 🚀 New Features
- **Language support** for new programming languages
- **Template improvements** for existing languages
- **Workflow enhancements** for better automation
- **CLI command extensions** for additional functionality
- **Integration tools** for external services

### 🐛 Bug Fixes
- **Script errors** in workflow steps
- **Template issues** causing generation failures
- **Validation problems** with PRP documents
- **Compatibility issues** with different systems
- **Documentation errors** or inconsistencies

### 📚 Documentation
- **Setup guides** for different environments
- **Usage examples** for common scenarios
- **Troubleshooting guides** for common issues
- **API documentation** for customization
- **Best practices** for different project types

### 🧪 Testing
- **Test coverage** for existing functionality
- **Integration tests** for workflow steps
- **Performance tests** for large projects
- **Compatibility tests** for different systems
- **Regression tests** for bug fixes

## Getting Started

### Prerequisites
- Git installed on your system
- Basic knowledge of shell scripting
- Understanding of PRP workflow concepts
- Familiarity with markdown and JSON

### Development Setup
1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/archon-ce-template.git
   cd archon-ce-template
   ```
3. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Make your changes** following the guidelines below
5. **Test your changes** thoroughly
6. **Commit and push** your changes
7. **Create a pull request** with detailed description

## Contribution Guidelines

### Code Style

**Shell Scripts:**
- Use `#!/bin/bash` shebang
- Follow POSIX compatibility when possible
- Use meaningful variable names
- Add comprehensive comments
- Implement proper error handling
- Use consistent indentation (2 spaces)

**Example:**
```bash
#!/bin/bash
# update-template.sh - Update PRP template for project context

# Check if language parameter is provided
if [ -z "$1" ]; then
    echo "❌ ERROR: Language parameter required"
    echo "Usage: ./update-template.sh <language>"
    exit 1
fi

echo "🔄 Updating template for $1..."
```

**Markdown Files:**
- Use consistent heading structure
- Include table of contents for long documents
- Use code blocks with language specification
- Add examples and usage scenarios
- Follow markdown best practices

**Example:**
```markdown
## Template Customization

### Modifying Base PRP Template

**Location:** `templates/prp-base.md`

**What you can customize:**
- Section structure and order
- Required fields and validation rules
- Default content and examples

**Example customizations:**
```bash
# Add custom section
## 🏢 Company Standards
- [ ] Follows company coding standards
- [ ] Meets security requirements
```

### Commit Messages

**Format:** `type(scope): description`

**Types:**
- `feat`: New feature or enhancement
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style improvements
- `refactor`: Code refactoring
- `test`: Test additions or improvements
- `chore`: Maintenance tasks

**Examples:**
```bash
feat(language): add Go language support
fix(workflow): resolve template update failure
docs(usage): add troubleshooting section
style(scripts): improve error message formatting
test(validation): add integration tests
```

### Pull Request Guidelines

**Title:** Clear, descriptive title that explains the change.

**Description:** Detailed explanation including:

- **What** the change accomplishes
- **Why** the change is needed
- **How** the change works
- **Testing** performed
- **Breaking changes** (if any)
- **Related issues** or discussions

**Example:**
```markdown
## Add Python FastAPI Template Support

### What
This PR adds comprehensive FastAPI support to the Python language hints, including:
- Project structure recommendations
- Common dependency patterns
- Testing strategies with pytest
- API documentation examples

### Why
FastAPI is a popular Python web framework that many developers use, but our current Python hints are too generic. This provides specific guidance for FastAPI projects.

### How
- Extended `templates/language-hints/python.md` with FastAPI section
- Added FastAPI-specific project structure
- Included common FastAPI dependencies
- Added testing patterns for FastAPI endpoints

### Testing
- Created test project with FastAPI
- Verified template generation works
- Tested with different project configurations
- Validated generated PRP quality

### Breaking Changes
None - this is purely additive.

### Related Issues
Closes #45 - "Add FastAPI template support"
```

## Development Workflow

### Feature Development
1. **Create issue** describing the feature or enhancement
2. **Discuss approach** with maintainers and community
3. **Create feature branch** from main
4. **Implement feature** following guidelines
5. **Add tests** for new functionality
6. **Update documentation** to reflect changes
7. **Create pull request** with detailed description
8. **Address review feedback** and iterate if needed
9. **Merge** after approval and testing

### Bug Fixes
1. **Create issue** describing the bug (if not already reported)
2. **Reproduce the issue** in a minimal test case
3. **Create fix branch** from main
4. **Implement fix** with minimal changes
5. **Add regression test** to prevent recurrence
6. **Test fix** thoroughly
7. **Create pull request** with fix description
8. **Address review feedback**
9. **Merge** after testing

### Documentation Updates
1. **Identify documentation gap** or improvement
2. **Create documentation branch**
3. **Write or update documentation**
4. **Add examples** and usage scenarios
5. **Review for accuracy** and completeness
6. **Create pull request**
7. **Address feedback**
8. **Merge** after review

## Testing Guidelines

### Test Coverage Requirements
- **New features** must include tests
- **Bug fixes** must include regression tests
- **Scripts** should have unit tests
- **Workflows** should have integration tests
- **Templates** should have validation tests

### Testing Environment
```bash
# Create test environment
mkdir test-project
cd test-project
cp -r ../archon-ce-template/* .
chmod +x workflows/*.sh scripts/*.sh

# Test with different scenarios
# Test 1: Python project
# Test 2: Next.js project
# Test 3: Error conditions
# Test 4: Edge cases
```

### Test Scenarios
- **Happy path** - Normal workflow execution
- **Error conditions** - Missing files, invalid inputs
- **Edge cases** - Empty projects, large projects
- **Different languages** - All supported languages
- **Custom configurations** - Modified templates and workflows

## Review Process

### Code Review Guidelines

**What reviewers look for:**
- **Functionality** - Does it work as intended?
- **Code quality** - Is the code well-written?
- **Error handling** - Are errors handled gracefully?
- **Documentation** - Is the change documented?
- **Testing** - Are tests included and comprehensive?
- **Performance** - Any performance implications?
- **Security** - Any security considerations?

**Review checklist:**
- [ ] Code follows style guidelines
- [ ] Error handling is comprehensive
- [ ] Documentation is updated
- [ ] Tests are included
- [ ] No breaking changes (unless intended)
- [ ] Performance impact is acceptable
- [ ] Security considerations addressed

### Review Timeline
- **Initial review** within 48 hours
- **Follow-up reviews** within 24 hours
- **Final approval** requires at least 2 approvals
- **Merge** after all checks pass

## Community Guidelines

### Communication
- **Be respectful** and constructive in feedback
- **Ask questions** if something is unclear
- **Provide context** when reporting issues
- **Help others** who are contributing
- **Follow the project's code of conduct**

### Getting Help
- **Check existing issues** for similar problems
- **Search documentation** for solutions
- **Ask in discussions** for guidance
- **Tag maintainers** for urgent issues
- **Provide minimal examples** when reporting bugs

## Recognition

### Contributors
All contributors are recognized in:
- **README.md** contributors section
- **GitHub contributors** page
- **Release notes** for significant contributions
- **Project documentation** where appropriate

### Types of Contributions
- **Code contributions** - Scripts, templates, workflows
- **Documentation** - Guides, examples, troubleshooting
- **Testing** - Test cases, validation, quality assurance
- **Community** - Helping others, answering questions
- **Feedback** - Bug reports, feature requests, suggestions

## Questions or Need Help?

If you have questions about contributing or need help getting started:
- **Open an issue** for general questions
- **Start a discussion** for feature ideas
- **Ask in comments** on pull requests
- **Contact maintainers** for specific guidance

We're here to help you contribute successfully! 🚀