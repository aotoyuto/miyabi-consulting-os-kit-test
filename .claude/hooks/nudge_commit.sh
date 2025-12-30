#!/usr/bin/env bash
set -euo pipefail

# If many changes accumulate, nudge small commits/PR splitting (70% failure assumption)
count="$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')"
if [ "${count:-0}" -ge 20 ]; then
  echo '{
    "continue": true,
    "systemMessage": "変更が多いです（20+）。失敗前提で小さくコミット/PRに分割すると安全です。",
    "suppressOutput": true
  }'
  exit 0
fi

echo '{"continue": true, "suppressOutput": true}'
