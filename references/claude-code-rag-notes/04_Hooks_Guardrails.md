---
id: claude-code-hooks-guardrails
title: Hooksでガードレールを作る（PreToolUse中心）
topic: hooks
tags:
  - claude-code
  - hooks
  - guardrails
  - pretooluse
  - posttooluse
created_at: 2025-12-20
language: ja
---

# Hooksでガードレールを作る（PreToolUse中心）

## Hooksの役割
Hooksは「Claude Codeのライフサイクルイベントに対して、検証/ブロック/通知/補助コンテキスト注入を行う仕組み」です。

## まず入れると効くHook（おすすめ順）
1. **PreToolUse**：危険コマンドをブロック、実行前に警告
2. **PermissionRequest**：権限ダイアログに対して、ルールに基づく許可/拒否
3. **PostToolUse**：編集後にlint/testを回して結果を返す
4. **PreCompact**：自動/手動compact前に、重要コンテキストを保存/要約
5. **SessionStart**：依存の導入、環境変数、作業コンテキストのロード

## ガードレール例（思想）
- 禁止：`rm -rf`, `DROP TABLE`, secretsを含む出力
- ルール：テスト未実行なら“停止してテスト”を促す
- 例外：特定ブランチ（sandbox）だけ許可

## 失敗しないコツ
- Hookは最初「警告のみ」→安定したら「ブロック」に段階移行
- stdoutで“次にどうすればOKか”を短く返す（モデルが従いやすい）
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Hooks guide — https://code.claude.com/docs/en/hooks-guide
- Hooks reference — https://code.claude.com/docs/en/hooks
- Plugins reference — https://code.claude.com/docs/en/plugins-reference
```

### Community / Practitioner tips
```text
- Customizing Claude Code: What I Learned from Losing Everything (ainativedev.io) — https://ainativedev.io/news/customizing-claude-code-what-i-learned-from-losing-everything
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
```

