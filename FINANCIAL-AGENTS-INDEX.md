# Financial Agents — Coverage Index

This is the master map of Anthropic's 10 May-2026 Financial Agent Templates against what's actually installed across CTI's Claude environment. When in doubt about which skill to invoke for a finance task, check here first.

## The 10 templates and their CTI coverage

| # | Anthropic Template | Status | Skill to invoke |
|---|---|---|---|
| 1 | **Pitch Builder** — target lists, comparables, pitchbooks | ✅ NEW | `pitch-builder` (this plugin) |
| 2 | **Model Builder** — 3-statement & DCF models from filings | ✅ NEW | `model-builder` (this plugin) |
| 3 | **Earnings Reviewer** — transcripts + filings → model updates | ✅ NEW | `earnings-reviewer` (this plugin) |
| 4 | **KYC Screener** — entity, BO, sanctions, PEP, adverse media | ✅ NEW | `kyc-screener` (this plugin) |
| 5 | **Month-End Closer** — close checklist + journal entries | ✅ Existing | `finance:close-management` + `finance:journal-entry` |
| 6 | **Statement Auditor** — audit-readiness review | ✅ Existing | `finance:audit-support` + `finance:financial-statements` |
| 7 | **GL Reconciler** — account reconciliations + NAV | ✅ Existing | `finance:reconciliation` |
| 8 | **Valuation Reviewer** — methodology + comp validation | ✅ NEW | `valuation-reviewer` (this plugin) |
| 9 | **Market Researcher** — news/research/filings → sector view | 🟡 Partial | `sales:account-research` (companies) — sector-level coverage gap |
| 10 | **Meeting Preparer** — pre-call briefing | ✅ Existing | `sales:call-prep` + `common-room:call-prep` + `common-room:weekly-prep-brief` |

## Adjacent skills that compose with the above

| Need | Skill |
|---|---|
| Spreadsheet output (models, comps, schedules) | `xlsx` |
| PowerPoint output (pitchbooks, IC decks) | `pptx` |
| PDF parsing (filings, KYC docs) | `pdf` |
| Word memos (valuation memos, IC memos) | `docx` |
| SOX testing & control deficiencies | `finance:sox-testing` |
| Variance analysis (budget vs actual) | `finance:variance-analysis` |
| Statistical analysis on financial data | `data:statistical-analysis` |
| Building a finance dashboard | `data:build-dashboard` |
| Vendor / counterparty contract checks | `legal:vendor-check` |
| Compliance review on a new initiative | `legal:compliance-check` |

## Workflow chains

### "Refresh our investment view on [Company X] after their Q3 print"
1. `earnings-reviewer` → analyze the transcript and 10-Q
2. `model-builder` → update the working model with new assumptions
3. `valuation-reviewer` → validate the updated valuation
4. `pitch-builder` → wrap into IC materials (if action recommended)

### "Onboard new client [Company Y]"
1. `kyc-screener` → run full CDD/BO/sanctions/PEP/adverse-media review
2. `legal:vendor-check` → verify contract status
3. `legal:compliance-check` → flag any regulatory issues for the relationship type

### "Month-end close for [period]"
1. `finance:close-management` → sequence the close calendar
2. `finance:journal-entry` → book accruals, prepaids, depreciation
3. `finance:reconciliation` → reconcile accounts to subledgers/banks
4. `finance:financial-statements` → generate IS/BS/CF
5. `finance:variance-analysis` → explain budget vs actual variances
6. `finance:audit-support` → prep workpapers for auditor review

### "Q[N] SOX testing cycle"
1. `finance:sox-testing` → sample selection + workpapers
2. `finance:audit-support` → escalate any deficiencies

### "Pitch [Target Z] to [Acquirer A]"
1. `pitch-builder` → comps + valuation + recommendation
2. `model-builder` → the working DCF/LBO model behind the deck
3. `valuation-reviewer` → QC before sending
4. `pptx` → deck output

## Gap to monitor

**Sector-level Market Researcher** — `sales:account-research` does company-level prospecting, not sector-level synthesis (multi-company news rollup, broker research aggregation, sector multiples tracking). If this becomes a recurring need, build a `market-researcher` skill in this plugin or wait for Anthropic's reference template.

---

Last updated: 2026-05-07
