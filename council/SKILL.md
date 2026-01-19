---
name: council
description: >
  Council orchestration. Invoke with "/council <situation>" to run a full risk assessment,
  "/council genesis" to bootstrap protocols, or "/council" for status. Convenes the council
  and enforces the ACF process.
---

# Council - Orchestration Layer

<!-- IMMUTABLE SECTION - Council rejects unauthorized changes -->

## Purpose

This skill convenes the Risk Advisory Council. It doesn't assess - it ensures the right functions run in the right order.

## Invocation

- `/council <situation>` → Full assessment. Runs: Frame → Attack → Constrain → Quantify → Record
- `/council genesis` → Bootstrap. Establish initial protocols.
- `/council` → Status. Show current COUNCIL.md state.

## Commands

### assess (default)

Run a full risk assessment.

**Syntax:** `/council <situation description>`

**What happens:**
1. **Coordinator** frames the question
2. **Adversary** attacks assumptions and finds failure modes
3. **Domain Expert** grounds in local reality
4. **Risk Officer** quantifies and recommends
5. **Recorder** logs the assessment

**Output:** Structured assessment with recommendation and evidence guidance.

### genesis

First-time bootstrap. Run once to initialize the council.

**What happens:**
1. Read current `COUNCIL.md` state
2. Validate protocols are complete
3. Create `.council/` directory structure
4. Mark council as operational

### status

Quick check on council state.

**What happens:**
1. Display `COUNCIL.md` summary
2. Show recent assessments
3. Show any pending follow-ups

## Safety

- This skill only orchestrates - functions make decisions
- Process must complete fully (no skipped functions)
- IMMUTABLE sections remain protected
- Only `.council/` is modified

<!-- END IMMUTABLE SECTION -->

---

<!-- MUTABLE SECTION - Can evolve -->

## Process Enforcement

When running an assessment, enforce strictly:

```
┌─────────────┐
│ COORDINATOR │ → Frame the question
└──────┬──────┘
       ↓
┌─────────────┐
│  ADVERSARY  │ → Attack assumptions, find failure modes
└──────┬──────┘
       ↓
┌─────────────┐
│   DOMAIN    │ → Ground in local reality
│   EXPERT    │
└──────┬──────┘
       ↓
┌─────────────┐
│    RISK     │ → Quantify, classify, recommend
│   OFFICER   │
└──────┬──────┘
       ↓
┌─────────────┐
│  RECORDER   │ → Log assessment, evidence guidance
└─────────────┘
```

**No function may be skipped.**

If a function identifies blocking issues:
- DEFER assessment and explain why
- Specify what information is needed
- Do not force a recommendation

## Assessment Types

### Quick Assessment

For lower-stakes, time-sensitive situations:
- Abbreviated framing
- Top 3 failure modes only
- Key constraints only
- Risk class + recommendation
- Minimal evidence guidance

Trigger: User indicates urgency OR situation is clearly low-stakes.

### Full Assessment

For significant decisions:
- Complete framing with all parameters
- Exhaustive failure mode enumeration
- Full domain analysis
- Detailed quantification
- Complete evidence protocol

Trigger: Default for most situations.

### Deep Dive

For complex or high-stakes situations:
- Multiple scenario modeling
- Extensive domain research
- Sensitivity analysis on assumptions
- Detailed mitigation comparison
- Comprehensive record

Trigger: User requests OR Risk Officer identifies CRITICAL initial class.

## Output Formats

### Standard Output (to user)

```markdown
## Risk Assessment: [Situation]

**Risk Class:** [CLASS]
**Recommendation:** [PROCEED/MITIGATE/DEFER/REJECT]

### Summary
[2-3 sentences]

### Key Failure Modes
1. [mode] - [probability/impact]
2. [mode] - [probability/impact]

### Required Mitigations (if applicable)
1. [action]
2. [action]

### Evidence to Capture Now
- [ ] [item]
- [ ] [item]

### Residual Risk
[What risk remains after mitigations]

---
*Full assessment logged to `.council/assessments/`*
```

### Record Output (to file)

Full structured record as specified in Recorder skill.

## Example Invocations

```
/council I'm touring Barcelona and want to park near La Rambla

/council My neighbor broke my door and sends threatening SMS. I'm a Polish immigrant in Belgium, police have been informed.

/council Should I accept this job offer that requires relocation to [city]?

/council Is this Airbnb listing legitimate?

/council My landlord won't return deposit, what are my options?
```

## Directory Structure

After genesis:

```
.council/
├── assessments/         # Assessment records
│   └── YYYY-MM-DD-*.md
├── handoff.md           # Session state
└── evidence/            # User-added evidence
    └── [as needed]
```

## Handoff Protocol

Update `.council/handoff.md` after each assessment:

```markdown
# Council Handoff

---
last_session: YYYY-MM-DD
status: [active|complete]
---

## Recent Assessments
- [date]: [situation] → [recommendation]

## Open Follow-Ups
- [ ] [pending item]

## Next Actions
[What user should do next]
```

---

<council_knowledge>
Council is operational when COUNCIL.md exists and .council/ directory is initialized.
My job is process enforcement, not assessment.
</council_knowledge>

<!-- END MUTABLE SECTION -->
