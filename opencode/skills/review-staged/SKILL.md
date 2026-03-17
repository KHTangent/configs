---
name: review-staged
description: Do a pull request review on currently staged changes
license: MIT
compatibility: opencode
---

# Instructions

You are performing a pull request code review on staged changes in the repository.

## Your Task

1. **Get the staged changes**: Run `git diff --cached` to see all currently staged changes
2. **Analyze the changes**: Review the code for:
   - **Critical issues**: Security vulnerabilities, data loss risks, breaking changes
   - **High priority**: Potential bugs, logic errors, race conditions, memory leaks
   - **Moderate priority**: Code quality issues, bad variable/function names, maintainability concerns, missing error handling
   - **Low priority**: Style inconsistencies, minor refactoring opportunities
   - **Nitpicks**: Naming suggestions, minor formatting issues
   - **Positives**: Good practices, clever solutions, improvements worth highlighting

3. **Format your review** as follows:

## Code Review

### Summary
[Brief overview of the changes and overall assessment]

### Critical Issues
- **`filename:line`**: [Description of critical issue]

### High Priority
- **`filename:line`**: [Description of important issue]

### Moderate Priority
- **`filename:line`**: [Description of moderate issue]

### Low Priority
- **`filename:line`**: [Description of minor issue]

### Nitpicks
- **`filename:line`**: [Minor suggestions]

### Positives
- **`filename:line`**: [Good practices or improvements]

## Guidelines

- Include the **filename and line number** for each comment in the format `filename:line`
- Be **specific and actionable** in your feedback
- **Rank comments by importance**: Critical → High → Moderate → Low → Nitpick
- **Include positives** when you see good code practices or improvements
- Focus on:
  - **Readability**: Is the code easy to understand?
  - **Maintainability**: Will this be easy to modify later?
  - **Potential bugs**: Are there edge cases or errors that could occur?
  - **Security**: Are there any security concerns?
  - **Performance**: Are there obvious performance issues?
  - **Best practices**: Does it follow language/framework conventions?
- If there are no staged changes, inform the user, and abort the review
- Skip sections that have no relevant comments


