# 作業内容の要約：Miyabi-style Consulting OS Kit

## 1. プロジェクト概要

このプロジェクトは、GitHubをタスク管理、バージョン管理、意思決定の中心的なプラットフォームとして利用する、コンサルティングプロジェクト管理用テンプレートです。ClaudeやGeminiのようなAIアシスタントと連携することで、ワークフローの自動化と効率化を図るように設計されています。

このシステムの核となる原則は以下の通りです。
*   **GitHubを信頼できる唯一の情報源（SSOT）とする:** タスク、コード、意思決定、ドキュメントを含むすべてのプロジェクト関連情報がGitHubリポジトリで管理されます。
*   **AIアシストによるワークフロー:** AIアシスタントがコードレビュー、ブランチ作成、プルリクエスト生成などのタスクを自動化するように設計されています。
*   **構造化されたワークフロー:** GitHub IssuesとPull Requestsを使用して、タスクの受付から完了までを管理する明確に定義されたワークフローを提供します。
*   **安全性と堅牢性:** 危険な操作を防ぎ、コード品質を保証するためのガードレールとチェックが含まれています。

## 2. ワークフロー

プロジェクトのワークフローはGitHub IssuesとPull Requestsを中心に構成されています。
1.  **タスクの受付:** 新しいタスクは、`01_intake.md`テンプレートを使用してGitHub Issueとして作成されます。
2.  **ブランチの作成:** `scripts/miyabi-start.sh`スクリプト（またはPowerShell版の`scripts/miyabi-start.ps1`）を使用して、各タスクに対応するブランチが作成されます。
3.  **開発:** タスクブランチ上で作業が行われます。
4.  **プルリクエストの作成:** `scripts/miyabi-finish.sh`スクリプト（またはPowerShell版の`scripts/miyabi-finish.ps1`）を使用して、完了した作業のプルリクエストが作成されます。
5.  **AIレビュー:** GitHub Actionsワークフロー（`.github/workflows/ai_review.yml`）を使用して、各プルリクエストに対して自動AIレビューがトリガーされます。
6.  **意思決定:** 重要な意思決定は「Decision」Issueで議論され、`docs/decisions`ディレクトリにADR（Architectural Decision Records）として文書化されます。

## 3. 主要なファイルとスクリプト

*   `README.md`, `CLAUDE.md`, `GEMINI.md`: システムの使用方法に関するドキュメントと指示を提供します。
*   `scripts/miyabi-start.sh` (Unix系), `scripts/miyabi-start.ps1` (Windows): 新しいタスクブランチを作成します。
*   `scripts/miyabi-finish.sh` (Unix系), `scripts/miyabi-finish.ps1` (Windows): プルリクエストを作成します。
*   `scripts/ai/pr_review.sh` (Unix系), `scripts/ai/pr_review.ps1` (Windows): AIによるコードレビューを実行します。
*   `.github/workflows/ai_review.yml`: 自動AIレビューのためのGitHub Actionsワークフローです。
*   `.claude/settings.json`: AIアシスタントのフックを設定します。
*   `Makefile`: AIレビューの実行やラベルのブートストラップなど、一般的なタスクのショートカットを提供します。
*   `scripts/github/bootstrap_labels.sh`: GitHub Issues管理用の標準化されたラベルセットを作成します。

## 4. 分析と改善点

このプロジェクトの分析中に、以下の改善が行われました。

*   **スクリプトの堅牢性向上:** `scripts/miyabi-start.sh`スクリプトは、`git pull --rebase`コマンドが失敗した場合にスクリプトが終了するように修正されました。これにより、潜在的な競合が見過ごされるのを防ぎます。
*   **包括的なドキュメント:** `GEMINI.md`ファイルが作成され、`Makefile`とGitHubラベルの説明を含む、プロジェクトの包括的な概要を提供するように更新されました。
*   **Windows環境への対応:** 元々Bashスクリプトで提供されていた主要なワークフロースクリプト（`miyabi-start.sh`, `miyabi-finish.sh`, `pr_review.sh`）に対して、PowerShell版（`miyabi-start.ps1`, `miyabi-finish.ps1`, `pr_review.ps1`）を作成し、Windows環境でも基本的なワークフローを実行できるようにしました。

## 5. セッションの要約

このセッションでは、以下の作業を実施しました。

1.  **プロジェクトの分析:** プロジェクトの構造とワークフローを分析し、`GEMINI.md`および`ANALYSIS.md`に調査結果を文書化しました。
2.  **Windows環境への対応:** Windows環境でワークフローを実行できるように、コアスクリプトのPowerShell版（`miyabi-start.ps1`、`miyabi-finish.ps1`、`pr_review.ps1`）を作成しました。
3.  **ワークフローのドライラン:** テストIssueの作成、ブランチの作成、ファイルの変更、プルリクエストの作成、AIレビューのシミュレーションまでの一連のワークフローをPowerShellスクリプトを使用して実演しました。

現在、このプロジェクトはWindows環境でも基本的なワークフローを実行できる状態になっています。

### 今後の提案事項

*   `claude` CLIをインストールし、AIレビュー機能が実際に動作するかを確認する。
*   残りのBashスクリプト（`decision_to_adr.sh`、`bootstrap_labels.sh`）をPowerShellに移植する。
*   特定のクライアントプロジェクトに合わせてテンプレートやスクリプトをカスタマイズする。

このプロジェクトは、コンサルティングプロジェクトを管理するための、よく構造化された堅牢なシステムを提供します。GitHubとAIを活用することで、効率性、一貫性、品質を大幅に向上させる可能性を秘めています。提供されているスクリプトとワークフローは適切に設計されており、ガードレールとチェックの使用はシステムの安全性を高めます。
