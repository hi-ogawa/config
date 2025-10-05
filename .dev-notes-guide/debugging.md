# Debugging Workflow

For investigating bugs, build issues, import problems, and other technical failures.

## Process

### 1. Initial Understanding
- Clarify the problem statement
- Identify key files/components involved
- Use TodoWrite to plan investigation steps
- Ask clarifying questions if needed

### 2. Investigation Phase
- Start broad (grep/find patterns) then narrow down
- Read relevant files to understand context
- Trace execution flow
- Document findings as you go
- Look for similar patterns in codebase

### 3. Root Cause Analysis
- Distinguish symptoms from root causes
- Identify why the issue occurs (not just what)
- Consider architectural implications
- Check for related/duplicate issues

### 4. Solution Development
- Propose minimal, targeted fixes
- Consider side effects
- Verify assumptions before implementing
- Test understanding with user before major changes

### 5. Documentation
- Create clear summary in `.ai-notes`
- Include evidence (file paths, line numbers)
- Explain both the problem AND why it happens
- Document potential solutions with trade-offs

## Debugging Patterns

### For Build/Bundle Issues
- Start with output artifacts (what failed)
- Trace backwards through build pipeline
- Look for dual/conflicting configurations
- Check external dependencies and resolution

### For Import/Resolution Issues
- Check if file exists vs. where it's expected
- Trace import paths through build tools
- Look for external/alias configurations
- Verify module resolution order

### For Runtime Errors
- Start with error stack trace
- Work backwards through call chain
- Check data flow and state changes
- Look for timing/async issues

## Document Template

```markdown
# [Issue Title]

## Problem Summary
Brief description of the issue and symptoms

## Root Cause
Why this happens (not just what happens)

## Evidence
- File paths with line numbers
- Code snippets
- Error messages
- Build outputs

## Flow Tracing
```
Expected: A → B → C
Actual: A → B → C + A → D → C (duplicate)
Issue: Step A triggers both paths
```

## Analysis
Step-by-step explanation of investigation

## Potential Fixes
1. Option A (preferred)
   - Pros/cons
   - Implementation approach
2. Option B
   - Pros/cons
   - Trade-offs
```

## Best Practices

- **Work backwards from symptoms** - Start with the failure point
- **Look for architectural conflicts** - Multiple systems doing the same thing
- **Verify assumptions** - Don't assume file locations or configurations
- **Document the journey** - Record dead ends and false leads
- **Focus on "why"** - Understanding prevents future similar issues