---
id: claude-code-lsp
title: LSP統合（診断/参照探索/hover）Tips
topic: lsp
tags:
  - claude-code
  - lsp
  - code-intelligence
  - plugins
created_at: 2025-12-20
language: ja
---

# LSP統合（診断/参照探索/hover）Tips

## 何が嬉しい？
LSP統合により、Claudeが次を“即時に”参照できます：
- 診断（エラー/警告）
- 定義ジャンプ
- 参照検索
- hover情報（型やドキュメント）

## 実務Tips
- まず“主要言語”だけLSPを入れる（全言語対応を急がない）
- PR単位でLSPの効果を測る（修正回数/手戻りの減少）
- LSP設定はプラグインで配布するとチーム標準化しやすい

## 最新アップデート確認の基準
- 正式な変更点は **CHANGELOG / Releases** を一次情報にする
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Plugins reference — https://code.claude.com/docs/en/plugins-reference
- Claude Code repository CHANGELOG.md — https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md
- Claude Code releases — https://github.com/anthropics/claude-code/releases
```

### Community / Practitioner tips
```text
- Claude Code 2.0.0 のメジャーアップデートについて（Zenn） — https://zenn.dev/oikon/articles/claude-code-2
```

