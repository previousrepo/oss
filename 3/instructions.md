# Git/GitHub vs Gitea Comprehensive Demo

## Complete Git Workflow

### 1. Repository Setup
```bash
git clone https://github.com/YOUR_USERNAME/project.git
cd project
```

### 2. Multi-User Workflow
```bash
# Team Leader
git config user.name "Team Leader"
git config user.email "leader@example.com"

# Create feature branch
git checkout -b feature-user-management
echo "User management code" > users.py
git add users.py
git commit -m "Add user management"
git push origin feature-user-management
```

### 3. Code Diff Demonstration
```bash
# Compare branches
git diff main feature-user-management

# Compare specific files
git diff main:users.py feature-user-management:users.py

# Show commit differences
git log main..feature-user-management
```

### 4. Merge Operations
```bash
git checkout main
git merge feature-user-management
git push origin main
```

### 5. Fork Workflow
- Fork repository on GitHub
- Clone forked repository
- Make changes
- Push to fork
- Create pull request to original repository

## Git/GitHub vs Gitea Comparison

| Aspect | Git/GitHub | Gitea |
|--------|-----------|-------|
| Hosting | Cloud-based (GitHub) | Self-hosted |
| Cost | Free tier + paid plans | Free and open source |
| Setup | No setup needed | Requires server setup |
| Features | Extensive (Actions, Pages, etc.) | Core Git features |
| Privacy | Public/Private repos | Full control over data |
| Integration | Many third-party integrations | Limited integrations |
| Performance | Depends on GitHub | Depends on your server |
| Maintenance | Managed by GitHub | You maintain it |
| UI/UX | Polished, feature-rich | Simple, lightweight |
| API | Comprehensive REST API | Compatible Git API |

## When to Use Gitea

1. **Privacy Requirements**: Need complete control over source code
2. **Cost Savings**: Large teams without budget for GitHub
3. **Compliance**: Regulatory requirements for data location
4. **Customization**: Need to modify the platform itself
5. **Air-gapped Environments**: No internet connectivity
