# MantisBT Bug Tracking Demonstration

## Installation

### Using Docker (Easiest)
```bash
docker run -d --name mantisbt \
  -p 8989:80 \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=bugtracker \
  -e MYSQL_USER=mantisbt \
  -e MYSQL_PASSWORD=mantisbt \
  vimagick/mantisbt
```

### Manual Installation
```bash
# Install dependencies
sudo apt-get install apache2 php php-mysql mysql-server

# Download MantisBT
wget https://sourceforge.net/projects/mantisbt/files/latest/download -O mantisbt.tar.gz
tar -xzf mantisbt.tar.gz
sudo mv mantisbt /var/www/html/

# Configure database
mysql -u root -p
CREATE DATABASE bugtracker;
CREATE USER 'mantisbt'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON bugtracker.* TO 'mantisbt'@'localhost';
FLUSH PRIVILEGES;

# Access http://localhost/mantisbt and follow setup wizard
```

## Bug Identification Example

### Sample Open Source Project Analysis
Let's analyze a simple Python project:

```python
# Example buggy code
def calculate_average(numbers):
    total = 0
    for num in numbers:
        total += num
    return total / len(numbers)  # Bug 1: Division by zero if empty list

def find_user(user_id):
    users = get_users()
    for user in users:
        if user.id == user_id:
            return user
    # Bug 2: No return statement for not found case

def process_data(data):
    result = []
    for item in data:
        result.append(item.upper())  # Bug 3: Assumes string, no type checking
    return result
```

### Three Bugs to Report

**Bug 1: Division by Zero Error**
- Type: Runtime Error / Exception Handling
- Severity: High
- Priority: High
- Description: Function crashes when empty list is passed
- Steps to Reproduce: Call calculate_average([])
- Expected: Return 0 or raise meaningful error
- Actual: ZeroDivisionError exception

**Bug 2: Missing Return Value**
- Type: Logic Error
- Severity: Medium
- Priority: Medium
- Description: Function returns None when user not found
- Steps to Reproduce: Call find_user with non-existent ID
- Expected: Return None explicitly or raise exception
- Actual: Implicit None return

**Bug 3: Type Safety Issue**
- Type: Type Error / Input Validation
- Severity: Medium
- Priority: Low
- Description: No type checking for input data
- Steps to Reproduce: Pass non-string items to process_data
- Expected: Handle or validate input types
- Actual: AttributeError on non-string types

## Creating Bug Reports in MantisBT

1. Login to MantisBT
2. Click "Report Issue"
3. Fill in:
   - Category
   - Reproducibility
   - Severity
   - Priority
   - Summary
   - Description
   - Steps to Reproduce
   - Additional Information
4. Attach code snippets or screenshots
5. Submit

## FOSS Bug Tracking Tools Comparison

| Tool | Language | Hosting | Complexity | Best For |
|------|----------|---------|------------|----------|
| **MantisBT** | PHP | Self-hosted | Low | Small-medium teams |
| **Bugzilla** | Perl | Self-hosted | High | Large enterprises |
| **Redmine** | Ruby | Self-hosted | Medium | Project management + bugs |
| **Trac** | Python | Self-hosted | Medium | Integrated with wiki/SCM |
| **JIRA** | Java | Cloud/Self | High | Enterprise (not fully FOSS) |
| **GitLab Issues** | Ruby | Cloud/Self | Medium | Git-integrated workflows |
| **GitHub Issues** | - | Cloud | Low | Open source projects |
| **Taiga** | Python/JS | Cloud/Self | Medium | Agile teams |
| **Phabricator** | PHP | Self-hosted | High | Code review + bugs |
| **YouTrack** | Java | Cloud/Self | Medium | Agile teams (freemium) |

### Feature Comparison

| Feature | MantisBT | Bugzilla | Redmine | Trac |
|---------|----------|----------|---------|------|
| Easy Setup | ✓ | ✗ | ✓ | ✓ |
| Email Notifications | ✓ | ✓ | ✓ | ✓ |
| Custom Fields | ✓ | ✓ | ✓ | ✓ |
| Time Tracking | ✓ | ✓ | ✓ | ✓ |
| Roadmap | ✓ | ✗ | ✓ | ✓ |
| Wiki Integration | ✗ | ✗ | ✓ | ✓ |
| REST API | ✓ | ✓ | ✓ | ✗ |
| Mobile Support | Limited | Limited | ✓ | Limited |
