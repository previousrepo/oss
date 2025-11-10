# Bugzilla Bug Tracking Demonstration

## Installation

### Using Docker
```bash
docker run -d --name bugzilla \
  -p 8080:80 \
  -e BUGZILLA_ADMIN_EMAIL=admin@example.com \
  -e BUGZILLA_ADMIN_PASSWORD=admin123 \
  dklawren/docker-bugzilla
```

### Manual Installation (Ubuntu)
```bash
# Install dependencies
sudo apt-get install apache2 mysql-server libappconfig-perl \
  libdate-calc-perl libtemplate-perl libmime-perl \
  libemail-sender-perl libdatetime-timezone-perl \
  libdatetime-perl libemail-mime-perl libdbi-perl \
  libdbd-mysql-perl libcgi-pm-perl libmath-random-isaac-perl \
  libmath-random-isaac-xs-perl apache2-mpm-prefork \
  libapache2-mod-perl2 libapache2-mod-perl2-dev \
  libchart-perl libxml-perl libxml-twig-perl \
  perlmagick libgd-graph-perl libtemplate-plugin-gd-perl \
  libsoap-lite-perl libhtml-scrubber-perl libjson-rpc-perl \
  libdaemon-generic-perl libtheschwartz-perl \
  libtest-taint-perl libauthen-radius-perl \
  libfile-slurp-perl libencode-detect-perl \
  libmodule-build-perl libnet-ldap-perl \
  libauthen-sasl-perl libtemplate-perl-doc libfile-mimeinfo-perl \
  libhtml-formattext-withlinks-perl libgd-dev \
  libmysqlclient-dev lynx-cur graphviz python-sphinx

# Download Bugzilla
cd /var/www/html
sudo wget https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-5.0.6.tar.gz
sudo tar -xzf bugzilla-5.0.6.tar.gz
sudo mv bugzilla-5.0.6 bugzilla

# Run checksetup
cd bugzilla
sudo ./checksetup.pl

# Configure database and admin user
# Follow prompts

# Access http://localhost/bugzilla
```

## Three Bug Examples

### Bug 1: Memory Leak in Loop
```python
# Buggy code
class DataProcessor:
    def __init__(self):
        self.cache = []
    
    def process_files(self, file_list):
        for file in file_list:
            data = self.load_large_file(file)
            self.cache.append(data)  # Never cleared!
            self.process(data)
```

**Bug Report:**
- Type: Memory Leak / Resource Management
- Severity: Critical
- Priority: High
- Component: Data Processing
- Description: Cache grows indefinitely causing memory exhaustion
- Impact: Application crashes after processing many files

### Bug 2: SQL Injection Vulnerability
```python
# Buggy code
def get_user(username):
    query = f"SELECT * FROM users WHERE username = '{username}'"
    return db.execute(query)
```

**Bug Report:**
- Type: Security Vulnerability / SQL Injection
- Severity: Critical
- Priority: Urgent
- Component: Authentication
- Description: User input directly concatenated into SQL query
- Impact: Database compromise, data theft

### Bug 3: Race Condition
```python
# Buggy code
balance = 1000

def withdraw(amount):
    if balance >= amount:
        time.sleep(0.1)  # Simulating processing
        balance -= amount
        return True
    return False
```

**Bug Report:**
- Type: Concurrency Issue / Race Condition
- Severity: High
- Priority: High
- Component: Transaction Processing
- Description: No locking mechanism for concurrent withdrawals
- Impact: Negative balance, financial loss

## Bugzilla Workflow

1. **Report Bug**: User submits bug with details
2. **Triage**: Team reviews and assigns priority/severity
3. **Assign**: Bug assigned to developer
4. **Fix**: Developer fixes and marks as RESOLVED
5. **Verify**: QA verifies fix
6. **Close**: Bug marked as VERIFIED/CLOSED

## Comparison with Other Bug Tracking Tools

| Feature | Bugzilla | JIRA | MantisBT | GitHub Issues |
|---------|----------|------|----------|---------------|
| Cost | Free | Paid | Free | Free |
| Complexity | High | High | Low | Low |
| Customization | Extensive | Extensive | Moderate | Limited |
| Learning Curve | Steep | Steep | Gentle | Easy |
| Email Integration | Excellent | Good | Good | Good |
| Workflow | Customizable | Highly customizable | Basic | Simple |
| Reporting | Advanced | Advanced | Basic | Basic |
| API | REST/XML-RPC | REST | REST/SOAP | REST |
| Best For | Large projects | Enterprise | Small teams | Open source |

## How Bug Tracking Improves Code Quality

### 1. **Systematic Issue Management**
- Prevents bugs from being forgotten
- Ensures all issues are addressed
- Provides accountability

### 2. **Knowledge Base**
- Historical record of issues
- Solutions documented for future reference
- Pattern recognition for recurring issues

### 3. **Priority Management**
- Critical bugs addressed first
- Resources allocated efficiently
- Clear roadmap for fixes

### 4. **Communication**
- Centralized discussion platform
- Stakeholder visibility
- Reduces miscommunication

### 5. **Metrics and Analytics**
- Track bug trends over time
- Identify problematic code areas
- Measure team performance

### 6. **Quality Assurance**
- Verification workflow ensures fixes work
- Regression testing triggered
- Release quality gates

### 7. **Continuous Improvement**
- Root cause analysis
- Process improvements
- Developer learning

### 8. **Traceability**
- Link bugs to commits
- Track feature requests
- Audit trail for compliance

### 9. **Customer Satisfaction**
- Transparent issue resolution
- Faster response times
- Better product reliability

### 10. **Team Collaboration**
- Cross-functional visibility
- Knowledge sharing
- Reduced duplication of effort
