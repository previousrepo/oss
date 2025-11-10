#!/bin/bash

# Mercurial with Remote Repository Demo

echo "=== Mercurial Remote Repository Demonstration ==="
echo ""

# Note: This script assumes you have a Bitbucket repository
# Replace with your actual repository URL

REPO_URL="https://bitbucket.org/YOUR_USERNAME/YOUR_REPO"

echo "Note: This demo requires a Bitbucket account (Mercurial support)"
echo "Or hg-git extension for GitHub integration"
echo ""

# Check if hg is installed
if ! command -v hg &> /dev/null; then
    echo "Mercurial is not installed. Installing..."
    echo "  Ubuntu/Debian: sudo apt-get install mercurial"
    echo "  CentOS/RHEL: sudo yum install mercurial"
    exit 1
fi

# Clone repository (if exists)
echo "1. Cloning repository..."
# hg clone $REPO_URL
# cd YOUR_REPO

# Alternative: Create local repo for demo
mkdir -p hg_remote_demo
cd hg_remote_demo
hg init

# Team Leader setup
echo "2. Team Leader initial setup..."
cat > .hg/hgrc << EOF
[ui]
username = Team Leader <leader@example.com>
EOF

echo "# Project Documentation" > README.md
hg add README.md
hg commit -m "Initial documentation"

# Coder 1 - Feature branch
echo "3. Coder 1 creating feature..."
cat > .hg/hgrc << EOF
[ui]
username = Coder 1 <coder1@example.com>
EOF

hg branch feature-module
echo "New module implementation" > module.py
hg add module.py
hg commit -m "Add new module"

# Show outgoing changes
echo "4. Showing outgoing changes..."
# hg outgoing

# Push changes (would push to remote)
echo "5. Pushing changes..."
# hg push --new-branch

# Pull changes
echo "6. Pulling latest changes..."
# hg pull
# hg update

echo ""
echo "=== Demo Complete ==="
echo "To use with actual remote:"
echo "1. Create repository on Bitbucket"
echo "2. Replace REPO_URL in script"
echo "3. Uncomment push/pull commands"
