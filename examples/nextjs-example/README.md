# Next.js E-commerce Platform

This is an example project showing how to use the Archon CE Template system with a Next.js project.

## Project Structure

```
nextjs-example/
├── initial.md              # Project context (this file)
├── README.md              # Project documentation
├── package.json           # Node.js dependencies
├── next.config.js         # Next.js configuration
├── tailwind.config.js     # Tailwind CSS configuration
├── tsconfig.json          # TypeScript configuration
├── app/                   # Next.js App Router directory
│   ├── layout.tsx         # Root layout component
│   ├── page.tsx           # Home page component
│   ├── globals.css        # Global styles
│   └── (routes)/          # Route groups
│       ├── auth/          # Authentication routes
│       ├── products/      # Product routes
│       ├── cart/          # Shopping cart routes
│       └── admin/         # Admin dashboard routes
├── components/            # Reusable components
│   ├── ui/                # UI components
│   ├── forms/             # Form components
│   └── layout/            # Layout components
├── lib/                   # Utility libraries
│   ├── auth.ts            # Authentication utilities
│   ├── db.ts              # Database utilities
│   └── utils.ts           # General utilities
├── types/                 # TypeScript type definitions
├── public/                # Static assets
└── tests/                 # Test directory
    ├── components/        # Component tests
    ├── pages/             # Page tests
    └── utils/             # Utility tests
```

## How to Use This Example

1. **Copy the template structure** to your project
2. **Edit initial.md** with your specific requirements
3. **Run the PRP workflow**: `./workflows/enforce-prp-workflow.sh`
4. **Review the generated PRP** and customize as needed
5. **Begin implementation** following the PRP phases

## Key Features

- **Next.js 13+** with App Router for modern React development
- **TypeScript** for type safety and better developer experience
- **Tailwind CSS** for utility-first styling
- **Prisma ORM** for type-safe database access
- **Stripe integration** for payment processing
- **Responsive design** for mobile and desktop
- **SEO optimization** for better search engine visibility

## Next Steps

After running the PRP workflow:
1. Review the generated `nextjs-example.prp`
2. Customize implementation phases and tasks
3. Set up your development environment
4. Begin with Phase 1: Foundation
5. Follow the PRP validation gates

## Learn More

- [Archon CE Template Documentation](../../docs/)
- [Next.js Language Hints](../../templates/language-hints/nextjs.md)
- [Workflow Documentation](../../docs/workflow.md)
- [Usage Guide](../../docs/usage.md)