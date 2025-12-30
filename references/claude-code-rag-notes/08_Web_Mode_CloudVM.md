---
id: claude-code-web-mode
title: Claude Code on the web（VM実行）の要点
topic: web_mode
tags:
  - claude-code
  - web
  - cloud-vm
  - parallel
created_at: 2025-12-20
language: ja
---

# Claude Code on the web（VM実行）の要点

## 仕組み（ざっくり）
- リポジトリがクラウドVMにクローンされ
- Claudeがそこでコード変更/テスト実行を行い
- 完了するとブランチがpushされ、PR化できる

## 向いているケース
- ローカル環境が重い/壊れている
- 並列で複数タスクを同時に進めたい
- “明確な作業”を任せて、途中は監視だけしたい

## 注意点
- ネットワーク設定や外部アクセス制限は確認が必要
- 機密情報（Secrets）の扱いは、ローカル以上にルール化する
- 変更はPRでレビューしてからマージ
## References

最終確認日: 2025-12-20（JST）

### Official
```text
- Claude Code on the web — https://code.claude.com/docs/en/claude-code-on-the-web
- ウェブ上のClaude Code（日本語） — https://code.claude.com/docs/ja/claude-code-on-the-web
```

### Community / Practitioner tips
```text
- Claude Code on the Webの仕様を徹底解剖（Zenn） — https://zenn.dev/oikon/articles/claude-code-web-sandbox
```

