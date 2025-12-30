---
id: claude-code-subagents-authoring
title: Subagentsの書き方：役割分担・入出力・ガードレールの設計
topic: subagents
tags:
  - claude-code
  - subagents
  - multi-agent
  - authoring
  - rag
created_at: 2025-12-20
language: ja
---

# Subagentsの書き方：役割分担・入出力・ガードレールの設計

## 目的
Subagentsは「同じリポジトリ内で、**役割の違うAI作業者**を増やして並列化する」ための仕組みです。  
“誰が何をやるか”を明示すると、探索・実装・レビューが速くなり、手戻りが減ります。

## まず決める3点（必須）
1. **役割（Role）**：調査/実装/レビュー/テスト/ドキュメント など
2. **出力フォーマット（Output）**：箇条書き、差分提案、チェックリスト、PR本文 など
3. **境界（Boundaries）**：触っていい領域/触らない領域、禁止操作、権限

## 典型の分業パターン（おすすめ）
### パターンA：探索→実装→検証
- Researcher：影響範囲と原因を特定（参照検索、ログ読む）
- Implementer：最小差分で修正（DoDを満たす）
- Verifier：テスト・lint・エッジケース確認（不足を指摘）

### パターンB：仕様→実装→レビュー
- Spec-writer：受け入れ条件を文章化（DoD/制約）
- Implementer：コード変更
- Reviewer：セキュリティ/互換性/性能の観点でレビュー

## “育つSubagent”にする書き方（コツ）
- **入力を固定**：毎回同じテンプレ（目的/前提/制約/Done）で渡す
- **曖昧さを減らす**：「やって」ではなく「Doneの定義」を書く
- **再利用できる成果物**：チェックリスト/テンプレ/判断基準を残す
- **失敗ログを反映**：よく起きる事故（依存更新しすぎ、テスト抜け）を境界に追記

## ミニテンプレ（RAG向け）
> 実装はあなたの環境に合わせて記載形式を調整してください（ここでは“設計要素”を示します）。

```text
[Subagent name]
- Role:
- Inputs (required):
- Outputs (format):
- Boundaries (do/don't):
- Quality gates (tests/lint):
- Escalation rule (when to ask human):
```

## よくある落とし穴
- 役割が重複して“二度手間” → 役割と成果物を分ける
- 出力形式がバラバラ → 先にテンプレを固定
- 権限が広すぎて事故 → BoundariesとHooksでガードレール
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Subagents — https://code.claude.com/docs/en/sub-agents
- Common workflows — https://code.claude.com/docs/en/common-workflows
- Hooks guide — https://code.claude.com/docs/en/hooks-guide
```

### Community / Practitioner tips
```text
- Understanding Claude Code's Full Stack: MCP, Skills ... (alexop.dev) — https://alexop.dev/posts/understanding-claude-code-full-stack/
```

