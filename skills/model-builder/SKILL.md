---
name: model-builder
description: Build and maintain financial models from filings and data feeds — 3-statement models, DCF valuations, LBO models, operating models, and budget/forecast workbooks. Trigger with "build a model for [company]", "create a DCF", "3-statement model", "LBO model", "operating model", "budget model", "update the model with the latest filing", or when sourcing financial projections from 10-K/10-Q/8-K data.
---

# Model Builder

Construct financial models that survive auditor and committee review. Every cell is either a hardcoded input (color-coded), a formula (no hardcodes inside formulas), or a check. Every input traces to a named source.

## When to use

- New investment, M&A target, or portfolio company needs a working model
- Refresh after a 10-Q, 10-K, or 8-K filing
- Budget vs. forecast cycle (annual planning, quarterly reforecast)
- Sensitivity / scenario request from IC, board, or lender

## Inputs needed (ask if missing)

1. **Company / ticker / private name**
2. **Model type** — 3-statement, DCF, LBO, operating, budget, merger
3. **Time horizon** — historical years + forecast years (default: 3H + 5F)
4. **Data sources available** — SEC filings, internal P&L, data feed (Bloomberg/CapIQ/FactSet)
5. **Currency / units** — USD millions default
6. **Scenarios required** — base / upside / downside, default 3

## Architecture standards

### Color & cell convention
- **Blue font** = hardcoded input
- **Black font** = formula
- **Green font** = link to another sheet
- **Red font** = external link (avoid)
- **Yellow fill** = sensitivity / toggle cell
- No hardcodes inside formulas. Ever. Inputs go on an `Inputs` tab.

### Sheet structure
1. `Cover` — model purpose, version, author, last refresh date
2. `Inputs` — all assumptions, color-coded, sourced
3. `IS` — income statement (historical + forecast)
4. `BS` — balance sheet (must balance — checksum row)
5. `CF` — cash flow (indirect method, ties to BS change in cash)
6. `WC` — working capital schedule
7. `Debt` — debt schedule with interest calc and revolver sweep
8. `DCF` — discounted cash flow (if requested)
9. `Comps` — trading & transaction comps (if valuation included)
10. `Output` — summary dashboard
11. `Checks` — balance check, cash flow tie-out, sanity bounds

### Source-tagging
Every input cell has a comment with: `[Source: 10-K FY2025 p.47] [Pulled: 2026-04-29]`. Refresh the timestamp when you update.

## Workflow

### 1. Gather and normalize historicals
- Pull 3 years of audited financials minimum
- Reclass to standard schema (don't trust the company's presentation)
- Flag any restatements or accounting changes — note them on Inputs tab

### 2. Build the operating model (forecast)
- Revenue: build by segment / product / geography depending on disclosure
- COGS & opex: variable vs fixed split where data supports
- D&A: tied to capex schedule
- Working capital: DSO / DIO / DPO ratios, not absolute dollars

### 3. Capital structure
- Debt schedule: existing tranches, maturity ladder, mandatory amortization, revolver
- Interest: average balance method, not period-end
- Equity: assume no buyback/issuance unless explicitly modeled

### 4. DCF (if requested)
- Unlevered FCF = EBIT(1-t) + D&A – Capex – ΔWC
- WACC: build with explicit beta source, market risk premium, size premium
- Terminal value: Gordon growth AND exit multiple, show both
- Terminal value should be < 75% of enterprise value — if not, extend explicit forecast

### 5. Build the checks
- BS balance: |Assets – L&E| < $1
- CF tie: Δ Cash on BS = Net change in cash on CF
- Sanity: revenue growth not >50% without explanation; margin not changing >500bps without driver
- Circular reference flag (interest on revolver typically creates one — handle with iterative calc, document in Cover)

## Deliverables

Default: `.xlsx` workbook via the `xlsx` skill. If asked for a memo: a 2-page write-up of assumptions, output, and key sensitivities.

## Standards

- **Sensitivity tables for two key drivers minimum.** Usually growth rate × margin, or WACC × terminal growth.
- **Three scenarios baked in.** Toggle on Inputs tab — base/upside/downside switch flows through the whole model.
- **No "plug" cells.** If something doesn't tie, find the cause. Don't paper over it with a balancing entry.
- **Version stamp on Cover.** v1.0 / v1.1 / etc. Don't overwrite — save a new file.

## Anti-patterns

- Building the IS without the BS — you'll miss working capital and debt feedback
- DCF with single point estimates — useless without sensitivity
- Linking to external workbooks — breaks on email
- Hidden tabs with "scratch work" — clean up before sending

## Adjacent CTI skills

- `xlsx` — the engine for all spreadsheet output
- `pitch-builder` (this plugin) — wraps the model output into a pitchbook
- `valuation-reviewer` (this plugin) — checks the model before it goes external
- `earnings-reviewer` (this plugin) — the trigger to refresh the model after a filing
