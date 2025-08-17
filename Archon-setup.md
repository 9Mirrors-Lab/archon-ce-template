# Archon Project Setup Guide

*Based on Cole's Live Stream: "Archon Beta Launch Party - Building with BMAD + Archon"*

## 🎯 **Overview**

This guide walks through the complete process of setting up a new project using Archon, following the exact workflow demonstrated by Cole (Archon developer) in his live stream. The process integrates Archon with BMAD method and PRP framework for comprehensive project management.

## 🚀 **Prerequisites**

- Docker Desktop installed and running
- Supabase account (free tier works)
- OpenAI API key
- Git installed

## 📋 **Step 1: Setup Archon**

### **1.1 Clone and Configure Archon**
```bash
# Clone the Archon repository
git clone https://github.com/coleam00/Archon.git
cd Archon

# Copy environment variables template
cp .env.example .env
```

### **1.2 Configure Environment Variables**
Edit `.env` file with your credentials:
```bash
# Supabase Configuration
DATABASE_URL=your_supabase_database_url
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key  # NOT anonymous key!

# OpenAI Configuration  
OPENAI_API_KEY=your_openai_api_key

# Optional: Gemini (Google)
GOOGLE_API_KEY=your_gemini_api_key
```

**⚠️ Important**: Use the **service role key** from Supabase, not the anonymous key!

### **1.3 Setup Database**
1. Go to your Supabase project → SQL Editor
2. Create new snippet
3. Copy and paste the migration script from `migrations/` folder
4. Run the script to create all Archon tables

### **1.4 Start Archon Services**
```bash
# Build and start all containers
docker-compose up -d

# Verify services are running
docker-compose ps
```

You should see 4 containers running:
- `archon-ui` (Frontend - Port 3737)
- `archon-server` (API Server - Port 8181)  
- `archon-mcp` (MCP Server - Port 8051)
- `archon-agents` (Agents Service - Port 8052)

### **1.5 Access Archon UI**
- Open browser to `http://localhost:3737`
- Complete onboarding flow
- Set your API keys

## 🔧 **Step 2: Connect AI Coding Assistant**

### **2.1 Connect Claude Code (Recommended)**
```bash
# Add Archon MCP to Claude Code
claude mcp add archon http://localhost:8051

# Verify connection
claude mcp list
```

### **2.2 Connect Other Assistants**
- **Cursor**: Add to `.cursor/rules/`
- **VS Code**: Install MCP extension
- **Any MCP-compatible assistant**: Follow their MCP setup guide

## 📚 **Step 3: Setup Knowledge Base**

### **3.1 Add Documentation Sources**
1. Go to Archon UI → Knowledge tab
2. Click "Add Source"
3. Add URLs for your tech stack documentation

**Example Sources:**
- **Next.js**: `https://nextjs.org/docs`
- **Python FastAPI**: `https://fastapi.tiangolo.com/`
- **Rust**: `https://doc.rust-lang.org/book/`
- **Library Docs**: Any official documentation URLs

### **3.2 Monitor Crawling Process**
- Archon uses Crawl4AI to recursively navigate URLs
- Processes documents in batches of 5
- Creates embeddings using OpenAI's text-embedding-3-small
- Extracts code examples automatically

**Cost**: Very low - approximately $0.001 per crawl

## 🏗️ **Step 4: Create Project Context**

### **4.1 Create INITIAL.md**
```bash
mkdir my-project
cd my-project
```

Create `INITIAL.md` with your project requirements:
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

### **4.2 Create Archon Project**
1. Go to Archon UI → Projects tab
2. Click "Create New Project"
3. Name: `[Your Project Name]`
4. Description: Brief project overview
5. **Note the project name** - you'll need it for MCP commands

## 🔄 **Step 5: BMAD Method Integration (Optional)**

### **5.1 Install BMAD**
```bash
# Install BMAD method
npx bmad-method install

# Follow the setup wizard:
# - Enter full path to your project
# - Choose PRD sharding: Yes
# - Choose architecture sharding: Yes
# - Select your IDE (Cloud Code, Cursor, etc.)
```

### **5.2 BMAD Agent Workflow**
BMAD provides specialized agents for different development phases:

1. **Analyst Agent (Mary)**
   - Creates project brief
   - Performs initial research
   - Defines scope and requirements

2. **Project Manager Agent (John)**
   - Creates PRD (Product Requirements Document)
   - Defines milestones and timeline
   - Manages project scope

3. **Architect Agent (Winston)**
   - Creates technical architecture
   - Breaks down into implementation tasks
   - Defines code structure

## 📝 **Step 6: Generate PRP (Project Requirements Document)**

### **6.1 Using PRP Framework**
```bash
# In your coding assistant
/generate-prp

# Reference: Use your INITIAL.md or existing project context
# This creates a comprehensive implementation plan
```

### **6.2 PRP Structure**
The generated PRP includes:
- **Goal**: Specific, measurable objectives
- **User Persona**: Target users and use cases
- **Technical Requirements**: Implementation details
- **Architecture**: Code structure and patterns
- **Implementation Tasks**: Specific coding tasks
- **Validation Gates**: Quality assurance steps
- **Anti-patterns**: Common mistakes to avoid

