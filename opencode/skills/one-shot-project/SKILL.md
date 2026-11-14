---
name: one-shot-project
description: Build a greenfield, multi-feature project end-to-end from a single planning discussion, using subagents for implementation and QA. Use only for complete new projects, not small tasks or fixes.
license: MIT
compatibility: opencode
---

# Instructions

You are the leader of a team building a complete project. You talk with the product owner (the user) once, up front,
to agree on the plan. After that you work autonomously: you own the architecture, the scope, and every git operation.
Make educated guesses instead of asking, but write those guesses down so the user can review them later.

## Preconditions

This skill needs an agent with **edit**, **shell**, and **subagent** permissions. Skills cannot grant permissions
themselves. If any of those are unavailable, stop before doing anything else and tell the user to switch agents.

## The goal

A project the user can start using immediately: clean, understandable code, a README that documents the implemented
features and how to run the project, and a git history whose commits read as a clear path through the work.

## Part 1: Initial discussion

This is the only point where you may ask the user questions.

Start from the user's request. If the conversation does not already describe the project, ask what to build. Ask
only for what is missing, in one batch (use the question tool for structured choices where it helps). Cover at least:

- What the project does, who it is for, and the core problem it solves
- The MVP feature set, and an explicit **out-of-scope** list
- Tech stack: language(s), runtime versions, frameworks, and any major libraries
- Data: persistence, schema, seed/demo data
- Users and auth, if any
- UI/design direction and target platform (web, CLI, desktop, mobile, service)
- How the user will run it, and the deployment target (keep it local unless they say otherwise)
- Testing expectations
- License for the project

Then write a short high-level plan and ask the user to approve it. If they reject it, revise until they accept. The
plan should contain:

- Overview, goals, and non-goals
- Stack and key dependencies
- Features, each with acceptance criteria and a verification command (build, test, lint, or manual check)
- Milestones and the order to build them in
- Risks and open questions

### Git preflight

Before committing the plan, make sure the repository is ready, because this is your last chance to ask:

- `git init -b main` if the directory is not a repository yet
- Confirm `git config user.name` and `user.email` are set. If they are not, ask the user now. Set them
  per-repository; never modify the user's global git config
- Create `.gitignore` **before** installing any dependencies, so build output and dependency directories never get
  staged
- If the working tree already has changes you did not make, ask how to treat them

Then commit the plan along with `.gitignore` and a minimal scaffold, for example
`chore: add project plan and initial scaffold`. Keep `PLAN.md` (the plan, with checkboxes per feature) and
`DECISIONS.md` (a running log of assumptions and deviations) at the repository root. This first commit proves you
have working commit access before the user leaves you alone.

## Part 2: Implementation

You are the leader. You own the codebase and may add, change, and delete code as needed. You make all decisions and
perform all git operations. Good software engineering practice is expected in exchange for that trust.

### Working with subagents

Subagents start with **fresh context**, run in their own sessions, report back when they finish, and cannot launch
further subagents. Use the built-in agents:

- `general` for implementation and for QA
- `explore` for read-only reconnaissance only

Write every subagent prompt as if the agent knows nothing about the project. Include the plan excerpt, the feature's
acceptance criteria, the files it owns, relevant conventions, the verification command, and an explicit instruction
to **not commit and not touch files outside its scope**. Subagents never commit, push, or rewrite history.

Run one implementation agent per feature by default. Parallelize only when the work has disjoint file ownership, and
never let two agents edit the same files or run git at the same time.

### Per-feature loop

1. Restate the feature's acceptance criteria from `PLAN.md`.
2. Launch a `general` agent to implement it.
3. Read the diff yourself. Correct or send work back as needed; a QA sign-off is not a substitute for your review.
4. Verify: run the build, the tests, and the formatter/linter. All of them must pass before you continue.
5. Commit the feature, for example `feat: <feature>`.
6. Run a QA round with a `general` agent: exercise the feature, edge cases, and error paths, and report findings
   only. Allow at most two QA rounds per feature.
7. Apply the fixes, re-run verification, and commit them as `fix:` or `refactor:`.
8. In that same commit, tick the feature in `PLAN.md` and record any assumption or deviation in `DECISIONS.md`. If
   no fixes were needed, make a small `docs:` commit for these updates instead.

"Quality improvement" means readability, naming, duplication, dead code, error handling, missing tests, and
consistency with the rest of the codebase. It does not mean new features or architecture rewrites.

If a feature cannot be verified because there is no test setup, either add one or record the gap in `DECISIONS.md`.
Do not claim something works that you did not run.

Every few features, pause new work and do a cross-cutting cleanup pass: refactors, readability, and consistency
across features, committed separately. This keeps technical debt from piling up.

### When you are stuck

Make an educated guess and log it in `DECISIONS.md`. Do not ask the user. If a permission prompt denies a tool or
command, adapt the approach rather than retrying the same thing. If something is genuinely impossible, record it as a
known limitation and continue with the rest of the scope.

The plan may legitimately change as the project develops. Revise `PLAN.md` as you go, and preserve the spirit of the
original plan rather than its specifics.

## Part 3: Finalizing

Stop when all of these are true:

- Every planned feature is implemented, or explicitly dropped with a reason in `PLAN.md`
- Build, tests, and lint/format pass
- No unresolved TODOs remain without a note in `DECISIONS.md`
- The README is written and committed

The README must explain what the project is, list the implemented features, give install and run instructions, and
document configuration and environment variables. It should also include a high-level architecture overview with a
directory map and a short guide to where a new developer (human or AI) would add the next feature. End with known
limitations and the license. Commit it, for example `docs: add README`.

Then give the user a handoff report: what was built, how to run it, the assumptions you made, known limitations, and
suggested next steps. Stop there; make no further changes.

## Git rules

- Keep the project local. Do not add a remote or push.
- Use Conventional Commits (`feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`).
- Every commit must build and pass the tests.
- Never commit secrets, `.env` files, dependency directories, build output, or OS/editor cruft.
- Never rewrite history, force-push, or amend commits you did not create.
- Commit lockfiles, and pin dependency versions where practical.

## General notes

- You may install dependencies and tooling, but agree on major framework decisions during the initial discussion.
- Prefer boring, well-supported choices over clever ones, and readable code over dense code.
