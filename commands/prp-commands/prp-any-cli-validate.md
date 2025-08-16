# PRP Validate Command - CLI Version

## Command: `prp validate`

### Purpose
Validates a Project Requirements Document (PRP) against quality standards, ensuring completeness, consistency, and implementation readiness.

### Usage
```bash
prp validate [options]

# Examples
prp validate                    # Validate current PRP
prp validate --fix              # Auto-fix common issues
prp validate --strict           # Use strict validation rules
prp validate --output=report.md # Generate validation report
```

### Options
- `--fix` - Automatically fix common formatting issues
- `--strict` - Use strict validation rules
- `--output=<filename>` - Generate validation report
- `--level=<1-4>` - Set validation level (1=basic, 4=comprehensive)
- `--help` - Show help information

### Validation Levels

#### Level 1: Basic Structure
- File format and markdown syntax
- Required sections presence
- Basic content completeness

#### Level 2: Content Quality
- Implementation blueprint completeness
- Task dependencies and ordering
- Success criteria measurability

#### Level 3: Technical Validation
- Language-specific pattern compliance
- Security and performance considerations
- Testing and validation coverage

#### Level 4: Enterprise Standards
- Company-specific requirements
- Compliance and regulatory standards
- Integration and deployment readiness

### Validation Checks

#### Structure Validation
- [ ] All required sections present
- [ ] Proper heading hierarchy
- [ ] Consistent formatting
- [ ] Valid markdown syntax

#### Content Validation
- [ ] Project context complete
- [ ] Requirements specific and measurable
- [ ] Technical constraints realistic
- [ ] Success criteria achievable

#### Implementation Validation
- [ ] Implementation blueprint complete
- [ ] Task dependencies clear
- [ ] Validation gates defined
- [ ] Error handling planned

### Output
- Validation status report
- List of issues found
- Suggestions for improvements
- Auto-fixed formatting issues (if --fix used)

### Error Handling
- Provides clear error descriptions
- Suggests specific fixes
- Categorizes issues by severity
- Offers auto-fix options when possible

### Examples

#### Basic Validation
```bash
$ prp validate
🔍 Validating PRP: my-project.prp

✅ Level 1: Basic Structure - PASSED
✅ Level 2: Content Quality - PASSED
⚠️  Level 3: Technical Validation - WARNINGS
❌ Level 4: Enterprise Standards - FAILED

📋 Issues Found:
⚠️  Missing performance benchmarks in success criteria
⚠️  No security considerations documented
❌ Company compliance section missing
❌ No audit trail requirements

🎯 Recommendations:
- Add performance benchmarks
- Include security considerations
- Add company compliance section
- Define audit requirements
```

#### Auto-Fix Mode
```bash
$ prp validate --fix
🔍 Validating PRP: my-project.prp

✅ Level 1: Basic Structure - PASSED
⚠️  Level 2: Content Quality - WARNINGS
✅ Level 3: Technical Validation - PASSED
✅ Level 4: Enterprise Standards - PASSED

🔧 Auto-fixes applied:
✅ Fixed inconsistent heading formatting
✅ Corrected markdown syntax errors
✅ Standardized list formatting
✅ Fixed broken links

📋 Remaining Issues:
⚠️  Success criteria could be more specific
⚠️  Consider adding error handling examples
```

#### Strict Validation
```bash
$ prp validate --strict
🔍 Strict validation: my-project.prp

❌ Level 1: Basic Structure - FAILED
❌ Level 2: Content Quality - FAILED
❌ Level 3: Technical Validation - FAILED
❌ Level 4: Enterprise Standards - FAILED

📋 Critical Issues:
❌ Missing project context section
❌ No implementation blueprint
❌ Success criteria not measurable
❌ No validation gates defined
❌ Missing security considerations
❌ No compliance requirements

💡 This PRP needs significant work before implementation.
```

#### Generate Report
```bash
$ prp validate --output=validation-report.md
🔍 Validating PRP: my-project.prp

✅ Validation completed
📄 Report generated: validation-report.md

📊 Summary:
- Structure: 95% (19/20 checks passed)
- Content: 87% (13/15 checks passed)
- Implementation: 92% (23/25 checks passed)
- Standards: 78% (14/18 checks passed)

Overall Score: 88% - GOOD
```

### Best Practices

#### Before Validation
- Ensure PRP is complete and up-to-date
- Run basic formatting checks
- Verify all sections are filled

#### During Validation
- Address critical issues first
- Use auto-fix for formatting issues
- Review warnings for improvement opportunities

#### After Validation
- Fix all failed validations
- Address warnings for better quality
- Update PRP based on feedback
- Re-run validation to confirm fixes