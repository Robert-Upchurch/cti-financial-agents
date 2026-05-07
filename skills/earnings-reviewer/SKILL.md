---
name: earnings-reviewer
description: Analyze earnings transcripts, press releases, and SEC filings to extract guidance changes, segment performance, Q&A red flags, and model-impact recommendations. Trigger with "review [company] earnings", "Q[N] [year] earnings call", "what changed in [company]'s earnings", "earnings transcript analysis", "post-earnings update", "guidance change at [company]", or when a 10-Q / 10-K / 8-K just dropped on a tracked name.
---

# Earnings Reviewer

Read the print, the script, the Q&A, and the filing — then deliver: what changed, why it changed, what to update in the model, and what to flag for the IC or PM.

## When to use

- Quarterly earnings just dropped on a tracked name
- Pre-call prep before listening to the live conference call
- Post-call deep dive comparing what management said vs. what they filed
- Cross-comp read-through — what the print implies for peers

## Inputs needed (ask if missing)

1. **Ticker / company**
2. **Period** — Q1/Q2/Q3/Q4 + fiscal year
3. **Materials available** — press release, transcript, 10-Q/10-K, slide deck, model
4. **What you care about** — guidance, margins, capital allocation, specific segment, named risk

## Analysis framework

### 1. The print (15 min)
- Beat/miss vs. consensus on revenue, EBITDA, EPS — quantify the surprise %
- Segment-level beats/misses if disclosed
- Guidance: raised / maintained / lowered / withdrawn — quote the exact words
- One-time items: pull them out, restate to clean

### 2. The script — prepared remarks (20 min)
- Strategic priorities — new ones? dropped ones?
- Tone shifts — language about demand, pricing, customers, supply chain
- Capital allocation signals — buyback pace, M&A appetite, dividend, capex change
- Named competitors or customers — and what was said
- Word-frequency anomalies (e.g., "macro" mentions tripled vs. last quarter — flag)

### 3. The Q&A (30 min) — where the truth comes out
- Which analysts asked the hard questions, and how management dodged
- "We're not going to comment on that" → flag as known-unknown
- Inconsistencies between prepared remarks and Q&A answers
- New disclosures the script didn't cover
- Tone of management — defensive, confident, evasive

### 4. The filing (30–45 min)
- Diff vs. prior period — risk factors changed? Critical accounting estimates? Going concern?
- Footnotes: revenue recognition, contingencies, related-party, subsequent events
- Segment data tables — confirm what management said in the script
- Cash flow statement — does FCF actually support the EBITDA story?
- MD&A — does management's own narrative match what they told analysts?

### 5. Cross-check
- Compare to peers' recent prints — read-through implications
- Compare to your own model assumptions — what needs updating
- Compare management commentary to prior-period commentary on the same topics

## Output structure

```
EARNINGS REVIEW: [TICKER] [Q#] [YEAR]
Filed: [date] | Call: [date] | Reviewed: [date]

HEADLINE
[2 sentences: what happened and why it matters]

THE NUMBERS
- Revenue: $X.Xb (vs. $X.Xb consensus, +/-X%)
- Adj EBITDA: $X.Xb (vs. $X.Xb consensus, +/-X%, X% margin vs. X% LY)
- EPS: $X.XX (vs. $X.XX consensus, +/-X%)
- FCF: $X.Xb (LTM $X.Xb, X% conversion)

GUIDANCE
[Old → New, with management's stated reason]

WHAT CHANGED (3–5 bullets, ranked by materiality)

WHAT TO UPDATE IN THE MODEL
- Revenue: [specific assumption + new value + rationale]
- Margin: [...]
- Capex: [...]
- Other: [...]

RED FLAGS / OPEN QUESTIONS
- [Anything management didn't answer]
- [Inconsistencies]
- [Items requiring follow-up]

READ-THROUGHS
- [Peer 1]: [implication]
- [Peer 2]: [implication]

RECOMMENDATION
[Hold rating / change estimates / increase position / trim / no action — with one-line why]
```

## Standards

- **Quote, don't paraphrase, on guidance.** Exact language matters when guidance is the trade.
- **Always restate to clean.** Strip out one-times and show the recurring run-rate.
- **Distinguish what management said from what's in the filing.** They diverge more than you'd expect.
- **Flag what's missing.** If they used to disclose unit economics and stopped, that's a story.

## Anti-patterns

- Reporting beat/miss without the consensus source and date stamp
- Treating segment commentary as fact without reconciling to the segment table in the 10-Q
- Skipping the Q&A — that's where the analysts already did the hard work for you
- Updating the model from the press release before the 10-Q drops (the 10-Q usually corrects the spin)

## Adjacent CTI skills

- `model-builder` (this plugin) — to update the working model after the review
- `valuation-reviewer` (this plugin) — to revalue after estimates change
- `pdf` — for parsing the filing PDF
- `data:analyze` — for cross-comp time series
