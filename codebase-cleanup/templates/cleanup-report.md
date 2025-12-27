# Codebase Cleanup Report

**Generated**: [Date]
**Scope**: [Full codebase / specific directories analyzed]
**Domain**: [e.g., E-commerce web application]
**Analyzed by**: Claude Code - Codebase Cleanup Skill

---

## Health Score

| Metric | Score | Notes |
|--------|-------|-------|
| **Overall Health** | 🟡 / 10 | [Brief assessment] |
| Security | X/10 | [Notes] |
| Code Quality | X/10 | [Notes] |
| Test Coverage | X/10 | [Notes] |
| Maintainability | X/10 | [Notes] |

---

## Executive Summary

[2-4 sentences describing the overall state of the codebase, key strengths, and main concerns]

### Top Priorities

1. **[Critical Issue]** - [One line description] - `file:line`
2. **[High Priority]** - [One line description] - `file:line`
3. **[High Priority]** - [One line description] - `file:line`

---

## Findings by Priority

### 🔴 Critical (P0) - Fix Immediately

> Issues that pose security risks, could cause data loss, or break critical functionality

#### [C-001] [Issue Title]

**Category**: Security | Incomplete | Domain-Critical
**Location**: `src/auth/login.ts:45-52`
**Risk**: [What bad thing could happen]

**Finding**:
```typescript
// Problematic code snippet
const password = req.body.password; // Stored in plain text
```

[Explanation of why this is a problem]

**Recommendation**:
```typescript
// Fixed code
const hashedPassword = await bcrypt.hash(req.body.password, 12);
```

**Effort**: 🟢 Small | 🟡 Medium | 🔴 Large
**Blocking**: [Yes/No - does this block other work?]

---

### 🟠 High Priority (P1) - Fix Soon

> Issues that will likely cause bugs, significant tech debt, or incomplete features

#### [H-001] [Issue Title]

**Category**: [Category]
**Location**: `path/to/file.ts:123`
**Impact**: [What problems this causes]

**Finding**:
[Description with code if relevant]

**Recommendation**:
[Specific fix]

**Effort**: 🟢 Small | 🟡 Medium | 🔴 Large

---

### 🟡 Medium Priority (P2) - Plan to Fix

> Code quality issues, missing tests, maintainability concerns

#### [M-001] [Issue Title]

**Category**: [Category]
**Location**: `path/to/file.ts:123`

**Finding**:
[Description]

**Recommendation**:
[Fix approach]

**Effort**: 🟢 Small | 🟡 Medium | 🔴 Large

---

### 🟢 Low Priority (P3) - Nice to Have

> Style inconsistencies, minor improvements, cleanup opportunities

| ID | Issue | Location | Category | Effort |
|----|-------|----------|----------|--------|
| L-001 | [Brief description] | `file:line` | Style | 🟢 |
| L-002 | [Brief description] | `file:line` | Cleanup | 🟢 |
| L-003 | [Brief description] | `file:line` | Consistency | 🟡 |

---

## Findings by Category

### Dead Code & Unused Exports

| ID | Description | Location | Priority |
|----|-------------|----------|----------|
| | | | |

### TODO/FIXME Comments

| ID | Comment | Location | Age | Priority |
|----|---------|----------|-----|----------|
| | | | | |

### Duplicate Code

| ID | Description | Files Involved | Priority |
|----|-------------|----------------|----------|
| | | | |

### Incomplete Implementations

| ID | Description | Location | Priority |
|----|-------------|----------|----------|
| | | | |

### Security Issues

| ID | Vulnerability | Location | OWASP Category | Priority |
|----|---------------|----------|----------------|----------|
| | | | | |

### Complexity Hotspots

| File | Lines | Issues | Priority |
|------|-------|--------|----------|
| | | | |

### Inconsistent Patterns

| ID | Pattern A | Pattern B | Recommendation | Priority |
|----|-----------|-----------|----------------|----------|
| | | | | |

### Missing Tests

| File/Feature | Risk Level | Priority |
|--------------|------------|----------|
| | | |

### Dependency Issues

| Package | Issue | Current | Recommended | Priority |
|---------|-------|---------|-------------|----------|
| | | | | |

### Domain-Specific Issues

| ID | Issue | Domain Risk | Location | Priority |
|----|-------|-------------|----------|----------|
| | | | | |

---

## Metrics Summary

| Category | Total | P0 | P1 | P2 | P3 |
|----------|-------|----|----|----|----|
| Dead Code | | | | | |
| TODOs/FIXMEs | | | | | |
| Duplicate Code | | | | | |
| Incomplete | | | | | |
| Security | | | | | |
| Complexity | | | | | |
| Inconsistency | | | | | |
| Missing Tests | | | | | |
| Dependencies | | | | | |
| Domain Issues | | | | | |
| **TOTAL** | | | | | |

---

## Recommended Cleanup Order

Suggested sequence for addressing findings:

### Phase 1: Critical & Quick Wins (Do First)
- [ ] [C-XXX] [Issue] - [Why first]
- [ ] [H-XXX] [Issue] - [Why now]

### Phase 2: Security Hardening
- [ ] [Issue] - [Brief description]

### Phase 3: Stability Improvements
- [ ] [Issue] - [Brief description]

### Phase 4: Code Quality
- [ ] [Issue] - [Brief description]

### Phase 5: Maintenance & Polish
- [ ] [Issue] - [Brief description]

---

## Intentionally Ignored

Items reviewed but not flagged (for transparency):

| Item | Reason Ignored |
|------|----------------|
| [Thing] | [Intentional design decision / Out of scope / etc] |

---

## Next Steps

1. **Review this report** - Confirm priorities match your concerns
2. **Flag false positives** - Tell me what's intentional
3. **Create cleanup plan** - I can convert these to actionable tasks
4. **Track progress** - Use this as a checklist

---

*Report generated by Claude Code Codebase Cleanup Skill*
