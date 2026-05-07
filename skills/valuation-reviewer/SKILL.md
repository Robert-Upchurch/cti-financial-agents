---
name: valuation-reviewer
description: Validate valuations against methodology, comparable companies, and sensitivity bounds — DCF QC, comp-set defensibility, transaction-comp checks, fairness opinion review, mark-to-market validation, and IC sign-off prep. Trigger with "review this valuation", "validate the [company] valuation", "is this fair value", "check the comps for [company]", "DCF review", "fairness opinion check", "valuation second look", "mark review", or when a valuation is heading to IC, board, or auditor.
---

# Valuation Reviewer

Stress-test a valuation before it leaves the building. Check the methodology, the inputs, the comp set, the sensitivities, and the sign-off readiness. Output a graded review with explicit "ship / fix / kill" recommendation.

## When to use

- Pre-IC: a deal team is bringing a valuation to investment committee
- Pre-fairness opinion: validating a banker's work before the board signs
- Mark review: quarterly mark-to-market on a Level 2 / Level 3 position
- Post-deal: a portfolio company valuation needs revaluation after a milestone or filing
- Audit prep: prepping a valuation memo for the auditor's review

## Inputs needed (ask if missing)

1. **Valuation deliverable** — model file, memo, deck, or all three
2. **Methodology used** — DCF, trading comps, transaction comps, LBO floor, asset-based, sum-of-parts
3. **Use case** — IC, fairness opinion, mark, audit
4. **Comparison reference** — last valuation, third-party mark, recent transaction
5. **Sign-off context** — who needs to approve, by when

## Review framework

### 1. Methodology consistency
- Does the chosen method fit the business? (DCF requires forecastable cash flows; comps require true comparables; precedents require recent control transactions.)
- For most operating businesses: weight at least two of {DCF, trading comps, transaction comps}. Single-method valuations need a stated reason.
- For early-stage / pre-revenue: scorecard or comparable-financing methods, not DCF.
- For distressed: liquidation value floor required.

### 2. DCF deep-dive (if used)
- **Cash flow build:** Unlevered FCF defined consistently? Capex ties to D&A long-term? Working capital realistic vs. history?
- **Forecast horizon:** 5–10 years for most businesses. Less = thin. More = false precision unless you have visibility.
- **WACC:**
  - Risk-free rate: current, not stale
  - Beta: levered/unlevered conversion done right; private-company beta from a comp set, not assumed
  - Equity risk premium: sourced (Damodaran, Duff & Phelps, etc.), dated
  - Size premium: applied if applicable
  - Country risk premium: applied for non-US cash flows
- **Terminal value:**
  - Terminal growth ≤ long-run GDP growth of relevant geography (typically 2–3% for developed markets)
  - Terminal value as % of EV: should be ≤ 75%; if higher, extend forecast horizon
  - Cross-check terminal value with implied exit multiple — does it pass the sniff test?
- **Sensitivity table:** WACC × terminal growth, AND WACC × revenue growth, AND WACC × terminal margin

### 3. Comp set defensibility
For each comp: ask "would I exclude this if a banker challenged me?"
- **Inclusion criteria stated up front** — geography, size band, sub-sector, business model, ownership type
- **Comp-by-comp justification** — one line on why each is in
- **Excluded comps explicitly named** — and why excluded (this prevents cherry-picking accusations)
- **Stale data flags:** any comp with last filing >9 months old is stale
- **Outlier handling:** show median + mean + ex-outlier mean; explain outliers, don't silently drop

### 4. Transaction comp defensibility (if used)
- Lookback period stated (3–5 years standard; longer requires justification)
- Strategic vs. financial buyer split shown
- Control premium analysis if comparing to public trading comps
- Single-data-point transactions are weak — cluster of 3+ stronger
- Process type (auction vs. negotiated) noted — affects multiple

### 5. Sensitivity & scenarios
- Base / upside / downside, with explicit drivers, not arbitrary ±10%
- Two-variable sensitivity tables for the two highest-impact assumptions
- Tornado chart or equivalent showing relative impact of each input
- "What would have to be true" — for the upside and downside cases

### 6. Sign-off checklist
- All inputs sourced and dated
- Three methods (or stated reason for fewer)
- Sensitivity tables present
- Football field reconciles to recommended range
- Recommended value within (not at the edge of) the range
- Memo reads cleanly start-to-finish without the model

## Output structure

```
VALUATION REVIEW: [Asset / Company / Position]
Reviewer: [name] | Date: [date] | Use case: [IC / fairness / mark / audit]

OVERALL GRADE: [A / B / C / F]
RECOMMENDATION: [SHIP / FIX-AND-RESHIP / KILL-AND-REDO]

METHODOLOGY ASSESSMENT
[Strengths and gaps in method selection and weighting]

DCF REVIEW (if applicable)
- Cash flow build: [grade + notes]
- WACC: [grade + notes — flag stale rf, unsourced ERP, missing CRP]
- Terminal value: [grade + notes — TV % of EV, growth assumption, exit multiple cross-check]
- Sensitivity: [grade + notes]

COMP SET REVIEW
- Inclusion logic: [grade + notes]
- Stale data: [list any stale comps]
- Outlier handling: [grade + notes]
- Transaction comps: [grade + notes if applicable]

KEY ISSUES (ranked by materiality)
1. [Issue + impact + recommended fix]
2. [...]
3. [...]

MUST-FIX BEFORE SHIP
- [...]

NICE-TO-FIX
- [...]

FOOTBALL FIELD CHECK
- [Range presented]
- [Recommended value position within range]
- [Reasonableness call]
```

## Standards

- **Be the friend who tells you the truth.** A valuation review's job is to find what's wrong, not validate what's right.
- **Quantify the issue when you can.** "WACC is too low" is weak. "WACC is 8.2%; using a sourced beta of 1.15 vs. their 0.95 takes WACC to 9.1% and value down 12%" is useful.
- **Distinguish methodology errors from input errors.** Methodology errors require redo; input errors require update.
- **Stale > wrong.** Flag stale aggressively — a stale comp is worse than a wrong comp because no one notices.

## Anti-patterns

- Approving a valuation that lands exactly at the price the team wants — that's a flag, not an endorsement
- Letting a single-method valuation through without a stated reason
- Letting "industry standard" replace a sourced input
- Ignoring the football-field reconciliation — if the recommended value is outside the range, the range is wrong or the recommendation is wrong

## Adjacent CTI skills

- `model-builder` (this plugin) — to fix issues found in review
- `pitch-builder` (this plugin) — to wrap a clean valuation into materials
- `finance:audit-support` — for the SOX-side controls around the valuation
- `xlsx` — for building / fixing the working model
