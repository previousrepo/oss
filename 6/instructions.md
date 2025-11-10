# SVN (Subversion) Multi-User Demonstration

## Installation
```bash
# Ubuntu/Debian
sudo apt-get install subversion

# CentOS/RHEL
sudo yum install subversion
```

## Setup Local SVN Repository

### 1. Create SVN Repository
```bash
svnadmin create /path/to/svn/repo
```

### 2. Import Initial Project
```bash
mkdir -p project/trunk project/branches project/tags
svn import project file:///path/to/svn/repo -m "Initial import"
```

### 3. Checkout (Team Leader)
```bash
svn checkout file:///path/to/svn/repo/trunk working_copy
cd working_copy
```

### 4. Add Files and Commit
```bash
echo "Main code" > main.txt
svn add main.txt
svn commit -m "Add main file" --username teamleader
```

### 5. Create Branch (Coder 1)
```bash
svn copy file:///path/to/svn/repo/trunk \
         file:///path/to/svn/repo/branches/feature-login \
         -m "Create login feature branch" --username coder1
```

### 6. Work on Branch
```bash
svn checkout file:///path/to/svn/repo/branches/feature-login
cd feature-login
echo "Login code" > login.txt
svn add login.txt
svn commit -m "Add login feature" --username coder1
```

### 7. Merge Branch to Trunk
```bash
cd working_copy
svn merge file:///path/to/svn/repo/branches/feature-login
svn commit -m "Merge login feature" --username teamleader
```

### 8. Show Differences
```bash
svn diff -r 1:2
svn log
```

## Git vs SVN Comparison

| Feature | Git | SVN |
|---------|-----|-----|
| Architecture | Distributed | Centralized |
| Repository | Full copy locally | Server-based |
| Offline Work | Full functionality | Limited (read-only) |
| Branching | Cheap and fast | Expensive (directory copy) |
| Merging | Advanced tracking | Basic, manual tracking |
| Speed | Very fast | Slower |
| Storage | Efficient | Can be large |
| Learning Curve | Steeper | Easier |
| Revision Numbers | SHA-1 hashes | Sequential numbers |
| Partial Checkout | No | Yes |
| Binary Files | Good | Better |
| Rename Tracking | Automatic | Manual |

## Key SVN Commands

```bash
svn checkout (co)    # Checkout repository
svn update (up)      # Update working copy
svn commit (ci)      # Commit changes
svn add              # Add files
svn delete (del)     # Delete files
svn copy (cp)        # Create branch/tag
svn merge            # Merge changes
svn diff             # Show differences
svn log              # Show history
svn status (st)      # Show status
svn revert           # Revert changes
```
