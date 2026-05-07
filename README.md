# CTI Financial Agents

A Claude Code / Claude.ai plugin that adds five investment-grade finance skills, complementing Anthropic's May 2026 Financial Agent Templates and the existing CTI `finance:` skill set.

## What's inside

| Skill | Anthropic template equivalent | Trigger phrases |
|---|---|---|
| `pitch-builder` | Pitch Builder | "build a pitch", "draft pitchbook", "comps for X" |
| `model-builder` | Model Builder | "build a model for X", "create a DCF", "3-statement model" |
| `earnings-reviewer` | Earnings Reviewer | "review X earnings", "Q3 X earnings call", "earnings transcript" |
| `kyc-screener` | KYC Screener | "KYC on X", "screen X for compliance", "AML check" |
| `valuation-reviewer` | Valuation Reviewer | "review this valuation", "validate the X valuation" |

The other 5 templates (Month-End Closer, Statement Auditor, GL Reconciler, Market Researcher, Meeting Preparer) are already covered by existing CTI plugin skills — see [FINANCIAL-AGENTS-INDEX.md](FINANCIAL-AGENTS-INDEX.md) for the full mapping.

## Install in Claude Code

```
/plugin install Robert-Upchurch/cti-financial-agents
```

Or from a local clone:

```
/plugin install ./
```

## Install in Claude.ai (web/desktop, Max plan)

1. Open Settings → Plugins / Skills
2. Add plugin from GitHub URL: `https://github.com/Robert-Upchurch/cti-financial-agents`
3. Enable each skill you want auto-routed

## How auto-invoke works

Claude scans every installed skill's `description:` field at the start of each turn. When your prompt matches the trigger phrases, the matching skill loads automatically — no need to call it by name.

## Updating

Edit any `SKILL.md`, push to `main`. Claude Code picks up changes on next session start. claude.ai picks up on its next plugin sync.

## Repo structure

```
cti-financial-agents/
├── .claude-plugin/
│   └── plugin.json              # plugin manifest
├── skills/
│   ├── pitch-builder/SKILL.md
│   ├── model-builder/SKILL.md
│   ├── earnings-reviewer/SKILL.md
│   ├── kyc-screener/SKILL.md
│   └── valuation-reviewer/SKILL.md
├── FINANCIAL-AGENTS-INDEX.md    # 10-template coverage map
├── Push-To-GitHub.bat           # one-click GitHub publish (local use)
├── README.md
└── .gitignore
```

## Author

Robert Upchurch — CEO, CTI Group Worldwide Services Inc. — `ceo@cti-usa.com`
