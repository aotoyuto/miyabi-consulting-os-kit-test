---
id: claude-code-claude-md
title: CLAUDE.md（メモリ）設計のコツ
topic: claude_md
tags:
  - claude-code
  - memory
  - claude-md
  - rag
created_at: 2025-12-20
language: ja
---

# CLAUDE.md（メモリ）設計のコツ

## 役割
`CLAUDE.md` は、Claude Code起動時に自動ロードされる「プロジェクトの常設コンテキスト」です。
- 目的：毎回説明しなくても、規約・方針・定義を安定的に適用させる
- 逆に：その場限りの指示、長いログは入れすぎない（コンテキスト圧迫）

## 書くべき内容（おすすめ）
- **Definition of Done**（完了条件）：テスト、lint、型、ドキュメント更新など
- **禁止事項**：秘密鍵・本番DBへの直アクセスなど
- **出力規約**：PR説明のテンプレ、コミット粒度
- **リポジトリの地図**：主要ディレクトリの意味、エントリポイント
- **依存関係の扱い**：パッケージ管理、Node/Pythonのバージョン方針

## よくある事故と対策
- 「毎回違う書き方」→ CLAUDE.mdで“用語・命名・パターン”を固定
- 「テストを回さない」→ DoDに `tests must pass` を明記 + Hooksで強制（別ノート参照）
- 「広すぎる指示」→ 目的→制約→手順→例、の順で短く
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Manage Claude's memory (CLAUDE.md) — https://code.claude.com/docs/en/memory
- Claude Code settings — https://code.claude.com/docs/en/settings
- Claude Code: Best practices for agentic coding — https://www.anthropic.com/engineering/claude-code-best-practices
```

### Community / Practitioner tips
```text
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
```

