---
id: claude-code-plugins-packaging
title: Pluginsで配布する（コマンド/Agents/Skills/Hooks/MCP）
topic: plugins
tags:
  - claude-code
  - plugins
  - packaging
  - marketplace
created_at: 2025-12-20
language: ja
---

# Pluginsで配布する（コマンド/Agents/Skills/Hooks/MCP）

## Pluginsでできること
Claude Codeのプラグインは、以下を“束ねて配布”できます：
- Slash commands
- Subagents
- Hooks
- Skills
- MCP servers
- （プラグイン側での）LSP設定

## 使いどころ（判断基準）
- 個人の設定ではなく、**チーム共通の開発体験**として配布したい
- 複数リポジトリで同じ運用を再利用したい
- “標準の作業フロー”を強制したい（Hookとセット）

## 配布運用のコツ
- プラグインは「最小のコア」+「オプション」を分ける
- 変更はリリースノートを付ける（チームの信頼が上がる）
- 破壊的変更（Hookの強制など）は段階導入
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Create plugins — https://code.claude.com/docs/en/plugins
- Plugins reference — https://code.claude.com/docs/en/plugins-reference
- Plugin marketplaces（日本語） — https://code.claude.com/docs/ja/plugin-marketplaces
```

### Community / Practitioner tips
```text
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
```

