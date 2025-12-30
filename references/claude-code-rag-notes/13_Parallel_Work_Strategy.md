---
id: claude-code-parallel
title: 並列戦略：Web + Subagents + Actions
topic: parallelism
tags:
  - claude-code
  - parallel
  - subagents
  - github-actions
  - web
created_at: 2025-12-20
language: ja
---

# 並列戦略：Web + Subagents + Actions

## 並列化の3レイヤ
1) **Subagents**：同一作業内の分担（調査/実装/テスト）  
2) **Claude Code on the web**：別タスクを同時進行（クラウドVM）  
3) **GitHub Actions**：Issue/PR単位で自動実行（@claude）

## 失敗しない設計
- タスクを“独立”に切る（依存を減らす）
- 受け入れ条件を明確化（DoD）
- 競合しやすいファイル領域は担当を固定
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Claude Code on the web — https://code.claude.com/docs/en/claude-code-on-the-web
- Subagents — https://code.claude.com/docs/en/sub-agents
- Claude Code GitHub Actions（日本語） — https://code.claude.com/docs/ja/github-actions
```

### Community / Practitioner tips
```text
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
- Claude Code on the Webの仕様を徹底解剖（Zenn） — https://zenn.dev/oikon/articles/claude-code-web-sandbox
```

