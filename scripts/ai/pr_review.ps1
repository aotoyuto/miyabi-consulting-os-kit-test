param(
    [string]$base_ref = "origin/main"
)

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "Error: claude CLI is not installed. Please install it."
    exit 1
}

git fetch origin 2>$null
$diff = git diff "${base_ref}...HEAD"

if (-not $diff) {
    '{"summary":"No changes detected","risks":[],"missing_checks":[],"suggested_tasks":[]}' | Set-Content -Path "ai_review.json"
    exit 0
}

$prompt = "You are a strict reviewer. Detect dangerous changes, design flaws, lack of tests, and omissions, and return them in JSON format. keys: summary, risks[], missing_checks[], suggested_tasks[]."
$diff | claude -p `
    --append-system-prompt $prompt `
    --output-format json `
    --allowedTools "Read" | Set-Content -Path "ai_review.json"