---
id: claude-code-rag-index
title: Claude Code RAGノート索引
topic: index
tags:
  - claude-code
  - rag
  - index
created_at: 2025-12-20
language: ja
---

# Claude Code RAGノート索引

このフォルダは「Claude Codeの最新Tips＋公式参照」をRAGに取り込みやすい形で分割したノート集です。

## 推奨チャンク設計
- 1見出し（H2/H3）= 1チャンク
- YAML frontmatter の `topic/tags` をメタデータとして保持
- **References** はURLを `text` コードブロック内に入れているので、取り込み時にURL抽出しやすいです

## ファイル一覧
- 01_CLAUDE_MD.md … CLAUDE.md（メモリ）の設計
- 02_Skills_Design.md … Skillsの基本設計（SKILL.md）
- 03_Skills_AllowedTools_Guide.md … 許可ツール/権限の考え方
- 04_Hooks_Guardrails.md … Hooksでのガードレール（PreToolUse等）
- 05_Plugins_Packaging.md … Pluginsでの配布・同梱要素
- 06_Git_Workflow.md … Git運用のコツ（Claude Code前提）
- 07_GitHub_Actions_AtClaude.md … GitHub Actions（@claude）の運用
- 08_Web_Mode_CloudVM.md … Claude Code on the web（VM/PR）
- 09_Slack_Routing.md … Slack窓口での運用アイデア
- 10_Context_Operations.md … /rename /resume /compact など運用
- 11_LSP_Tools.md … LSP/診断/参照探索（2.x系の重要トピック）
- 12_Terminal_Setup.md … /terminal-setup と複数行入力
- 13_Parallel_Work_Strategy.md … 並列化（Web+Subagent+Actions）
- 14_Ops_Safety_Checklist.md … 事故防止チェックリスト
- 15_Playwright_Receipts_Skill_Example.md … 領収書取得のSkill化例
- 16_Sources_Master.md … 参考文献一覧（公式＋GitHub＋コミュニティ）
