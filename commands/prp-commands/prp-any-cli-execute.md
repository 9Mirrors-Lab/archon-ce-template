# PRP Execute Command - CLI Version

## Command: `prp execute`

### Purpose
Executes the implementation plan from a Project Requirements Document (PRP), guiding developers through the implementation process step-by-step.

### Usage
```bash
prp execute [options]

# Examples
prp execute                    # Execute entire PRP
prp execute --phase=1          # Execute specific phase
prp execute --task="Setup DB"  # Execute specific task
prp execute --dry-run          # Show execution plan
```

### Options
- `--phase=<number>` - Execute specific implementation phase
- `--task=<name>` - Execute specific task by name
- `--dry-run` - Show execution plan without running
- `--validate` - Run validation after each task
- `--interactive` - Prompt for confirmation at each step
- `--help` - Show help information

### Workflow
1. **Parse PRP** - Load and validate PRP document
2. **Select Scope** - Determine what to execute (full, phase, or task)
3. **Dependency Check** - Verify prerequisites are met
4. **Execute Tasks** - Run selected tasks in dependency order
5. **Validation** - Check task completion and quality
6. **Progress Update** - Update PRP with completion status

### Execution Modes

#### Full PRP Execution
```bash
$ prp execute
📋 Executing full PRP implementation...
✅ Phase 1: Foundation - Complete
✅ Phase 2: Core Features - Complete
✅ Phase 3: Integration - Complete
✅ Phase 4: Testing - Complete
🎉 PRP execution completed successfully!
```

#### Phase-Specific Execution
```bash
$ prp execute --phase=2
📋 Executing Phase 2: Core Features...
✅ Task: Setup Database Models
✅ Task: Implement API Endpoints
✅ Task: Add Authentication
🎉 Phase 2 completed successfully!
```

#### Task-Specific Execution
```bash
$ prp execute --task="Setup Database"
📋 Executing task: Setup Database...
✅ Database connection established
✅ Tables created
✅ Initial data loaded
🎉 Task completed successfully!
```

### Output
- Executes implementation tasks step-by-step
- Updates PRP with completion status
- Creates implementation logs and artifacts
- Generates progress reports

### Error Handling
- Validates PRP format and completeness
- Checks task dependencies before execution
- Provides rollback options for failed tasks
- Logs all execution steps for debugging

### Examples

#### Dry Run Mode
```bash
$ prp execute --dry-run
📋 Execution Plan (Dry Run):
Phase 1: Foundation
  ├── Setup project structure
  ├── Install dependencies
  └── Configure environment

Phase 2: Core Features
  ├── Database setup
  ├── API implementation
  └── Authentication

Total estimated time: 8-12 hours
```

#### Interactive Mode
```bash
$ prp execute --interactive
📋 Task: Setup Database
   This will create database tables and initial data.
   Continue? [y/N]: y
✅ Database setup completed

📋 Task: Implement API Endpoints
   This will create REST API endpoints.
   Continue? [y/N]: y
✅ API endpoints implemented
```

#### Error Recovery
```bash
$ prp execute --phase=2
❌ ERROR: Task "Setup Database" failed
   Database connection timeout
   
   Options:
   1. Retry task
   2. Skip to next task
   3. Abort phase
   
   Select option [1-3]: 1
✅ Task retried successfully
```