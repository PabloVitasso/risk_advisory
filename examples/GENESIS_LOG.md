# Genesis Log

This document records how the team went from an empty `TEAM.md` to a fully operational protocol.

---

## The Bootstrap Command

```
Peter, run the Genesis Retro.
```

That's it. One sentence, and the team self-organized.

---

## What Happened

### 1. Peter Proposed Initial Protocols

Peter, as Founder/Lead, drafted the first set of operating protocols:
- Work Flow: Triage → Execute → Validate
- Involvement Matrix: Who does what
- Retro triggers: When to improve
- Documentation rules: Where to write things down

### 2. Neo Challenged the Draft

Neo, as Devil's Advocate, found gaps and bottlenecks:
- **Complexity Signals**: "How do we know when something is 'complex'?"
- **Escalation Ladder**: "What happens when someone is stuck?"
- **Context Persistence**: "We're stateless. We need to write things down."
- **Quality Ownership**: "Don't make validation a bottleneck."

### 3. User Approved Neo's Amendments

The user reviewed Neo's challenges and approved them. Peter synthesized both drafts.

### 4. Reba Validated Before Landing

Reba checked that:
- IMMUTABLE Safety Rails were preserved
- No contradictions in the protocol
- Changes served the Prime Directive

### 5. TEAM.md v1.0 Landed

The final protocol included:
- Prime Directive (Maximize User Value)
- Safety Rails (No Lobotomies, Reba's Law, Stay in Lane, No Direct Push)
- Work Flow with Complexity Signals
- Involvement Matrix
- Quality Ownership
- Escalation Ladder
- Context Persistence rules
- Retrospective triggers

---

## The State Machine

The team operates as a **file-driven state machine**:

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Files     │ ──▶ │   Agents    │ ──▶ │   Files     │
│  (context)  │     │  (process)  │     │  (output)   │
└─────────────┘     └─────────────┘     └─────────────┘
       │                   │                   │
       └───────────────────┴───────────────────┘
                     (loop)
```

**Files provide context:**
- `TEAM.md` tells agents how to collaborate
- `.team/plans/` contains active work
- `.team/retro/` records learnings
- Skill MUTABLE sections store agent-specific knowledge

**Agents process and output:**
- Peter reads TEAM.md → Proposes protocol changes → Writes to TEAM.md
- Gary reads plan → Implements code → Updates plan status
- Matt reads codebase → Finds issues → Writes to beads
- Reba reads changes → Validates → Approves or rejects

**The loop continues:**
- Each agent invocation reads current state from files
- Each agent writes updated state back to files
- Next invocation picks up where the last left off

This is how stateless agents maintain continuity: **they persist context to files**.

---

## What You'll See After Genesis

After running the Genesis Retro, your `TEAM.md` will contain:

1. **Work Flow** - How tasks flow through the team
2. **Complexity Signals** - When to plan vs. just do
3. **Involvement Matrix** - Who handles what
4. **Quality Ownership** - Builder owns quality
5. **Escalation Ladder** - What to do when stuck
6. **Context Persistence** - Where to write things down
7. **Retrospective Triggers** - When to improve

See `TEAM_FULL.md` in this directory for an example of a completed protocol.

---

## Key Learnings

1. **The team invented their own process.** The user provided the bootstrap command and the Prime Directive. The team figured out the rest.

2. **Neo prevents hallucinations.** Without a critic, Peter might propose workflows that sound good but don't work. Neo grounds them.

3. **Reba is the safety net.** All self-modifications pass through Reba. This prevents the team from accidentally lobotomizing themselves.

4. **Files are memory.** Between invocations, agents are stateless. Files are the persistent memory that lets them pick up where they left off.

5. **Velocity over ceremony.** The protocols are lightweight. The goal is to ship value to the user, not to follow process for its own sake.

---

## Try It Yourself

1. Copy the skills to `~/.claude/skills/`
2. Run: `Peter, run the Genesis Retro.`
3. Watch them build their own `TEAM.md`
4. Check `.team/dashboard.ps1` for a status visualization

The team will figure it out. That's the point.
