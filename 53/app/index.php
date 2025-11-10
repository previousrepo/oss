<!DOCTYPE html>
<html>
<head>
    <title>LAMP Stack App</title>
    <style>
        body { font-family: Arial; max-width: 800px; margin: 50px auto; padding: 20px; }
        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
    <h1>LAMP Stack Application</h1>
    
    <?php
    // Database connection
    $conn = new mysqli('mysql', 'root', 'root', 'myapp');
    
    if ($conn->connect_error) {
        echo '<p class="error">❌ Database connection failed: ' . $conn->connect_error . '</p>';
    } else {
        echo '<p class="success">✅ Database connected successfully!</p>';
        
        // Create table if not exists
        $sql = "CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100),
            email VARCHAR(100),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )";
        $conn->query($sql);
        
        // Insert sample data
        if (isset($_GET['add'])) {
            $name = "User " . rand(1, 100);
            $email = "user" . rand(1, 100) . "@example.com";
            $conn->query("INSERT INTO users (name, email) VALUES ('$name', '$email')");
            header("Location: index.php");
            exit;
        }
        
        // Display users
        $result = $conn->query("SELECT * FROM users ORDER BY id DESC");
        echo '<h2>Users in Database</h2>';
        echo '<a href="?add=1"><button>Add Random User</button></a>';
        echo '<table border="1" cellpadding="10" style="margin-top: 20px; width: 100%;">';
        echo '<tr><th>ID</th><th>Name</th><th>Email</th><th>Created</th></tr>';
        
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['id'] . '</td>';
                echo '<td>' . $row['name'] . '</td>';
                echo '<td>' . $row['email'] . '</td>';
                echo '<td>' . $row['created_at'] . '</td>';
                echo '</tr>';
            }
        } else {
            echo '<tr><td colspan="4">No users yet. Click "Add Random User" to add one.</td></tr>';
        }
        echo '</table>';
        
        $conn->close();
    }
    ?>
    
    <hr>
    <h3>PHP Info</h3>
    <p>PHP Version: <?php echo phpversion(); ?></p>
    <p>Server: <?php echo $_SERVER['SERVER_SOFTWARE']; ?></p>
</body>
</html>