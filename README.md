# Risk Advisory Council

**Signal-Driven Safety Council (SDSC) for adversarial risk assessment**

AI advisors that automatically detect personalization signals and provide evidence-based threat analysis.

## Architecture: Signal-Driven Safety Council

**Key principle:** Personalization is a **derived property**, not an input flag.

The council **automatically detects** hard signals in your situation and escalates to personalized mode when needed. You don't need to tell it you're worried - it detects the signals.

### Hard Signals (Any One Triggers Personalized Mode)

| Signal Type | Examples |
|-------------|----------|
| Age/Vulnerability | "55-year-old", "elderly parent", "my child" |
| Disability/Condition | "bad knee", "anxiety", "hearing impaired" |
| Phobia/Aversion | "don't like dogs", "afraid of heights" |
| Named Individual | "this guy", "my neighbor", "the landlord" |
| Behavioral Cues | "strange eye movements", "kept staring" |
| Prior Violation | "he's done this before", "second time" |
| Emotional Salience | "made me uneasy", "gut feeling" |

**Rule:** ANY hard signal → PERSONALIZED mode. No weighing. No thresholds.

## The Framework

### Generic Mode (no signals)
```
Coordinator → Adversary → Domain Expert → Risk Officer → Recorder
```

### Personalized Mode (signals detected)
```
Coordinator → Profiler → Adversary → Domain Expert → Risk Officer → Recorder
        ↓           ↓
   Signals      Constraints
   detected     derived
```

## Decision Rules

| Condition | Decision |
|-----------|----------|
| Single-point failure exists | **REJECT** - mitigation required |
| Legal ambiguity unresolved | **DEFER** - consult professional |
| Mitigation cost < expected loss | **MITIGATE** - take the action |
| Subjective fear + objective cue | **TREAT AS ACTIONABLE** - never dismiss |
| All mitigations exhausted | **ACCEPT RISK** - explicitly document |

## Behavioral Interpretation

When behavioral cues are detected, the Adversary Analyst provides **evidence-based ranked interpretations** with source citations:

| Interpretation | Likelihood | Source |
|----------------|------------|--------|
| Pre-attack info gathering | **LIKELY** | de Becker "Gift of Fear": boundary-testing pattern |
| Social impairment | **POSSIBLE** | ~1-2% population ASD prevalence |
| Intoxication | **POSSIBLE** | Affects social calibration |
| Benign curiosity | **UNLIKELY** | Persistence exceeds social norms |

**User decides final threat weight**, but LIKELY interpretations drive recommended posture.

## Examples

**Tourist safety (Generic mode):**
```
/council I'm touring Barcelona and want to park my rental car near La Rambla
```

**Personal vulnerability (Personalized mode auto-detected):**
```
/council I'm 55 and don't like dogs. Should I walk through the park?
→ Signals detected: Age, Phobia
→ Mode: PERSONALIZED
→ Profiler constraints applied
```

**Behavioral threat (Personalized mode auto-detected):**
```
/council A man at the bus stop had strange eye movements and kept asking where I live
→ Signals detected: Named individual, Behavioral cues, Boundary probing
→ Mode: PERSONALIZED
→ Evidence-based behavioral interpretations with sources
```

## Installation

### Quick Install

```bash
curl -sL https://raw.githubusercontent.com/HakAl/risk_advisory/master/install.sh | bash
```

### From Local Clone

```bash
git clone https://github.com/HakAl/risk_advisory.git
cd risk_advisory
./install.sh
```

### Initialize

```
/council genesis
```

## The Council

| Skill | Function | Output |
|-------|----------|--------|
| `council` | Orchestration | Convenes council, enforces SDSC process |
| `coordinator` | Extract & Frame | Signal extraction, risk mode, decision scope |
| `profiler` | Convert Signals | Personal constraints, invalidated generic advice |
| `adversary` | Analyze Threats | Ranked behavioral interpretations with sources |
| `domain-expert` | Reality Check | Local context, actual statistics |
| `risk-officer` | Quantify & Decide | Risk class, mitigations, recommendation |
| `recorder` | Immutable Log | Signals, interpretations, evidence |

