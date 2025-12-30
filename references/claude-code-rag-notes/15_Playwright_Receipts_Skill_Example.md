---
id: claude-code-playwright-skill
title: 領収書取得（Playwright）をSkill化する例
topic: playwright_skill_example
tags:
  - claude-code
  - playwright
  - receipts
  - skill
created_at: 2025-12-20
language: ja
---

# 領収書取得（Playwright）をSkill化する例

## 目的
「サイトにログイン→期間指定→領収書DL→命名→保管」を“人が考えなくても回る型”にする。

## 推奨Skill構成
- `SKILL.md`
  - サイト一覧（URLは別ファイル）
  - ログイン方式（SSO/メール/2FA）
  - 取得対象（期間/ステータス）
  - DL後の命名規則（例：YYYYMM_vendor_amount.pdf）
  - 失敗時のリカバリ（リトライ、手動確認ポイント）
- `scripts/`
  - Playwrightスクリプト（サイト別）
- `templates/`
  - 依頼テンプレ（対象期間、アカウント、保存先）
- `checklists/`
  - 法令/監査要件（保存要件のメモ）

## Hooks連携（強い）
- PreToolUse：ログイン情報の扱い（平文出力禁止）
- PostToolUse：DLファイルの検証（サイズ0/拡張子/重複）
- Notification：完了時にSlack/メール通知（運用に合わせる）
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Agent Skills — https://code.claude.com/docs/en/skills
- Hooks guide — https://code.claude.com/docs/en/hooks-guide
- Claude Code を MCP 経由でツールに接続する（日本語） — https://code.claude.com/docs/ja/mcp
```

### Community / Practitioner tips
```text
- Customizing Claude Code: What I Learned from Losing Everything (ainativedev.io) — https://ainativedev.io/news/customizing-claude-code-what-i-learned-from-losing-everything
```

