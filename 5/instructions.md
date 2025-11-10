# Mercurial with Remote Repository

## Note
GitHub doesn't natively support Mercurial. Options:
1. Use Bitbucket (supports Mercurial natively)
2. Use hg-git extension to push to GitHub
3. Use a self-hosted Mercurial server

## Setup with Bitbucket

### 1. Create Repository on Bitbucket
- Go to bitbucket.org
- Create new repository
- Select Mercurial as VCS

### 2. Clone Repository
```bash
hg clone https://bitbucket.org/YOUR_USERNAME/project
cd project
```

### 3. Configure User (Team Leader)
```bash
cat > .hg/hgrc << EOF
[ui]
username = Team Leader <leader@example.com>
EOF
```

### 4. Create and Push Feature
```bash
echo "Initial code" > main.py
hg add main.py
hg commit -m "Initial commit"
hg push
```

### 5. Pull Changes
```bash
hg pull
hg update
```

### 6. Branch and Push
```bash
hg branch feature-auth
echo "Authentication code" > auth.py
hg add auth.py
hg commit -m "Add authentication"
hg push --new-branch
```

## Using hg-git Extension (for GitHub)

### 1. Install hg-git
```bash
pip install hg-git
```

### 2. Configure Mercurial
```bash
cat >> ~/.hgrc << EOF
[extensions]
hggit =
EOF
```

### 3. Clone from GitHub
```bash
hg clone git+https://github.com/USER/REPO.git
```

### 4. Push to GitHub
```bash
hg push git+https://github.com/USER/REPO.git
```

## Mercurial vs Git Comparison

| Feature | Mercurial | Git |
|---------|-----------|-----|
| Commands | More consistent | More powerful but complex |
| Learning Curve | Easier | Steeper |
| Branching | Named branches | Lightweight branches |
| Performance | Good | Excellent |
| Popularity | Less popular | Very popular |
| Hosting | Bitbucket (limited) | GitHub, GitLab, many others |
| Windows Support | Better | Good (via Git Bash) |
| Extensions | Built-in | Many plugins |
| Staging Area | No | Yes (index) |
| History Editing | Limited | Extensive (rebase, etc.) |

## Key Mercurial Remote Commands

```bash
hg clone URL          # Clone repository
hg pull               # Pull changes
hg push               # Push changes
hg incoming           # Show incoming changes
hg outgoing           # Show outgoing changes
hg push --new-branch  # Push new branch
```
