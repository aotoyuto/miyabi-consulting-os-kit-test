# ラベル設計（Miyabi-lite → 段階拡張）

目的：ラベルを増やすほど運用負荷も増えるため、まず「事故が減る最小セット」から開始します。

## 最小セット（推奨）
### Type
- type:intake
- type:research
- type:deliverable
- type:decision

### State
- state:backlog
- state:doing
- state:review
- state:blocked
- state:done

### Role（識学）
- role:🔴decision-needed
- role:🔵exec
- role:🟡review

### Priority / Risk
- prio:P0
- prio:P1
- prio:P2
- prio:P3
- risk:security
- risk:data
- risk:none

## 増やす基準（2週間運用後）
- 「ラベルがないせいで迷った/漏れた」が週2回以上 → 追加候補
- 「検索したい分類」が明確 → knowledge:* を追加
- 自動化したい → path:* / area:* を追加（Actionsで振り分け）
