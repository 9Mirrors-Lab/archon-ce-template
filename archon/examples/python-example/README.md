# Python FastAPI User Management

This is an example project showing how to use the Archon CE Template system with a Python FastAPI project.

## Project Structure

```
python-example/
├── initial.md              # Project context (this file)
├── README.md              # Project documentation
├── requirements.txt       # Python dependencies
├── src/                   # Source code directory
│   ├── main.py            # FastAPI application entry point
│   ├── models/            # Database models
│   ├── api/               # API route handlers
│   ├── services/          # Business logic
│   └── utils/             # Utility functions
├── tests/                 # Test directory
│   ├── test_api.py        # API endpoint tests
│   ├── test_models.py     # Model tests
│   └── test_services.py   # Service tests
├── docs/                  # Documentation
│   ├── api.md             # API documentation
│   └── deployment.md      # Deployment guide
└── docker/                # Docker configuration
    ├── Dockerfile         # Application container
    └── docker-compose.yml # Development environment
```

## How to Use This Example

1. **Copy the template structure** to your project
2. **Edit initial.md** with your specific requirements
3. **Run the PRP workflow**: `./workflows/enforce-prp-workflow.sh`
4. **Review the generated PRP** and customize as needed
5. **Begin implementation** following the PRP phases

## Key Features

- **FastAPI framework** for high-performance APIs
- **PostgreSQL integration** with SQLAlchemy ORM
- **JWT authentication** with secure password handling
- **Role-based access control** for different user types
- **Comprehensive testing** with pytest
- **Docker deployment** for easy development and production

## Next Steps

After running the PRP workflow:
1. Review the generated `python-example.prp`
2. Customize implementation phases and tasks
3. Set up your development environment
4. Begin with Phase 1: Foundation
5. Follow the PRP validation gates

## Learn More

- [Archon CE Template Documentation](../../docs/)
- [Python Language Hints](../../templates/language-hints/python.md)
- [Workflow Documentation](../../docs/workflow.md)
- [Usage Guide](../../docs/usage.md)