## Risk Classification

| Class | When | Response |
|-------|------|----------|
| **CRITICAL** | High probability + High impact | Do not proceed without mitigation |
| **HIGH** | High prob + Moderate OR Moderate prob + High impact | Mitigate before proceeding |
| **MODERATE** | Moderate probability + Moderate impact | Mitigate if cost-effective |
| **LOW** | Low probability + Low-Moderate impact | Accept with awareness |
| **NEGLIGIBLE** | Very low probability + Low impact | Accept |

## Process Flow

### Generic Mode
```
┌─────────────┐
│ COORDINATOR │ → Extract signals (0 found) + Frame
└──────┬──────┘
       ↓
┌─────────────┐
│  ADVERSARY  │ → Attack assumptions, find failure modes
│   ANALYST   │
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
│  RECORDER   │ → Log assessment
└─────────────┘
```

### Personalized Mode
```
┌─────────────┐
│ COORDINATOR │ → Extract signals (1+ found) + Frame
└──────┬──────┘
       ↓
┌─────────────┐
│  PROFILER   │ → Convert signals to constraints
│             │   Invalidate generic advice
└──────┬──────┘
       ↓
┌─────────────┐
│  ADVERSARY  │ → Ranked behavioral interpretations
│   ANALYST   │   with sources (de Becker, FBI BAU, etc.)
└──────┬──────┘
       ↓
┌─────────────┐
│   DOMAIN    │ → Ground in reality + apply constraints
│   EXPERT    │
└──────┬──────┘
       ↓
┌─────────────┐
│    RISK     │ → Quantify with Profiler adjustments
│   OFFICER   │
└──────┬──────┘
       ↓
┌─────────────┐
│  RECORDER   │ → Log signals, constraints, interpretations
└─────────────┘
```

## Safety Rails

1. **Signal Extraction Mandatory** - Phase 0 cannot be skipped
2. **No Dismissal** - Subjective fear + objective cue = actionable
3. **Interpret, Don't Dismiss** - Provide rankings, never "probably nothing"
4. **User Decides** - Council provides interpretations, user assigns weight
5. **Record Everything** - Signals, interpretations, rationale logged
6. **Escalate Danger** - Immediate threats → emergency services

## Reference Sources

The Adversary Analyst cites established sources for behavioral interpretation:

- **de Becker, G. "The Gift of Fear"** - Pre-attack indicators, intuition validation
- **FBI Behavioral Analysis Unit** - Stalking patterns, escalation indicators
- **DOJ Statistics** - Base rates, stalking thresholds (3+ incidents)
- **APA DSM-5** - Prevalence rates for conditions affecting social behavior

## Structure

```
risk_advisory/
├── COUNCIL.md              # SDSC protocols and decision rules
├── .council/               # Working space
│   ├── assessments/        # Assessment records
│   ├── handoff.md          # Session state
│   └── evidence/           # User-added evidence
├── council/                # Orchestration
├── coordinator/            # Extract signals, frame
├── profiler/               # Convert signals to constraints
├── adversary/              # Ranked behavioral analysis
├── domain-expert/          # Local reality
├── risk-officer/           # Quantify and decide
└── recorder/               # Immutable log
```

## Philosophy

**Signal-driven, not flag-driven.** The system detects what mode it needs.

- **Automatic differentiation** - Signals drive mode, not user flags
- **Evidence-based interpretation** - Ranked with citations, not vibes
- **User decides weight** - Interpretations provided, user assigns threat level
- **Never dismiss** - LIKELY threatening + POSSIBLE benign = elevated posture
- **Record everything** - Future-you needs the evidence

## License

MIT License - see [LICENSE](LICENSE)

## Origins

Forked from [team_skills](https://github.com/HakAl/team_skills). This project applies adversarial deliberation to life risk assessment with automatic signal-driven personalization.
