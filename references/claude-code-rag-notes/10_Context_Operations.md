---
id: claude-code-context-ops
title: セッション運用（/rename /resume /compact）のコツ
topic: context_ops
tags:
  - claude-code
  - sessions
  - compact
  - workflow
created_at: 2025-12-20
language: ja
---

# セッション運用（/rename /resume /compact）のコツ

## セッション命名（/rename）
- 早めに付ける：後で探すコストが激減
- 例：`payment-integration`, `receipt-scraper`, `security-hardening`

## 再開（--continue / --resume）
- 直近の続きは `--continue`
- セッション名が分かるなら `--resume session-name`
- 分からないなら `--resume` で一覧から選ぶ

## compact（自動/手動）を前提にする
- 長時間タスクは必ずコンテキストが膨らむ
- **PreCompact hook** を使うと「重要情報の退避/要約」を自動化できる
- compact前に：決定事項、未解決TODO、現在地、次アクションを残す
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Common workflows — https://code.claude.com/docs/en/common-workflows
- Hooks reference — https://code.claude.com/docs/en/hooks
- Status line configuration — https://code.claude.com/docs/en/statusline
```

### Community / Practitioner tips
```text
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
```

