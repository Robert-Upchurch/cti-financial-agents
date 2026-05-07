---
name: kyc-screener
description: Automate Know Your Customer / Customer Due Diligence (KYC/CDD) compliance reviews — entity verification, beneficial ownership extraction, sanctions/PEP/adverse-media screening, document-quality grading, and risk classification. Trigger with "KYC on [entity]", "screen [entity] for compliance", "ownership structure of [entity]", "AML check on [entity]", "CDD review", "EDD review", "onboarding review for [client]", "sanctions screen", "beneficial owner check".
---

# KYC Screener

Run a defensible KYC/CDD review on a new or refreshed counterparty. Output is a risk-rated dossier ready for the BSA/AML officer or compliance committee — every check documented, every red flag flagged, every gap named.

## When to use

- New client onboarding (corporate, partnership, fund, trust)
- Periodic refresh (typically annual or risk-based — high-risk every 12 months, standard every 24–36)
- Trigger event refresh (ownership change, sanctions update, adverse media hit, transaction pattern change)
- Vendor / counterparty due diligence on a new commercial relationship

## Inputs needed (ask if missing)

1. **Entity legal name + jurisdiction of formation**
2. **Entity type** — corp, LLC, LP, trust, foundation, NGO
3. **Documents available** — formation docs, certificate of good standing, ownership chart, financials, IDs of beneficial owners
4. **Relationship type** — client, vendor, counterparty, JV partner
5. **Risk appetite** — your firm's tolerance (conservative / standard / risk-on)
6. **Jurisdiction risk** — countries of operation (FATF gray/black list?)

## Workflow

### 1. Entity verification
- Confirm legal name matches registered name (state of formation registry)
- Pull formation date, current good-standing status, registered agent
- Note any name changes / mergers / dissolutions in entity history
- If foreign entity: verify with home-jurisdiction registry equivalent

### 2. Beneficial ownership (BO) extraction
- Walk the ownership chart down to natural persons holding ≥25% (FinCEN CTA standard) — or the threshold required by your jurisdiction
- For each BO: full legal name, DOB, residential address, citizenship, government ID
- Identify control persons (CEO/President/Managing Member) even if <25% owners
- Flag any layered structures, nominee arrangements, bearer shares
- Map any beneficial owner who is also a PEP or who appears in a sanctioned jurisdiction

### 3. Sanctions screening
- OFAC SDN list (US)
- OFAC Sectoral Sanctions Identifications (SSI)
- EU Consolidated Sanctions List
- UK HMT / OFSI list
- UN Security Council Consolidated List
- Country-of-formation specific lists (HKMA, MAS, etc.)
- Screen entity name + every BO + every control person
- Document fuzzy-match score, false positives, and resolution notes

### 4. PEP screening
- Domestic and foreign PEPs (current and former)
- Family members and close associates of PEPs
- For PEP hits: source-of-wealth and source-of-funds documentation required
- Auto-classify as Enhanced Due Diligence (EDD) if any PEP found

### 5. Adverse media screening
- Negative news search across major outlets (3-year lookback minimum)
- Categories to flag: financial crime, fraud, corruption, sanctions evasion, terrorism financing, narcotics, human trafficking, environmental crime
- Source the article, date it, summarize in one line
- Distinguish allegation vs. charge vs. conviction

### 6. Document quality grading
For each document submitted, grade A/B/C/F:
- **A:** Original or certified copy, current, fully legible, fully consistent
- **B:** Photocopy or scan, current, legible, consistent
- **C:** Stale (>12 months), partially legible, minor inconsistency — request refresh
- **F:** Inconsistent, illegible, expired, or possibly altered — REJECT and escalate

### 7. Risk classification
Assign overall risk: **Low / Medium / High / Prohibited**
- Drivers: jurisdiction, entity type, BO geography, PEP exposure, sanctions proximity, adverse media, transaction pattern, source-of-wealth clarity
- Document each driver's contribution
- Recommend ongoing monitoring frequency:
  - Low: 36-month refresh
  - Medium: 24-month refresh + annual screening
  - High: 12-month refresh + quarterly screening + transaction monitoring escalation
  - Prohibited: do not onboard / exit existing relationship per legal review

## Output structure

```
KYC DOSSIER: [Entity Legal Name]
Reviewed: [date] | Reviewer: [name] | Refresh due: [date]

ENTITY SUMMARY
- Legal name, type, jurisdiction, formation date, good standing
- Registered address, principal place of business
- Industry / NAICS

BENEFICIAL OWNERSHIP
[Table or chart: BO name | % | role | citizenship | PEP? | sanctions? ]

SCREENING RESULTS
- Sanctions: [hit/no hit, lists checked, date]
- PEP: [hit/no hit, details]
- Adverse media: [hits with sources or "none material"]

DOCUMENT INVENTORY
[Table: doc | grade | gaps | action ]

RISK CLASSIFICATION: [LOW / MEDIUM / HIGH / PROHIBITED]
Drivers:
- [driver 1, weight, evidence]
- [driver 2, weight, evidence]

RECOMMENDATION
- Onboarding decision: APPROVE / APPROVE WITH CONDITIONS / DECLINE / ESCALATE TO COMMITTEE
- Conditions (if any): [...]
- Ongoing monitoring: [frequency + triggers]

OPEN ITEMS
- [Document gap 1]
- [Question for client 1]
```

## Standards

- **Document everything you check, even when the result is clean.** A clean SDN screen with no record is not the same as no SDN screen.
- **Source-of-wealth ≠ source-of-funds.** PEPs require both, separately documented.
- **Don't infer structure — read it.** If the org chart isn't provided, request it. Don't reconstruct from financials.
- **Layered structures are red flags by default.** Each layer needs a business-purpose justification.
- **Bearer shares and nominee directors should be treated as Prohibited unless there's a specific carve-out.**

## What NOT to do

- Don't auto-approve based on a clean sanctions hit alone — sanctions is one of seven dimensions
- Don't accept "we'll get you that document later" for a Medium or High risk entity — get it before approving
- Don't downgrade risk to fit a desired outcome — escalate instead
- Don't omit adverse media because it's "old news" — date it and let the committee weigh it

## Adjacent CTI skills

- `legal:vendor-check` — for the contract side of vendor onboarding
- `legal:compliance-check` — for regulatory questions on a specific industry
- `pdf` — for parsing formation docs and IDs
- `operations:compliance-tracking` — for ongoing monitoring cadence

## Regulatory anchors (US-centric — adapt by jurisdiction)

- FinCEN CDD Final Rule (31 CFR 1010.230)
- FinCEN Corporate Transparency Act (CTA) beneficial ownership reporting
- Bank Secrecy Act (BSA) program requirements
- USA PATRIOT Act §326 (CIP)
- OFAC sanctions program — strict liability
