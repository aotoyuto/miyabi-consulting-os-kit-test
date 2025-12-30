---
id: claude-code-ops-safety
title: 運用事故を減らすチェックリスト（10項目）
topic: ops_checklist
tags:
  - claude-code
  - ops
  - safety
  - guardrails
created_at: 2025-12-20
language: ja
---

# 運用事故を減らすチェックリスト（10項目）

1. CLAUDE.mdにDoD（テスト/品質/PRテンプレ）を明記
2. 破壊的操作は最小権限＆人間承認へ
3. PreToolUseで危険コマンドをブロック（段階導入）
4. PostToolUseでlint/testを自動実行
5. 依存更新は別PRへ分離
6. セッション名を付ける（/rename）
7. 長時間はcompact前提でPreCompactを用意
8. Secretsの扱いルールを明文化（出力禁止、ログ禁止）
9. GitHub Actionsは最小権限（permissions）＆保護ブランチ
10. 変更点は必ずPRでレビュー（Web/Actionsでも同じ）
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Claude Code settings — https://code.claude.com/docs/en/settings
- Hooks guide — https://code.claude.com/docs/en/hooks-guide
- Claude Code GitHub Actions（日本語） — https://code.claude.com/docs/ja/github-actions
```

### Community / Practitioner tips
```text
- Customizing Claude Code: What I Learned from Losing Everything (ainativedev.io) — https://ainativedev.io/news/customizing-claude-code-what-i-learned-from-losing-everything
```

