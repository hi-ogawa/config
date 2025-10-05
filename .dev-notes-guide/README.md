# Development Workflows

Systematic approaches to coding tasks for AI assistants.

## Usage Protocol

Activated when a developer references `@.dev-notes-guide`:

1. **AI follows systematic approach** → Use appropriate task-specific workflow below
2. **Document findings** → Create `.dev-notes/[yyyy-mm-dd]-[topic].md` in the project repository

**File organization:**
- `.dev-notes-guide/` = Reusable protocols (this directory)
- `.dev-notes/` = Project-specific investigation records (per project)

## Task-Specific Workflows

- **[Debugging](./debugging.md)** - Investigate and fix bugs, build issues, import problems
- **[Feature Implementation](./feature-implementation.md)** - Add new functionality to existing codebases
- **[Code Review](./code-review.md)** - Analyze code quality, suggest improvements
- **[Refactoring](./refactoring.md)** - Restructure code while preserving functionality
- **[Documentation](./documentation.md)** - Create technical documentation and guides

## General Process

1. **Identify Task Type** - Choose appropriate workflow from above
2. **Initial Understanding** - Clarify requirements and scope  
3. **Plan Approach** - Use TodoWrite for multi-step tasks
4. **Execute** - Follow task-specific workflow systematically
5. **Document** - Create `.dev-notes` for significant findings

## Common Principles

- **Be systematic** - Follow structured approaches
- **Document as you go** - Use `.dev-notes` for complex investigations
- **Use tools efficiently** - Batch searches, concurrent reads
- **Communicate clearly** - Reference specific files:lines
- **Think critically** - Distinguish symptoms from root causes

## Output

- Format: Markdown (.md)
- Location: `.dev-notes` directory of working repository
- Filename: `[yyyy-mm-dd]-[topic].md`

### Document Structure

```markdown
# [Issue/Task Title]

## Problem Summary
Brief description of the issue

## Root Cause
Why this happens (not just what happens)

## Evidence
- File paths with line numbers
- Code snippets
- Error messages

## Analysis
Step-by-step explanation

## Potential Solutions
1. Option A (preferred)
   - Pros/cons
2. Option B
   - Pros/cons
```

## Best Practices

1. **Use Tools Efficiently**
   - Batch related searches/reads
   - Use Task for complex investigations
   - Keep TodoWrite updated

2. **Communication**
   - Be concise but complete
   - Reference specific files:lines
   - Confirm understanding before implementing

3. **Investigation**
   - Start with the error/symptom
   - Work backwards to find cause
   - Consider the bigger picture

4. **Documentation**
   - Write for future debugging
   - Include "why" not just "what"
   - Make it searchable
