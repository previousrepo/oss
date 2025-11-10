#!/bin/bash

# Git with GitHub Demo Script
# Note: Replace YOUR_USERNAME and YOUR_REPO with actual values

echo "=== Git with GitHub Demonstration ==="
echo ""

REPO_URL="https://github.com/YOUR_USERNAME/YOUR_REPO.git"

# Clone repository
echo "1. Cloning repository from GitHub..."
git clone $REPO_URL
cd YOUR_REPO

# Team Leader setup
echo "2. Team Leader initial setup..."
git config user.name "Team Leader"
git config user.email "leader@example.com"
echo "# Team Project" > PROJECT.md
git add PROJECT.md
git commit -m "Add project documentation"
git push origin main

# Coder 1 - Feature branch
echo "3. Coder 1 creating feature branch..."
git checkout -b feature-api
git config user.name "Coder 1"
git config user.email "coder1@example.com"
echo "API endpoints" > api.py
git add api.py
git commit -m "Add API module"
git push origin feature-api

# Pull changes
echo "4. Pulling latest changes..."
git checkout main
git pull origin main

# Merge feature
echo "5. Merging feature branch..."
git merge feature-api
git push origin main

echo ""
echo "=== Demo Complete ==="
echo "Check your GitHub repository for changes"
