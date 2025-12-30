---
id: claude-code-slack-routing
title: Slack窓口での運用アイデア（受付→実行→PR）
topic: slack
tags:
  - claude-code
  - slack
  - ops
  - workflow
created_at: 2025-12-20
language: ja
---

# Slack窓口での運用アイデア（受付→実行→PR）

## 目的
「依頼はSlackで受ける、実行はClaude Code（Web/Actions）で行い、結果はPRで返す」を標準化すると、
- 依頼のログが残る
- 実装の監査がPRに残る
- 依頼→完了までが追跡可能

## 型（例）
1) Slack: 依頼テンプレ（目的/背景/受け入れ条件/期限/優先度）  
2) 自動: Issue化（label付け）  
3) Actions: `@claude` で実装/修正  
4) Slack: PRリンクを返す（レビュー依頼）

## コツ
- Slack依頼テンプレは“受け入れ条件”を必須にする
- 重要作業は「人間レビュー必須」の導線を強制
- PR説明はCLAUDE.mdで固定テンプレ化
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Claude Code GitHub Actions（日本語） — https://code.claude.com/docs/ja/github-actions
- ウェブ上のClaude Code（日本語） — https://code.claude.com/docs/ja/claude-code-on-the-web
- Claude Code: Best practices for agentic coding — https://www.anthropic.com/engineering/claude-code-best-practices
```

