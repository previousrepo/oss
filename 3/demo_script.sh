#!/bin/bash

# Comprehensive Git Demo with Diff and Merge

echo "=== Comprehensive Git Workflow Demo ==="
echo ""

# Setup
mkdir -p git_comprehensive_demo
cd git_comprehensive_demo
git init

# Team Leader - Initial setup
echo "1. Team Leader initializing project..."
git config user.name "Team Leader"
git config user.email "leader@example.com"
cat > main.py << 'EOF'
def main():
    print("Main application")
    
if __name__ == "__main__":
    main()
EOF
git add main.py
git commit -m "Initial project setup"

# Coder 1 - Feature branch
echo "2. Coder 1 adding authentication..."
git checkout -b feature-auth
git config user.name "Coder 1"
git config user.email "coder1@example.com"
cat > auth.py << 'EOF'
def login(username, password):
    # Authentication logic
    return True

def logout():
    # Logout logic
    pass
EOF
git add auth.py
git commit -m "Add authentication module"

# Coder 2 - Another feature
echo "3. Coder 2 adding database module..."
git checkout main
git checkout -b feature-database
git config user.name "Coder 2"
git config user.email "coder2@example.com"
cat > database.py << 'EOF'
def connect():
    # Database connection
    return "Connected"

def query(sql):
    # Execute query
    pass
EOF
git add database.py
git commit -m "Add database module"

# Show differences
echo "4. Showing code differences..."
echo "--- Diff between main and feature-auth ---"
git diff main feature-auth

echo ""
echo "--- Diff between main and feature-database ---"
git diff main feature-database

# Merge features
echo "5. Team Leader merging features..."
git checkout main
git config user.name "Team Leader"
git config user.email "leader@example.com"
git merge feature-auth -m "Merge authentication feature"
git merge feature-database -m "Merge database feature"

# Show final state
echo "6. Final project state..."
git log --graph --oneline --all
ls -la

echo ""
echo "=== Demo Complete ==="
