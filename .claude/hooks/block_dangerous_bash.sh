#!/usr/bin/env bash
set -euo pipefail
payload="$(cat 2>/dev/null || true)"

cmd="$(echo "$payload" | python - <<'PY'
import json,sys
s=sys.stdin.read()
try:
    j=json.loads(s) if s.strip() else {}
except Exception:
    j={}
ti=j.get("tool_input") or {}
# Bash tool commonly has fields like `command` or `cmd`
print(ti.get("command") or ti.get("cmd") or "")
PY
)"

if echo "$cmd" | grep -qiE 'rm\s+-rf\s+/|git\s+push\s+--force|curl\s+[^|]*\|\s*sh|:\(\)\s*\{\s*:\|\s*:\s*&\s*\};:'; then
  echo '{
    "continue": false,
    "stopReason": "危険なBashが検知されました（rm -rf / force push / curl|sh 等）。意図を説明し、安全な代替手順にしてください。",
    "suppressOutput": true
  }'
  exit 0
fi

echo '{"continue": true, "suppressOutput": true}'
