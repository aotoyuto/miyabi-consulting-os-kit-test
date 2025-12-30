#!/usr/bin/env bash
set -euo pipefail

base_ref="${1:-origin/main}"

git fetch origin >/dev/null 2>&1 || true
git diff "${base_ref}...HEAD" > /tmp/pr.diff || true

if [ ! -s /tmp/pr.diff ]; then
  echo '{"summary":"No changes detected","risks":[],"missing_checks":[],"suggested_tasks":[]}' > ai_review.json
  exit 0
fi

cat /tmp/pr.diff | claude -p       --append-system-prompt "あなたは厳格なレビュワー。危険変更、設計崩れ、テスト不足、抜け漏れを検出し、JSONで返す。keys: summary, risks[], missing_checks[], suggested_tasks[]。"       --output-format json       --allowedTools "Read"       > ai_review.json
