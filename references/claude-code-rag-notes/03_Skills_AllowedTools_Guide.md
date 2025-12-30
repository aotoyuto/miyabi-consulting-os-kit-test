---
id: claude-code-permissions
title: Allowed tools / 権限設計ガイド
topic: skills_security
tags:
  - claude-code
  - security
  - permissions
  - allowed-tools
  - hooks
created_at: 2025-12-20
language: ja
---

# Allowed tools / 権限設計ガイド

## なぜ最初に権限設計が要るか
Claude Codeは“実行”までできるので、権限が曖昧だと以下が起きます：
- 意図しない破壊的コマンド（例：削除/上書き）
- 秘密情報の誤取り扱い
- 依存関係の勝手な更新（差分が大きくなる）

## 実務での基本方針（おすすめ）
- **デフォルトは最小権限**：必要なときにだけ広げる
- 危険操作は「人間の承認必須」へ（Hooksでブロック/警告）
- project設定とlocal設定を分ける（チーム共有と個人都合を分離）

## 運用の型
- 1) まず読み取り系（grep/ls/cat）で状況把握
- 2) 次に安全な編集（小さく変更→テスト）
- 3) 最後に破壊的/外部影響（デプロイ、DB、rm -rf）は承認
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Claude Code settings — https://code.claude.com/docs/en/settings
- Hooks reference — https://code.claude.com/docs/en/hooks
- Troubleshooting — https://code.claude.com/docs/en/troubleshooting
```

### Community / Practitioner tips
```text
- Customizing Claude Code: What I Learned from Losing Everything (ainativedev.io) — https://ainativedev.io/news/customizing-claude-code-what-i-learned-from-losing-everything
```

