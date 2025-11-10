# Mercurial (hg) Multi-User Demonstration

## Installation
```bash
# Ubuntu/Debian
sudo apt-get install mercurial

# CentOS/RHEL
sudo yum install mercurial

# Verify installation
hg --version
```

## Setup Instructions

### 1. Initialize Mercurial Repository
```bash
mkdir hg_project
cd hg_project
hg init
```

### 2. Configure User (Team Leader)
```bash
cat > .hg/hgrc << EOF
[ui]
username = Team Leader <leader@example.com>
EOF
```

### 3. Create Initial Code
```bash
echo "# Project" > README.md
hg add README.md
hg commit -m "Initial commit by team leader"
```

### 4. Create Branch (Coder 1)
```bash
# Update user config
cat > .hg/hgrc << EOF
[ui]
username = Coder 1 <coder1@example.com>
EOF

hg branch feature-login
echo "Login functionality" > login.txt
hg add login.txt
hg commit -m "Add login feature"
```

### 5. Create Another Branch (Coder 2)
```bash
hg update default
cat > .hg/hgrc << EOF
[ui]
username = Coder 2 <coder2@example.com>
EOF

hg branch feature-dashboard
echo "Dashboard functionality" > dashboard.txt
hg add dashboard.txt
hg commit -m "Add dashboard feature"
```

### 6. Merge Branches (Team Leader)
```bash
hg update default
cat > .hg/hgrc << EOF
[ui]
username = Team Leader <leader@example.com>
EOF

hg merge feature-login
hg commit -m "Merge login feature"
hg merge feature-dashboard
hg commit -m "Merge dashboard feature"
```

### 7. Show Differences
```bash
hg diff -r default:feature-login
hg log --graph
```

## Mercurial vs SVN Comparison

| Feature | Mercurial (hg) | SVN |
|---------|----------------|-----|
| Architecture | Distributed | Centralized |
| Offline Work | Full functionality | Limited (read-only) |
| Branching | Lightweight | Directory-based |
| Merging | Advanced tracking | Basic merging |
| Speed | Fast | Slower |
| Learning Curve | Moderate | Easy |
| Commands | Intuitive | Simple |
| History | Complete local copy | Server-based |
| Rename Tracking | Excellent | Good |
| Binary Files | Good support | Better support |

## Key Mercurial Commands

```bash
hg init          # Initialize repository
hg add           # Add files
hg commit        # Commit changes
hg branch        # Create branch
hg merge         # Merge branches
hg update        # Switch branches
hg diff          # Show differences
hg log           # Show history
hg status        # Show status
hg pull          # Pull changes
hg push          # Push changes
```
