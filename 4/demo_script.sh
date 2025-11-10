#!/bin/bash

# Mercurial Multi-User Demo Script

echo "=== Mercurial (hg) Multi-User Demonstration ==="
echo ""

# Check if hg is installed
if ! command -v hg &> /dev/null; then
    echo "Mercurial is not installed. Please install it first:"
    echo "  Ubuntu/Debian: sudo apt-get install mercurial"
    echo "  CentOS/RHEL: sudo yum install mercurial"
    exit 1
fi

# Create project directory
mkdir -p hg_demo
cd hg_demo

# Initialize repository
echo "1. Initializing Mercurial repository..."
hg init

# Team Leader - Initial commit
echo "2. Team Leader creating initial project..."
cat > .hg/hgrc << EOF
[ui]
username = Team Leader <leader@example.com>
EOF

echo "# Team Project" > README.md
echo "Main application code" > main.txt
hg add README.md main.txt
hg commit -m "Initial commit by Team Leader"

# Coder 1 - Feature branch
echo "3. Coder 1 working on login feature..."
cat > .hg/hgrc << EOF
[ui]
username = Coder 1 <coder1@example.com>
EOF

hg branch feature-login
echo "Login module implementation" > login.txt
hg add login.txt
hg commit -m "Add login feature by Coder 1"

# Coder 2 - Another feature branch
echo "4. Coder 2 working on API feature..."
hg update default
cat > .hg/hgrc << EOF
[ui]
username = Coder 2 <coder2@example.com>
EOF

hg branch feature-api
echo "API endpoints implementation" > api.txt
hg add api.txt
hg commit -m "Add API feature by Coder 2"

# Show branches
echo "5. Showing all branches..."
hg branches

# Team Leader - Merge features
echo "6. Team Leader merging features..."
hg update default
cat > .hg/hgrc << EOF
[ui]
username = Team Leader <leader@example.com>
EOF

hg merge feature-login
hg commit -m "Merge login feature"

hg merge feature-api
hg commit -m "Merge API feature"

# Show history
echo "7. Showing repository history..."
hg log --graph

echo ""
echo "=== Demo Complete ==="
