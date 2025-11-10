# MantisBT Bug Tracker - Complete Guide

## Setup

```bash
# Clean start
docker-compose down -v

# Start containers
docker-compose up -d --build

# Wait for database initialization (first time takes 30-40 seconds)
sleep 40
```

The database will automatically initialize on first run.

## Access MantisBT

Open: http://localhost:8080

Login:
- Username: **mantisbt**
- Password: **mantisbt**

## Push to Docker Hub

```bash
# Tag the image
docker tag 34-mantisbt YOUR_USERNAME/mantisbt

# Push to Docker Hub
docker push YOUR_USERNAME/mantisbt
```

## Pull and Run from Docker Hub

```bash
# Pull the image
docker pull YOUR_USERNAME/mantisbt

# Run with docker-compose (recommended)
docker-compose up -d
```

## Stop

```bash
docker-compose down
```

## Complete Cleanup

```bash
docker-compose down -v
```

## How to Use MantisBT

### 1. Report a Bug

**Main Menu → Report Issue**

Fill in:
- **Category**: General, Feature Request, Bug, etc.
- **Reproducibility**: Always, Sometimes, Random
- **Severity**: Feature, Trivial, Text, Tweak, Minor, Major, Crash, Block
- **Priority**: None, Low, Normal, High, Urgent, Immediate
- **Summary**: Short description (e.g., "Login button not working")
- **Description**: Detailed explanation
  ```
  Steps to Reproduce:
  1. Go to login page
  2. Enter credentials
  3. Click login button
  
  Expected: User should login
  Actual: Nothing happens
  ```
- **Steps to Reproduce**: Numbered list
- **Additional Information**: Browser, OS, version, etc.
- **Upload File**: Screenshots, logs (optional)

Click **Submit Issue**

### 2. View All Issues

**Main Menu → View Issues**

You'll see:
- Issue ID
- Category
- Severity
- Status (New, Assigned, Resolved, Closed)
- Summary
- Reporter
- Date

Click any issue to see details.

### 3. Update an Issue

Click on issue → **Update Issue** button

You can:
- Change **Status**: New → Acknowledged → Confirmed → Assigned → Resolved → Closed
- Change **Priority**: Low → High
- Add **Notes**: Comments, updates
- Assign to user
- Upload files

### 4. Create Users

**Manage → Manage Users → Create New Account**

- Username: developer1
- Real Name: John Doe
- Email: john@example.com
- Access Level: Reporter, Developer, Manager, Administrator

### 5. Create Projects

**Manage → Manage Projects → Create New Project**

- Project Name: MyApp
- Status: Development, Release, Stable
- Description: Project details
- View Status: Public or Private

### 6. Assign Issues

Open issue → Click **Assign To** → Select user → Save

### 7. Add Notes/Comments

Open issue → Scroll to **Add Note** section → Type comment → Submit

### 8. Filter Issues

**View Issues** → Click **Filters**

Filter by:
- Reporter
- Status
- Priority
- Severity
- Category
- Date range

### 9. Generate Reports

**Summary** → View statistics:
- Issues by status
- Issues by severity
- Issues by category
- Timeline

### 10. Close an Issue

Open issue → Change status to **Resolved** → Add resolution note → Save

Then change to **Closed** when verified.

## Example Bug Report

**Summary**: Application crashes on startup

**Description**:
```
The application crashes immediately after clicking the icon.

Environment:
- OS: Ubuntu 22.04
- Version: 2.0.1
- Browser: Chrome 120

Steps to Reproduce:
1. Double-click application icon
2. Splash screen appears
3. Application crashes with error "Segmentation fault"

Expected: Application should start normally
Actual: Crashes with segmentation fault

Logs attached.
```

**Category**: Bug
**Severity**: Crash
**Priority**: High
**Reproducibility**: Always

## Push to Docker Hub

```bash
docker tag 34-mantisbt YOUR_USERNAME/mantisbt
docker push YOUR_USERNAME/mantisbt
```

## Stop

```bash
docker-compose down
```
