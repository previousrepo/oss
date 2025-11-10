#!/bin/bash

# Git Multi-User Demo Script

echo "=== Git Multi-User Demonstration ==="
echo ""

# Create project directory
mkdir -p git_demo
cd git_demo

# Initialize repository
echo "1. Initializing Git repository..."
git init

# Team Leader - Initial commit
echo "2. Team Leader creating initial project..."
git config user.name "Team Leader"
git config user.email "leader@example.com"
echo "# Team Project" > README.md
echo "Initial project structure" > main.txt
git add .
git commit -m "Initial commit by Team Leader"

# Coder 1 - Feature branch
echo "3. Coder 1 working on feature..."
git checkout -b feature-login
git config user.name "Coder 1"
git config user.email "coder1@example.com"
echo "Login functionality" > login.txt
git add login.txt
git commit -m "Add login feature by Coder 1"

# Coder 2 - Another feature branch
echo "4. Coder 2 working on another feature..."
git checkout main
git checkout -b feature-dashboard
git config user.name "Coder 2"
git config user.email "coder2@example.com"
echo "Dashboard functionality" > dashboard.txt
git add dashboard.txt
git commit -m "Add dashboard feature by Coder 2"

# Show branches
echo "5. Showing all branches..."
git branch -a

# Team Leader - Merge features
echo "6. Team Leader merging features..."
git checkout main
git config user.name "Team Leader"
git config user.email "leader@example.com"
git merge feature-login -m "Merge login feature"
git merge feature-dashboard -m "Merge dashboard feature"

# Show diff
echo "7. Showing code differences..."
git log --graph --oneline --all

echo ""
echo "=== Demo Complete ==="
