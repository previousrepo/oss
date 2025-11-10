# Question 29: LAMP Stack with MediaWiki on Port 8080

## IMPORTANT: Two-Step Setup Required

MediaWiki requires a configuration file (LocalSettings.php) that is generated 
during the web-based installation wizard. This is normal!

## Step 1: Initial Setup

```bash
cd others/29

# Start containers
docker-compose up -d

# Wait for MySQL to be ready (about 30 seconds)
docker-compose logs -f mysql
# Wait until you see: "ready for connections"
```

## Step 2: MediaWiki Installation Wizard

1. **Open browser:** http://localhost:8080
2. **You'll see an error** - This is EXPECTED! Click "set up the wiki"
3. **Follow the installation wizard:**
   - Language: English → Continue
   - Environment checks → Continue
   - Database type: **MySQL**
   - Database host: **mysql** (container name)
   - Database name: **mediawiki**
   - Database username: **wikiuser**
   - Database password: **wikipass**
   - Continue through all steps
   - Set wiki name (e.g., "My Wiki")
   - Create admin account (remember credentials!)
   - Continue until complete

4. **Download LocalSettings.php**
   - At the end, it will offer to download `LocalSettings.php`
   - Save it to your computer

5. **Copy LocalSettings.php to project folder:**
   ```bash
   # Copy the downloaded file to others/29/
   cp ~/Downloads/LocalSettings.php others/29/
   ```

6. **Restart containers:**
   ```bash
   docker-compose restart mediawiki
   ```

7. **Access MediaWiki:** http://localhost:8080
   - Now it should work without errors!

## Alternative: Skip Installation (Use Pre-configured)

If you want to skip the wizard, create a minimal LocalSettings.php:

```bash
cat > others/29/LocalSettings.php << 'EOF'
<?php
if ( !defined( 'MEDIAWIKI' ) ) {
    exit;
}

$wgSitename = "My Wiki";
$wgMetaNamespace = "My_Wiki";
$wgScriptPath = "";
$wgServer = "http://localhost:8080";
$wgResourceBasePath = $wgScriptPath;

$wgDBtype = "mysql";
$wgDBserver = "mysql";
$wgDBname = "mediawiki";
$wgDBuser = "wikiuser";
$wgDBpassword = "wikipass";
$wgDBprefix = "";
$wgDBTableOptions = "ENGINE=InnoDB, DEFAULT CHARSET=binary";

$wgMainCacheType = CACHE_NONE;
$wgMemCachedServers = [];

$wgEnableEmail = false;
$wgEnableUserEmail = false;

$wgEmergencyContact = "apache@localhost";
$wgPasswordSender = "apache@localhost";

$wgEnotifUserTalk = false;
$wgEnotifWatchlist = false;
$wgEmailAuthentication = true;

$wgLanguageCode = "en";
$wgSecretKey = "$(openssl rand -hex 32)";

$wgDiff3 = "/usr/bin/diff3";
$wgDefaultSkin = "vector";
EOF

# Then restart
docker-compose restart mediawiki
```

## Access Services

- MediaWiki: http://localhost:8080
- phpMyAdmin: http://localhost:8081

## Database Details

- Host: mysql
- Database: mediawiki
- User: wikiuser
- Password: wikipass
- Root Password: rootpass

## Verify LAMP Stack

```bash
# Check Apache
docker exec mediawiki-app apache2 -v

# Check PHP
docker exec mediawiki-app php -v

# Check MySQL
docker exec mediawiki-mysql mysql --version

# Check Linux
docker exec mediawiki-app cat /etc/os-release
```

## Stop and Clean Up

```bash
docker-compose down

# Remove volumes
docker-compose down -v
```

## Features

- Complete LAMP stack
- MediaWiki CMS
- phpMyAdmin for database management
- Persistent data storage
- Health checks
