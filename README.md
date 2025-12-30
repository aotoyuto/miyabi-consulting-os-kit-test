# Miyabi-style Consulting OS Kit (GitHub as OS + Claude Code)

目的：**複数クライアント案件**を「抜け漏れなく・小さく安全に・最速で」回すためのテンプレです。  
台帳（SSOT）は **GitHub（Issue / PR / Actions / ADR）** に固定し、AIは **Claude Code（＋必要に応じてMCP）** で回します。

## まずやること（10分）
1. このフォルダをテンプレリポジトリとしてGitHubにpush
2. GitHubで `ANTHROPIC_API_KEY` を Secrets に登録
3. Claude Code Action を使う場合は Claude GitHub App をリポに入れる（任意）
4. ローカル（WSL/mac/Linux）で `chmod +x` を一回だけ実行

```bash
chmod +x .claude/hooks/*.sh scripts/**/*.sh
```

## 運用プロトコル（Miyabi-lite）
**必ずこの順で進める**（迷い/混線/抜け漏れ防止）

1. 依頼は Issue（01_intake）で受ける（DoD/役割🔴🔵🟡/制約）
2. 調査は Issue（02_research）で結論→根拠→次アクション
3. 実装/成果物は小さいPRで出す（PRテンプレのチェック必須）
4. 決裁が必要なら Decision Issue → ADR（docs/decisions）に確定
5. PRごとにAIレビュー（headless）を回し、見落としを炙る

## ローカル：Issue起点でブランチ/Worktreeを切る（単一コマンド入口）
```bash
# 例：Issue #123 から作業開始
bash scripts/miyabi-start.sh 123 main

# 例：作業後にAIレビュー→PR作成
bash scripts/miyabi-finish.sh 123
```

## CI：PRごとにAIレビューを自動実行
- `.github/workflows/ai_review.yml` が PR のたびに `claude -p` でレビュー JSON を作ります。
- 出力は `ai_review.json`（artifactとして保存）

## Claude Code Hooks（ガードレール）
- `.claude/settings.json` は **サンプル**です。Claude Codeのユーザー設定（`~/.claude/settings.json`）にマージして使ってください。
- hooks は **止める/促す**に限定（AIを再帰起動しない）

## 重要（安全）
- `.env` / keys / credentials 系は AI 操作対象外にする（hooksでブロック）
- `rm -rf` / `git push --force` / `curl|sh` はブロック
- 失敗前提（70%）なので **小さい差分 + 早いレビュー + 巻き戻し** を常に優先

## MCPの位置づけ
- MCPは「外部I/O（Drive/Notion/Slack/ブラウザ操作）」に限定し、台帳はGitHub固定が推奨です。

---
このテンプレは「最小で回る」ことを優先しています。ラベル・自動分類・サブエージェント分業などは、運用が回ってから段階的に足します。
