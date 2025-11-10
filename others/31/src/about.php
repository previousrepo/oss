<!DOCTYPE html>
<html>
<head>
    <title>About - My Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="/">My Blog</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/">Home</a>
                <a class="nav-link active" href="/about.php">About</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1>About This Application</h1>
        <hr>
        
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4>LAMP Stack Components</h4>
                    </div>
                    <div class="card-body">
                        <ul>
                            <li><strong>L</strong>inux: Ubuntu/Debian (via Docker)</li>
                            <li><strong>A</strong>pache: Web Server</li>
                            <li><strong>M</strong>ySQL: Database Server</li>
                            <li><strong>P</strong>HP: Server-side scripting</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h4>Features</h4>
                    </div>
                    <div class="card-body">
                        <ul>
                            <li>Blog posts with authors</li>
                            <li>Comments system</li>
                            <li>MySQL database integration</li>
                            <li>Responsive Bootstrap design</li>
                            <li>Docker containerization</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card mt-4">
            <div class="card-header bg-info text-white">
                <h4>System Information</h4>
            </div>
            <div class="card-body">
                <?php
                echo "<p><strong>PHP Version:</strong> " . phpversion() . "</p>";
                echo "<p><strong>Server Software:</strong> " . $_SERVER['SERVER_SOFTWARE'] . "</p>";
                echo "<p><strong>Document Root:</strong> " . $_SERVER['DOCUMENT_ROOT'] . "</p>";
                
                $host = getenv('DB_HOST') ?: 'mysql';
                $db = getenv('DB_NAME') ?: 'webapp';
                $user = getenv('DB_USER') ?: 'webuser';
                
                try {
                    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, getenv('DB_PASS') ?: 'webpass');
                    $version = $pdo->query('SELECT VERSION()')->fetchColumn();
                    echo "<p><strong>MySQL Version:</strong> " . $version . "</p>";
                    echo "<p><strong>Database:</strong> " . $db . "</p>";
                } catch(PDOException $e) {
                    echo "<p class='text-danger'>Database connection failed</p>";
                }
                ?>
            </div>
        </div>
    </div>
</body>
</html>
