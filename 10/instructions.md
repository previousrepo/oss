# Joomla CMS Demonstration

## Installation

### Using Docker (Recommended)
```bash
docker run -d --name joomla \
  -p 8080:80 \
  -e JOOMLA_DB_HOST=mysql \
  -e JOOMLA_DB_USER=joomla \
  -e JOOMLA_DB_PASSWORD=joomla \
  -e JOOMLA_DB_NAME=joomla \
  joomla:latest

docker run -d --name mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=joomla \
  -e MYSQL_USER=joomla \
  -e MYSQL_PASSWORD=joomla \
  mysql:5.7
```

### Manual Installation
```bash
# Install LAMP stack
sudo apt-get install apache2 mysql-server php php-mysql \
  php-xml php-mbstring php-zip php-gd php-curl

# Download Joomla
wget https://downloads.joomla.org/cms/joomla4/4-3-0/Joomla_4-3-0-Stable-Full_Package.tar.gz
sudo mkdir /var/www/html/joomla
sudo tar -xzf Joomla_4-3-0-Stable-Full_Package.tar.gz -C /var/www/html/joomla

# Set permissions
sudo chown -R www-data:www-data /var/www/html/joomla
sudo chmod -R 755 /var/www/html/joomla

# Create database
mysql -u root -p
CREATE DATABASE joomla;
CREATE USER 'joomla'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON joomla.* TO 'joomla'@'localhost';
FLUSH PRIVILEGES;

# Access http://localhost/joomla and complete setup wizard
```

## User Management

### User Roles in Joomla
1. **Super User**: Full access
2. **Administrator**: Backend access
3. **Manager**: Content management
4. **Author**: Create and edit own articles
5. **Editor**: Edit all articles
6. **Publisher**: Publish articles
7. **Registered**: Frontend access
8. **Guest**: Public access

### Creating Users
1. Login to admin panel
2. Navigate to Users → Manage
3. Click "New"
4. Fill in details and assign role
5. Save

## Core Features

### 1. Content Management
- Articles
- Categories
- Media Manager
- Menu Management

### 2. Extensions
- Components
- Modules
- Plugins
- Templates

### 3. User Management
- User groups
- Access levels
- User permissions

### 4. Multilingual Support
- Multiple language packs
- Content translation

### 5. SEO Features
- SEF URLs
- Meta tags
- Sitemap generation


## Joomla vs Moodle vs Schoology Comparison

| Feature | Joomla | Moodle | Schoology |
|---------|--------|--------|-----------|
| **Primary Purpose** | General CMS | Learning Management | Learning Management |
| **Cost** | Free | Free | Freemium |
| **Target Audience** | Websites | Education | K-12 Education |
| **Ease of Use** | Moderate | Complex | Easy |
| **Customization** | High | High | Limited |
| **E-learning Features** | Via extensions | Built-in | Built-in |
| **Course Management** | Limited | Excellent | Excellent |
| **Grading System** | No | Yes | Yes |
| **Quiz/Assessment** | Via extensions | Built-in | Built-in |
| **Mobile App** | Limited | Yes | Yes |
| **Community** | Large | Very large | Moderate |
| **Hosting** | Self-hosted | Self-hosted | Cloud |
| **Integration** | Many plugins | Many plugins | Limited |
| **Best For** | Corporate sites | Universities | Schools |
