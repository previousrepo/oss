# Git with GitHub Multi-User Demonstration

## Setup Instructions

### 1. Create GitHub Repository
- Go to github.com and create a new repository
- Name it: `team-project-demo`
- Initialize with README

### 2. Clone Repository (Team Leader)
```bash
git clone https://github.com/YOUR_USERNAME/team-project-demo.git
cd team-project-demo
git config user.name "Team Leader"
git config user.email "leader@example.com"
```

### 3. Create and Push Feature (Coder 1)
```bash
git checkout -b feature-auth
git config user.name "Coder 1"
git config user.email "coder1@example.com"
echo "Authentication module" > auth.py
git add auth.py
git commit -m "Add authentication module"
git push origin feature-auth
```

### 4. Pull and Review (Team Leader)
```bash
git checkout main
git pull origin main
git fetch origin feature-auth
git checkout feature-auth
# Review code
git checkout main
git merge feature-auth
git push origin main
```

### 5. Fork Demonstration
- Fork the repository on GitHub to another account
- Clone the forked repository
- Make changes and create pull request

### 6. Pull Latest Changes
```bash
git pull origin main
```

## Git vs Mercurial (hg) Comparison

| Feature | Git | Mercurial |
|---------|-----|-----------|
| Popularity | More popular | Less popular |
| Commands | More complex | Simpler, more intuitive |
| Performance | Faster for large repos | Good performance |
| Branching | Lightweight branches | Named branches |
| Learning Curve | Steeper | Gentler |
| Hosting | GitHub, GitLab, Bitbucket | Bitbucket (limited) |
| Extensions | Many plugins | Built-in extensions |
| Windows Support | Good (Git Bash) | Better native support |
