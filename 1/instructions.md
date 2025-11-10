# Git Offline Multi-User Demonstration

## Setup Instructions

### 1. Initialize Git Repository
```bash
mkdir project
cd project
git init
git config user.name "Team Leader"
git config user.email "leader@example.com"
```

### 2. Create Initial Code
```bash
echo "# Project" > README.md
git add README.md
git commit -m "Initial commit by team leader"
```

### 3. Simulate Multiple Users (Coder 1)
```bash
git config user.name "Coder 1"
git config user.email "coder1@example.com"
git checkout -b feature-coder1
echo "Feature by Coder 1" > feature1.txt
git add feature1.txt
git commit -m "Add feature 1"
```

### 4. Simulate Multiple Users (Coder 2)
```bash
git checkout main
git config user.name "Coder 2"
git config user.email "coder2@example.com"
git checkout -b feature-coder2
echo "Feature by Coder 2" > feature2.txt
git add feature2.txt
git commit -m "Add feature 2"
```

### 5. Demonstrate Merge (Team Leader)
```bash
git checkout main
git config user.name "Team Leader"
git config user.email "leader@example.com"
git merge feature-coder1
git merge feature-coder2
```

### 6. Demonstrate Code Diff
```bash
git diff main feature-coder1
git log --graph --oneline --all
```

## Git vs SVN Comparison

| Feature | Git | SVN |
|---------|-----|-----|
| Architecture | Distributed | Centralized |
| Offline Work | Full functionality | Limited |
| Branching | Lightweight, fast | Heavy, slower |
| Merging | Advanced algorithms | Basic merging |
| Speed | Faster | Slower |
| Storage | Complete history locally | Only working copy |
| Learning Curve | Steeper | Easier |
