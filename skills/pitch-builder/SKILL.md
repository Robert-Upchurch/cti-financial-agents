---
name: pitch-builder
description: Generate investment banking pitchbooks — target lists, comparable company analysis, valuation summaries, and recommendation slides. Trigger with "build a pitch", "draft pitchbook", "comps for [company]", "M&A targets for [sector]", "pitch deck for [meeting]", "buyside list", "sellside list", or when assembling materials for a banker meeting, board pitch, or strategic review.
---

# Pitch Builder

Build a defensible pitchbook from a single sector or target prompt. Output is structured for banker review — every claim traces to a source, every comp set is justified, every valuation has a sensitivity range.

## When to use

- A banker, sponsor, or strategic acquirer needs materials for a client meeting
- Internal corp dev is screening targets for an acquisition
- Board needs a strategic options review for a sector or business unit
- Refresh of an existing pitchbook with updated market data

## Inputs needed (ask if missing)

1. **Target or sector** — single company, sector, or thematic angle
2. **Audience** — banker, sponsor, board, internal corp dev (changes tone)
3. **Side** — buyside, sellside, or strategic review
4. **Pitch context** — first meeting, follow-up, RFP, fairness opinion
5. **Deadline** — drives depth vs. speed tradeoff

## Workflow

### 1. Situation framing (1 page)
- One-sentence "why now" — market dislocation, regulatory change, capital event
- Stakeholder map — who decides, who influences, who blocks
- Constraints — antitrust, sector caps, regulatory approvals

### 2. Target / comp universe (2–3 pages)
- Universe definition — geography, size band, sub-sector, ownership type
- Long list (30–50) → short list (8–12) with selection logic visible
- Each comp: ticker, market cap, EV, LTM revenue, LTM EBITDA, growth %, margin %, multiples (EV/Rev, EV/EBITDA, P/E)
- Source-tag every cell — filing, press release, or data feed

### 3. Trading & transaction comps (2 pages)
- Trading comps: median + mean + low/high; show outliers and explain
- Transaction comps: 3–5 year lookback, control premium analysis, strategic vs financial buyer split
- Multiple build: forward vs trailing, calendarized

### 4. Valuation summary (1 page)
- Football field chart: trading comps, transaction comps, DCF, LBO floor, 52-week range, analyst targets
- Implied equity value range with central case bolded
- Premium/discount to current trading price

### 5. Recommendation (1 page)
- Recommended action — proceed / wait / restructure
- Process design — auction vs negotiated, timing, key gating items
- Next steps with owners and dates

## Deliverables

Default output: structured markdown the user can paste into Word/PowerPoint, OR a `.pptx` if the `pptx` skill is available, OR an `.xlsx` working model if the `xlsx` skill is available. Ask which.

## Standards

- **No claim without a source.** Every multiple, every premium, every "industry leader" assertion needs an inline citation.
- **Show your selection logic.** If you cut a comp, say why in one line.
- **Football field over point estimate.** A range with explicit drivers beats a single number every time.
- **Sensitivity, always.** ±10% on the two most-impactful assumptions, minimum.
- **Banker red flags to flag explicitly:** stale comps (>9 months), single-data-point transaction comps, DCF terminal value >75% of EV, hand-waved synergies.

## Anti-patterns

- Don't pad the comp set to hit a number — defending 8 strong comps beats listing 30 weak ones.
- Don't use trailing multiples in a high-growth sector — forward only, with named source.
- Don't recommend an action you can't defend at Q&A. If gating items are unresolved, say "proceed contingent on X, Y, Z."

## Adjacent CTI skills

- `xlsx` — for working comp models and DCFs
- `pptx` — for the pitchbook deck
- `model-builder` (this plugin) — for the full DCF / 3-statement model behind the valuation
- `valuation-reviewer` (this plugin) — to QC the pitchbook before sending
