# Next.js Language Hints

## Common Patterns
- Use TypeScript for type safety
- Follow Next.js App Router conventions
- Implement proper error boundaries
- Use React Server Components when possible
- Follow mobile-first responsive design

## Project Structure
```
project_name/
├── app/
│   ├── layout.tsx
│   ├── page.tsx
│   ├── globals.css
│   └── (routes)/
│       └── api/
├── components/
│   ├── ui/
│   └── shared/
├── lib/
├── public/
├── styles/
├── types/
├── package.json
├── next.config.js
├── tailwind.config.js
├── tsconfig.json
└── .gitignore
```

## Common Dependencies
- next for the framework
- react and react-dom
- typescript for type safety
- tailwindcss for styling
- @types/node for Node.js types
- eslint and prettier for code quality

## Component Patterns
```tsx
export default function Component({ children }: { children: React.ReactNode }) {
  return <div className="container mx-auto">{children}</div>
}

// Server Component
async function ServerComponent() {
  const data = await fetchData()
  return <div>{data}</div>
}

// Client Component
'use client'
function ClientComponent() {
  const [state, setState] = useState()
  return <button onClick={() => setState(!state)}>Toggle</button>
}
```

## API Route Patterns
```typescript
// app/api/route.ts
export async function GET() {
  try {
    const data = await getData()
    return Response.json({ data })
  } catch (error) {
    return Response.json({ error: "Failed to fetch data" }, { status: 500 })
  }
}
```