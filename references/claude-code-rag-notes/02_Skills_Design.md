---
id: claude-code-skills-design
title: Skills設計（SKILL.md）ベストプラクティス
topic: skills
tags:
  - claude-code
  - skills
  - skill.md
  - rag
created_at: 2025-12-20
language: ja
---

# Skills設計（SKILL.md）ベストプラクティス

## Skillsとは（超要点）
Skillsは「フォルダ単位で知識・手順・スクリプトを束ね、文脈に応じて自動で呼ばれる能力」です。
- 単発の `/command` よりも、複数ファイル・複数ステップの“型”に向きます
- プロジェクト/個人/プラグインに置ける

## 最小構成
- `SKILL.md`（YAML frontmatter + 本文）
- 任意：`examples/` `templates/` `scripts/` `checklists/`

## SKILL.mdの書き方（RAG向け）
- frontmatterの `name` と `description` を“検索語”として強くする
- 本文は「手順→判断基準→例→失敗例→リカバリ」の順で
- 1スキル1目的（領収書取得/請求書処理/PR作成…など）

## 運用Tips
- Skillsは“増やす”より“育てる”（1回作って、事故ログを反映）
- 重要スキルはHooksとセットで安全化（例：危険コマンド禁止、テスト強制）
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Agent Skills — https://code.claude.com/docs/en/skills
- Slash commands — https://code.claude.com/docs/en/slash-commands
- Create plugins — https://code.claude.com/docs/en/plugins
```

### Community / Practitioner tips
```text
- Claude Skills Solve the Context Window Problem (Substack) — https://tylerfolkman.substack.com/p/the-complete-guide-to-claude-skills
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
```

