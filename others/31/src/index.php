<!DOCTYPE html>
<html>
<head>
    <title>My Blog - LAMP Stack</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="/">My Blog</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/">Home</a>
                <a class="nav-link" href="/about.php">About</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1 class="text-center mb-4">Welcome to My Blog</h1>
        <p class="text-center text-muted">Built with LAMP Stack in Docker</p>
        <hr>

        <?php
        $host = getenv('DB_HOST') ?: 'mysql';
        $db = getenv('DB_NAME') ?: 'webapp';
        $user = getenv('DB_USER') ?: 'webuser';
        $pass = getenv('DB_PASS') ?: 'webpass';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $stmt = $pdo->query("
                SELECT p.*, u.username 
                FROM posts p 
                JOIN users u ON p.user_id = u.id 
                ORDER BY p.created_at DESC
            ");

            while ($post = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<div class="card mb-4">';
                echo '<div class="card-header bg-light">';
                echo '<h3>' . htmlspecialchars($post['title']) . '</h3>';
                echo '<small class="text-muted">By ' . htmlspecialchars($post['username']) . ' on ' . $post['created_at'] . '</small>';
                echo '</div>';
                echo '<div class="card-body">';
                echo '<p>' . nl2br(htmlspecialchars($post['content'])) . '</p>';
                
                // Get comments
                $commentStmt = $pdo->prepare("
                    SELECT c.*, u.username 
                    FROM comments c 
                    JOIN users u ON c.user_id = u.id 
                    WHERE c.post_id = ? 
                    ORDER BY c.created_at ASC
                ");
                $commentStmt->execute([$post['id']]);
                
                $comments = $commentStmt->fetchAll(PDO::FETCH_ASSOC);
                if (count($comments) > 0) {
                    echo '<hr><h5>Comments:</h5>';
                    foreach ($comments as $comment) {
                        echo '<div class="alert alert-secondary">';
                        echo '<strong>' . htmlspecialchars($comment['username']) . ':</strong> ';
                        echo htmlspecialchars($comment['comment']);
                        echo '<br><small class="text-muted">' . $comment['created_at'] . '</small>';
                        echo '</div>';
                    }
                }
                
                echo '</div>';
                echo '</div>';
            }
        } catch(PDOException $e) {
            echo '<div class="alert alert-danger">Database Error: ' . $e->getMessage() . '</div>';
        }
        ?>
    </div>
</body>
</html>
