ai-review:
	bash scripts/ai/pr_review.sh origin/main

labels:
	@echo "bash scripts/github/bootstrap_labels.sh owner/repo"

decision-to-adr:
	@echo "bash scripts/ai/decision_to_adr.sh <issue_number>"