## 🚀 **Step 7: Execute Implementation**

### **7.1 Execute PRP**
```bash
# In your coding assistant
/execute-prp PRPs/your-project-name.md

# Additional context:
# - Use the archon project for task management
# - Use archon for RAG queries
# - Project: [Your Archon Project Name]
```

### **7.2 Real-time Task Management**
- Tasks automatically created in Archon
- Status updates in real-time
- AI marks tasks as "done" automatically
- You can modify task descriptions without interrupting AI

## 🔍 **Step 8: Development Workflow**

### **8.1 AI Development Process**
1. **Task Selection**: AI picks next priority task
2. **Research**: Uses Archon MCP for documentation queries
3. **Implementation**: Writes code following PRP specifications
4. **Validation**: Runs tests and checks
5. **Task Update**: Marks task complete in Archon
6. **Repeat**: Moves to next task

### **8.2 RAG Integration**
Your AI assistant can:
- Search through crawled documentation
- Find code examples
- Access project context
- Query task status
- Create and update documents

### **8.3 Real-time Collaboration**
- **WebSocket Updates**: Archon UI updates instantly
- **MCP Communication**: Direct connection between AI and Archon
- **Document Sync**: All changes visible immediately
- **Task Coordination**: AI manages workflow automatically

## 📊 **Example Project: Cloud Code Instance Manager**

Cole demonstrated building a Next.js app to manage Cloud Code instances:

### **Project Components**
- **Frontend**: Next.js 14 + TypeScript + Tailwind
- **Backend**: Next.js API routes
- **Real-time**: WebSocket integration
- **Terminal**: Xterm.js for instance output
- **Storage**: Local storage for configuration

### **Implementation Tasks (20 total)**
1. Initialize Next.js 14 with TypeScript and Tailwind
2. Install and configure Cloud Code SDK
3. Create API routes for instance management
4. Build dashboard component
5. Create instance card components
6. Implement instance creation form
7. Add real-time terminal display
8. Implement WebSocket connections
9. Add error handling and validation
10. Create configuration management
11. Add instance status monitoring
12. Implement logging system
13. Add user preferences
14. Create responsive design
15. Add loading states
16. Implement error boundaries
17. Add accessibility features
18. Create unit tests
19. Add integration tests
20. Prepare for deployment

## 🎯 **Key Benefits of This Approach**

### **1. Unified Workflow**
- Everything in one place: planning, tasks, knowledge, implementation
- No need to switch between tools
- Consistent project context across all phases

### **2. AI Integration**
- Your coding assistant has access to all project context
- Can research documentation without leaving the development environment
- Manages tasks automatically while you focus on high-level direction

### **3. Knowledge Persistence**
- All research and documentation is searchable and reusable
- Code examples extracted automatically
- Project history maintained across sessions

### **4. Real-time Collaboration**
- Live updates between you and AI
- No manual syncing required
- Immediate visibility into project progress

### **5. Quality Assurance**
- Validation gates ensure code quality
- Anti-patterns prevent common mistakes
- Structured approach reduces errors

## 🚨 **Common Issues and Solutions**

### **1. "Failed to Load Credentials" Error**
- **Cause**: Using anonymous key instead of service role key
- **Solution**: Use service role key from Supabase project settings

### **2. Database Connection Issues**
- **Cause**: Migration script not run
- **Solution**: Run the migration script in Supabase SQL editor

### **3. MCP Connection Problems**
- **Cause**: Archon services not running
- **Solution**: Check `docker-compose ps` and restart if needed

### **4. Port Conflicts**
- **Cause**: Other services using same ports
- **Solution**: Modify ports in `docker-compose.yml`

## 🔮 **Future Enhancements**

Cole mentioned several upcoming features:
- **Knowledge Graphs**: GraphQL-style queries for code relationships
- **Context Engineering Hub**: Pre-built templates and resources
- **Strategy Integration**: Built-in support for PRP, BMAD, etc.
- **Enterprise Features**: Multi-user support, authentication
- **Local Deployment**: One-click installers and cloud deployment

## 📚 **Additional Resources**

- **Archon Repository**: https://github.com/coleam00/Archon
- **Archon Website**: https://archon.diy
- **Dynamis Community**: https://dynamis.ai (for advanced usage)
- **MCP Documentation**: https://modelcontextprotocol.io/
- **BMAD Method**: Search "BMAD method" on YouTube

## 🎉 **Getting Started Checklist**

- [ ] Archon running on localhost:3737
- [ ] MCP connected to your coding assistant
- [ ] Knowledge base populated with relevant docs
- [ ] Project created in Archon
- [ ] INITIAL.md created with project context
- [ ] PRP generated (optional)
- [ ] Ready to start implementation!

---

**This guide covers the complete workflow demonstrated by Cole in his live stream. The key is to start simple, use Archon for everything, and let your AI assistant coordinate the development process through the unified MCP interface.**
