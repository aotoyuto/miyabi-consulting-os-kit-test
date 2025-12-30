param(
    [string]$Issue
)

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "Error: gh (GitHub CLI) is not installed. Please install it from https://cli.github.com/ and run 'gh auth login'."
    exit 1
}

# Optional: AI review (headless) if claude CLI is available
# if (Get-Command claude -ErrorAction SilentlyContinue) {
#     bash scripts/ai/pr_review.sh origin/main
# } else {
#     Write-Host "Info: claude CLI not found. Skipping AI review."
# }

# Create PR
gh pr create --fill --title "Issue #$Issue" --body-file .github/pull_request_template.md

Write-Host "✅ PR created/updated. Link related Issue (#$Issue) in PR if needed."
