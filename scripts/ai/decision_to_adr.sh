#!/usr/bin/env bash
set -euo pipefail

ISSUE="${1:?Usage: decision_to_adr.sh <decision_issue_number>}"
OUT_DIR="${2:-docs/decisions}"

if ! command -v gh >/dev/null 2>&1; then
  echo "gh (GitHub CLI) が必要です。"
  exit 1
fi
if ! command -v claude >/dev/null 2>&1; then
  echo "claude CLI が必要です（headlessでADR生成します）。"
  exit 1
fi

body="$(gh issue view "$ISSUE" --json title,body -q '.title + "\n\n" + .body')"

mkdir -p "$OUT_DIR"
# Simple numbering: timestamp-based
id="$(date +%Y%m%d-%H%M%S)"
out="$OUT_DIR/ADR-${id}.md"

printf "%s" "$body" | claude -p       --append-system-prompt "あなたはADR（Architecture Decision Record）作成者。入力（Decision Issue）からADRをMarkdownで作成。見出しは Context/Decision/Options/Consequences/Notes/Related Issue を含める。"       --output-format text       --allowedTools "Read,Write"       > "$out"

echo "✅ ADR created: $out"
