---
id: claude-code-growth-loops
title: CLAUDE.md / Skills / Subagents を“育てる”運用ループ（改善の型）
topic: growth
tags:
  - claude-code
  - process
  - continuous-improvement
  - rag
created_at: 2025-12-20
language: ja
---

# CLAUDE.md / Skills / Subagents を“育てる”運用ループ（改善の型）

## TL;DR
「一発で完成」は無理なので、**事故ログ→ルール化→自動化** の順で“育てる”のが最短です。

## 育てる対象とゴール
- CLAUDE.md：判断基準・DoD・禁止事項を固定し、ブレを減らす
- Skills：繰り返す手順を“型”にして再現性を上げる
- Subagents：役割分担を明確にし、並列効率を上げる
- Hooks/CI：人が忘れる部分を“強制”して事故を減らす

## 改善ループ（おすすめ：週1/隔週）
### Step 1: Drift/事故を収集（最重要）
- 失敗PRの原因（テスト漏れ、依存更新過多、命名違反）
- レビューで毎回出る指摘（観点の抜け）
- 「説明し直した」内容（再発してる知識）

### Step 2: ルール化の配置先を決める
- 全員共通・基本方針 → CLAUDE.md
- 手順・定型作業 → Skill
- 役割分担・成果物テンプレ → Subagent
- 強制が必要 → Hook/CI

### Step 3: “最小の修正”で反映
- 文章を増やす前に、**短い禁止/必須**を追加
- Skillは例（examples）を1つ増やすだけでも効く
- Subagentは出力フォーマットを固定するだけで再現性が上がる

### Step 4: 効果測定（軽くでOK）
- 修正回数（手戻り）の減少
- PRレビューコメント数の減少
- CI落ちの回数の減少
- 自動化に置き換えた回数

## バージョニング（推奨）
- `.claude/` も含めてGit管理
- 変更点はPR説明に「運用ルール変更」を明記
- 破壊的なガードレール（強制テスト等）は段階導入（警告→ブロック）

## 例：よくある改善マッピング
- 「テスト忘れ」→ CLAUDE.mdにDoD + PostToolUse hookでテスト自動
- 「危険コマンド」→ PreToolUse hookでブロック
- 「依存更新が混ざる」→ CLAUDE.mdに“依存更新は別PR”
- 「領収書取得が不安定」→ Skillにサイト別例外とリトライ方針を追記
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Manage Claude's memory (CLAUDE.md) — https://code.claude.com/docs/en/memory
- Agent Skills — https://code.claude.com/docs/en/skills
- Hooks reference — https://code.claude.com/docs/en/hooks
- Claude Code: Best practices for agentic coding — https://www.anthropic.com/engineering/claude-code-best-practices
```

### Community / Practitioner tips
```text
- Customizing Claude Code: What I Learned from Losing Everything (ainativedev.io) — https://ainativedev.io/news/customizing-claude-code-what-i-learned-from-losing-everything
```

