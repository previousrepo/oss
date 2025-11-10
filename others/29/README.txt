IMPORTANT: LocalSettings.php Setup
===================================

LocalSettings.php is NOT included by default because it must be generated
by MediaWiki's installation wizard.

STEPS:
1. Start containers: docker-compose up -d
2. Visit http://localhost:8080
3. Complete the installation wizard
4. Download LocalSettings.php
5. Place it in this folder (others/29/)
6. Uncomment the volume mount in docker-compose.yml:
   - ./LocalSettings.php:/var/www/html/LocalSettings.php:ro
7. Restart: docker-compose down
8. docker-compose up -d

OR use the quick setup command in instructions.md to create a basic one.
