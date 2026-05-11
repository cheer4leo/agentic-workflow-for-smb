#!/bin/bash
# deploy.sh — stage, commit, and push all public site changes to main
# Usage: ./deploy.sh "your commit message"
#        ./deploy.sh   (uses a default timestamped message)

set -e

MSG=${1:-"Update site $(date '+%Y-%m-%d %H:%M')"}

echo "📦 Staging public files..."
git add index.html healthcare.html homeservices.html \
        sample-audit-dental.html sample-audit-homeservices.html \
        .github/

echo "✏️  Committing: \"$MSG\""
git commit -m "$MSG" || echo "⚠️  Nothing new to commit."

echo "🚀 Pushing to main..."
git push origin main

echo ""
echo "✅ Done. Deployments triggered:"
echo "   → GitHub Pages:       https://cheer4leo.github.io/agentic-workflow-for-smb/"
echo "   → getagenticai:       https://getagenticai.netlify.app/"
echo "   → youragenticai:      https://youragenticai.netlify.app/"
