---
id: claude-code-starter-templates
title: 書き方テンプレ集：CLAUDE.md / SKILL.md / Subagent 依頼テンプレ
topic: templates
tags:
  - claude-code
  - templates
  - claude-md
  - skills
  - subagents
  - rag
created_at: 2025-12-20
language: ja
---

# 書き方テンプレ集：CLAUDE.md / SKILL.md / Subagent 依頼テンプレ

## 1) CLAUDE.md（最小テンプレ）
```md
# Purpose
- このリポジトリの目的：
- 利用者・対象：

# Definition of Done (DoD)
- 必須テスト：
- lint/format：
- ドキュメント更新：
- 互換性/性能：

# Coding Conventions
- 命名：
- ディレクトリ構造：
- 例外：

# PR Policy
- 粒度：
- PR本文テンプレ：
- レビュー観点：

# Forbidden
- 絶対にしないこと（本番、秘密情報、破壊操作）：
```

## 2) SKILL.md（最小テンプレ）
```md
---
name: <skill-name>
description: <いつ/何のために使うか>
---

# Goal
- 何を達成するSkillか

# Inputs
- 必須入力：
- 任意入力：

# Steps
1. ...
2. ...

# Output
- 期待する出力形式（例：チェックリスト、差分、PR本文）

# Edge cases
- よくある例外：
- リトライ/回避策：

# Examples
- 入力例：
- 出力例：
```

## 3) Subagent依頼テンプレ（おすすめ：全依頼共通）
```md
## 目的
- 何を達成したいか（1行）

## 背景
- なぜ必要か

## Done（受け入れ条件）
- 具体的に何が揃えば完了か（テスト/ドキュメント含む）

## 制約
- 触って良い/悪い範囲
- 禁止事項（Secrets、本番操作など）

## 参考
- 関連Issue/PR/リンク
- 期待する出力形式
```

## 4) “育てる”ログテンプレ（週次）
```md
# Ops Log (Weekly)
- よく出たレビュー指摘：
- CI落ち原因：
- 事故/ヒヤリ：
- 次回反映するルール（CLAUDE.md / Skill / Hook / Subagent）：
```
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Manage Claude's memory (CLAUDE.md) — https://code.claude.com/docs/en/memory
- Agent Skills — https://code.claude.com/docs/en/skills
- Subagents — https://code.claude.com/docs/en/sub-agents
```

