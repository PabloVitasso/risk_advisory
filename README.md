# Skills Team

A self-organizing team of Claude Code skills that knows each other and can improve themselves.

## The Team

| Skill | Role | One-liner |
|-------|------|-----------|
| `planning-peter` | Founder/Lead | Invents process, drives consensus, runs retros |
| `nifty-neo` | Architect/Critic | Challenges designs, finds bottlenecks, grounds hallucinations |
| `research-reba` | Guardian/QA | Validates everything, guards IMMUTABLE sections, gatekeeper |
| `meticulous-matt` | Auditor | Finds all issues, reports honestly, tracks in beads |
| `greenfield-gary` | Builder | Implements from plans |
| `grizzly-gabe` | Fixer | Resolves issues from reports |
| `zen-runner` | Executor | Autonomous work, no human-in-loop |
| `codebase-cleanup` | Utility | Fast automated scans |

## Quick Start

### Genesis Command

To initialize the team's self-organization:

```
Peter, the team is formed but unorganized. Run the first Retrospective
to define your initial operating protocols in TEAM.md. Keep it lightweight.
```

### Common Invocations

```
"Neo, how would you build this?"     → Architecture advice
"Peter, plan this feature"           → Formal planning
"Gary, build this"                   → Execute from plan
"Matt, review the codebase"          → Full audit
"Gabe, fix these issues"             → Work through beads
"Reba, validate this"                → QA sign-off
"Zen, run this task"                 → Autonomous execution
```

## Workflows

### Think → Plan → Build → Validate
```
Neo (brainstorm) → Peter (plan) → Gary (implement) → Reba (validate)
```

### Audit → Fix
```
Codebase Cleanup (scan) → Matt (track in beads) → Gabe (fix) → Reba (validate)
```

### Team Self-Improvement
```
Peter (run retro) → Matt (audit team) → Neo (challenge) → Team (improve) → Reba (validate)
```

## Git Workflow

- Team works on `skill_team` branch
- User reviews and merges to `main`
- Skills cannot push directly to main

## Constraints

See `TEAM.md` for:
- Prime Directive (Maximize User Value)
- Safety Rails (IMMUTABLE sections, Reba's Law)
- Current team protocols (self-defined)

## Installation

Copy to your Claude config:

```bash
cp -r * ~/.claude/skills/
```

## Structure

```
_skills/
├── TEAM.md                 # Team protocols (self-organizing)
├── .team/                  # Collaboration artifacts
│   ├── changelog.md        # Team changes log
│   └── ...                 # Retro outputs, etc.
├── planning-peter/         # Team lead
├── nifty-neo/              # Architect/Critic
├── research-reba/          # Guardian/QA
├── meticulous-matt/        # Auditor
├── greenfield-gary/        # Builder
├── grizzly-gabe/           # Fixer
├── zen-runner/             # Executor
└── codebase-cleanup/       # Utility (no persona)
```
