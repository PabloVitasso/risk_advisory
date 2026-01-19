# Risk Advisory Council

**Adversarial risk assessment for life situations**

AI advisors that challenge each other so you make safer decisions.

## The Framework

**Frame → Attack → Constrain → Decide → Record**

Instead of "is this safe?", run a structured assessment:

1. **Coordinator** frames the question clearly
2. **Adversary** attacks assumptions and finds failure modes
3. **Domain Expert** grounds in local reality
4. **Risk Officer** quantifies and recommends
5. **Recorder** logs everything for future reference

Give them a situation, watch them deliberate, make informed decisions.

## Decision Rules

The council operates by explicit rules, not vibes:

| Condition | Decision |
|-----------|----------|
| Single-point failure exists | **REJECT** - mitigation required |
| Legal ambiguity unresolved | **DEFER** - consult professional |
| Mitigation cost < expected loss | **MITIGATE** - take the action |
| All mitigations exhausted | **ACCEPT RISK** - explicitly document |

## Examples

**Tourist safety:**
```
/council I'm touring Barcelona and want to park my rental car near La Rambla for 2 hours
```

**Neighbor conflict:**
```
/council I'm a Polish immigrant in Belgium. My neighbor broke my door and sends threatening SMS. Police have been informed. What safety measures should I take?
```

**Housing decision:**
```
/council Should I rent this apartment? The landlord wants 3 months deposit in cash.
```

## Installation

### Quick Install

```bash
curl -sL https://raw.githubusercontent.com/HakAl/risk_advisory/master/install.sh | bash
```

### Manual Install

```bash
git clone https://github.com/HakAl/risk_advisory.git
cp -r risk_advisory/{council,coordinator,adversary,domain-expert,risk-officer,recorder,COUNCIL.md} ~/.claude/skills/
```

### Initialize

In Claude Code:

```
/council genesis
```

## The Council

| Function | Mandate | Output |
|----------|---------|--------|
| **Coordinator** | Frame question, enforce process | Clear decision scope |
| **Adversary** | Invalidate the plan | Failure modes, attack vectors |
| **Domain Expert** | Reality check | Contextual constraints, local factors |
| **Risk Officer** | Quantify downside | Risk class + mitigations |
| **Recorder** | Immutable log | Evidence + rationale |

## Risk Classification

| Class | When | Response |
|-------|------|----------|
| **CRITICAL** | High probability + High impact | Do not proceed without mitigation |
| **HIGH** | High prob + Moderate OR Moderate prob + High impact | Mitigate before proceeding |
| **MODERATE** | Moderate probability + Moderate impact | Mitigate if cost-effective |
| **LOW** | Low probability + Low-Moderate impact | Accept with awareness |
| **NEGLIGIBLE** | Very low probability + Low impact | Accept |

## Quick Reference

| Command | What Happens |
|---------|--------------|
| `/council <situation>` | Full assessment |
| `/council genesis` | Initialize council |
| `/council` | Show status |

### Direct Invocations

```
"Coordinator, frame this situation"  → Structure the question
"Adversary, attack this plan"        → Find failure modes
"Domain Expert, ground this"         → Local reality check
"Risk Officer, quantify this"        → Risk classification
"Recorder, log this assessment"      → Create record
```

## Process Flow

```
┌─────────────┐
│ COORDINATOR │ → Frame: What's the specific decision?
└──────┬──────┘
       ↓
┌─────────────┐
│  ADVERSARY  │ → Attack: How could each assumption be wrong?
└──────┬──────┘
       ↓
┌─────────────┐
│   DOMAIN    │ → Constrain: What local factors apply?
│   EXPERT    │
└──────┬──────┘
       ↓
┌─────────────┐
│    RISK     │ → Decide: What's the probability × impact?
│   OFFICER   │
└──────┬──────┘
       ↓
┌─────────────┐
│  RECORDER   │ → Record: What evidence is needed?
└─────────────┘
```

**No function may be skipped.** No deliberation without attack. No decision without constraints.

## Safety Rails

1. **No Skipping** - Every function must contribute
2. **Consensus Before Action** - All voices heard before recommendation
3. **User Decides** - Council advises, user acts
4. **Record Everything** - Assessments are immutable records
5. **Escalate Danger** - Immediate threats → emergency services, not assessment

## When Council Stops and Asks

- Immediate physical danger (call emergency services)
- Legal complexity requiring professional advice
- Insufficient information to assess
- User asking council to validate clearly dangerous action

## Structure

```
risk_advisory/
├── COUNCIL.md              # Council protocols and decision rules
├── .council/               # Working space
│   ├── assessments/        # Assessment records
│   ├── handoff.md          # Session state
│   └── evidence/           # User-added evidence
├── council/                # Orchestration skill
├── coordinator/            # Frame & process
├── adversary/              # Attack & invalidate
├── domain-expert/          # Reality check
├── risk-officer/           # Quantify & decide
└── recorder/               # Log & evidence
```

## Philosophy

This isn't roleplay. It's a **decision system**.

- **Functions, not personas** - Clear outputs, not character acting
- **Process, not deliberation** - Structure beats discussion
- **Quantify, not opine** - Numbers beat feelings
- **Record, not forget** - Future-you needs this evidence

## Example Output

```markdown
## Risk Assessment: Barcelona Parking

**Risk Class:** HIGH
**Recommendation:** MITIGATE

### Summary
Street parking near La Rambla with rental car presents HIGH risk due to
tourist-targeting theft. Mitigation cost (€15 guarded parking) is far
below expected loss (€200-2000 + disruption).

### Key Failure Modes
1. Smash-and-grab theft - HIGH probability, MODERATE impact
2. Insurance claim denial - MODERATE probability, HIGH impact

### Required Mitigations
1. Use guarded parking (€15/2hr, 5min walk)
2. Remove all valuables from vehicle

### Evidence to Capture Now
- [ ] Photo of car condition before parking
- [ ] Screenshot of parking location
- [ ] Rental agreement with insurance details

### Residual Risk
LOW - Guarded lots have rare but non-zero incidents. Acceptable.
```

## License

MIT License - see [LICENSE](LICENSE)

## Origins

Forked from [team_skills](https://github.com/HakAl/team_skills) - a multi-persona framework for software development. This project applies the same adversarial deliberation pattern to life risk assessment.
