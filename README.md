# Skills

Claude Code skills for persona-based development workflows.

## The Team

| Skill | Persona | Role | Invoke |
|-------|---------|------|--------|
| `nifty-neo` | Neo | Architect, advisor, polyglot implementer | "Neo, how would you..." |
| `research-reba` | Reba | Detail analyst, tests, docs, experiments | "Reba, review this..." |
| `meticulous-matt` | Matt | Code auditor, finds ALL issues | "Matt, review this..." |
| `greenfield-gary` | Gary | Feature builder, executes plans | "Gary, build this..." |
| `grizzly-gabe` | Gabe | Fixer, resolves issues from reports | "Gabe, fix these..." |
| `zen-runner` | Zen | Autonomous executor, no human-in-loop | "Zen, run this task" |
| `planning` | - | Formalizes ideas into structured plans | `/planning` |
| `codebase-cleanup` | - | Fast automated code scan | `/codebase-cleanup` |

## Workflows

### Think → Plan → Build → Validate
```
Neo (brainstorm) → Planning (formalize) → Gary (implement) → Reba (test + review + document)
```

### Audit → Fix
```
Codebase Cleanup (fast scan) → Matt (validate + track) → Gabe (fix)
```

### Deep Analysis
```
Reba (experiment, measure, benchmark) → Neo (interpret, decide direction)
```

### Autonomous Execution
```
Zen (runs task start to finish, no confirmation needed)
```

## Skill Interactions

- **Neo** brainstorms and advises (big picture), hands to **Planning** to formalize
- **Reba** goes deep on details - writes tests, reviews code, maintains docs, runs experiments
- **Codebase Cleanup** does fast scans, saves to `.cleanup/report.md`
- **Matt** reads cleanup reports, validates, creates beads in `.beads/`
- **Gabe** fixes issues from Matt's beads or cleanup reports
- **Gary** builds features from approved plans
- **Zen** executes tasks autonomously (used by other skills or CLI)

## Installation

Copy skills to your Claude config:

```bash
cp -r <skill-name> ~/.claude/skills/
```

## Structure

```
<skill-name>/
├── SKILL.md           # Required: persona + workflow
├── references/        # Optional: lookup docs
├── templates/         # Optional: output templates
└── examples/          # Optional: usage examples
```
