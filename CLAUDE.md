# Claude Code 指示書（Miyabi-style / Consulting OS）

このリポジトリでは、**GitHubを台帳（OS / SSOT）** として扱います。
Claude（Claude Code / Action / headless）は、台帳を更新しながら作業を進めてください。

## 絶対ルール（SSOT）
- 依頼・要件・制約・DoD：Issue（templates）
- 変更：PR（テンプレのチェックに従う）
- 決定事項：Decision Issue → ADR（docs/decisions）
- 作業ログ/成果：PRコメント・artifact・コミット

## 役割（識学：🔴🔵🟡）
- 🔴決裁：最終的にOK/NGを出す（基本はユーザー）
- 🔵実行：実装・作業を進める（Claude + 人）
- 🟡確認：品質・漏れ・危険のチェック（Claudeチェック + ユーザー）

## 70%失敗前提の設計思想
- 小さいPR（巻き戻し可能）
- チェックリスト強制（PRテンプレ）
- 危険操作はhookで止める
- 迷ったら Decision Issue を作り、結論をADRに固定

## 進め方（毎回この順）
1) Issueを整形：目的/制約/DoD/タスク分割/依存関係  
2) 作業ブランチを作成（Issue番号を含む）  
3) 小さく実装し、PR作成  
4) PRテンプレを埋め、検証・リスク・ロールバックを書く  
5) AIレビュー（headless）結果を確認し、必要なら追加Issue化  
6) 決裁が絡むなら Decision Issue → ADRへ確定

## プロンプト規約（混線防止）
ユーザーのプロンプトには必ず以下を含める：
- `CLIENT: <顧客/案件名>`
- `ISSUE: #<番号>`
- `GOAL:`（今回のゴール）
- `DoD:`（完了条件）
- `CONSTRAINT:`（触ってはいけないもの/期限）

## 出力規約
- 重要な指示は必ず GitHub（Issue/PR/ADR）に残す
- TODOは必ず Issue 化（チェック漏れ防止）
- 根拠（URL/引用/注意点）は Research Issue に整理

## MCP（任意）
MCPを使う場合でも、台帳（決定・チェック・要件）はGitHubに固定する。
MCPは外部I/O（ドキュメント取得、Slack投稿、ブラウザ操作など）に限定する。
