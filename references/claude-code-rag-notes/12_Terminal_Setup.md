---
id: claude-code-terminal-setup
title: /terminal-setup と複数行入力の最適化
topic: terminal_setup
tags:
  - claude-code
  - terminal
  - ux
  - multiline
created_at: 2025-12-20
language: ja
---

# /terminal-setup と複数行入力の最適化

## 複数行入力の選択肢（運用で困りがち）
- どのターミナルでも動く：`\` + Enter
- macOS：Option+Enter
- Shift+Enter：`/terminal-setup` で設定（対応ターミナルあり）
- Ctrl+J（ラインフィード）など

## /terminal-setup を入れるメリット
- 改行が楽になる（プロンプト品質が上がる）
- その結果、Claudeへの指示が“構造化”されやすい

## ついでにおすすめ
- /statusline で「ブランチ/モデル/コンテキスト使用率」を表示すると事故が減る
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Optimize your terminal setup — https://code.claude.com/docs/en/terminal-config
- Interactive mode — https://code.claude.com/docs/en/interactive-mode
- Slash commands — https://code.claude.com/docs/en/slash-commands
```

### Community / Practitioner tips
```text
- Claude Code 2.0.0 のメジャーアップデートについて（Zenn） — https://zenn.dev/oikon/articles/claude-code-2
```

