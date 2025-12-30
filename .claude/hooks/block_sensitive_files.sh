#!/usr/bin/env bash
set -euo pipefail
payload="$(cat 2>/dev/null || true)"

# Detect file path from tool_input
file_path="$(echo "$payload" | python - <<'PY'
import json,sys,re
s=sys.stdin.read()
try:
    j=json.loads(s) if s.strip() else {}
except Exception:
    j={}
ti=j.get("tool_input") or {}
for k in ("file_path","path","filename"):
    if k in ti and isinstance(ti[k], str):
        print(ti[k]); raise SystemExit
print("")
PY
)"

if echo "$file_path" | grep -qiE '(\.env$|id_rsa|\.pem$|credentials|secret|token|apikey|api_key)'; then
  echo '{
    "continue": false,
    "stopReason": "機密っぽいファイル操作が検知されました（.env/keys/secrets等）。このファイルはAI操作対象外にしてください。",
    "suppressOutput": true
  }'
  exit 0
fi

echo '{"continue": true, "suppressOutput": true}'
