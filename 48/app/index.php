<!DOCTYPE html>
<html>
<head>
    <title>LAMP Stack App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h1 { color: #333; }
        .status {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .error {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        form {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background: #667eea;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #5568d3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 LAMP Stack Application</h1>
        
        <?php
        // Database connection
        $host = getenv('DB_HOST') ?: 'mysql';
        $dbname = getenv('DB_NAME') ?: 'webapp';
        $username = getenv('DB_USER') ?: 'webuser';
        $password = getenv('DB_PASS') ?: 'webpass';
        
        try {
            $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            // Create table
            $sql = "CREATE TABLE IF NOT EXISTS tasks (
                id INT AUTO_INCREMENT PRIMARY KEY,
                task VARCHAR(255) NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )";
            $conn->exec($sql);
            
            echo '<div class="status">✓ Database Connected Successfully!</div>';
            
            // Handle form submission
            if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['task'])) {
                $task = $_POST['task'];
                $stmt = $conn->prepare("INSERT INTO tasks (task) VALUES (:task)");
                $stmt->bindParam(':task', $task);
                $stmt->execute();
                echo '<div class="status">✓ Task Added Successfully!</div>';
            }
            
        } catch(PDOException $e) {
            echo '<div class="error">✗ Connection failed: ' . $e->getMessage() . '</div>';
        }
        ?>
        
        <h2>Add New Task</h2>
        <form method="POST">
            <input type="text" name="task" placeholder="Enter a task..." required>
            <button type="submit">Add Task</button>
        </form>
        
        <h2>Task List</h2>
        <?php
        if (isset($conn)) {
            $stmt = $conn->query("SELECT * FROM tasks ORDER BY created_at DESC");
            $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            if (count($tasks) > 0) {
                echo '<table>';
                echo '<tr><th>ID</th><th>Task</th><th>Created At</th></tr>';
                foreach ($tasks as $task) {
                    echo '<tr>';
                    echo '<td>' . $task['id'] . '</td>';
                    echo '<td>' . htmlspecialchars($task['task']) . '</td>';
                    echo '<td>' . $task['created_at'] . '</td>';
                    echo '</tr>';
                }
                echo '</table>';
            } else {
                echo '<p>No tasks yet. Add one above!</p>';
            }
        }
        ?>
        
        <div style="margin-top: 30px; padding: 20px; background: #f8f9fa; border-radius: 5px;">
            <h3>Stack Information</h3>
            <p><strong>Linux:</strong> <?php echo php_uname('s') . ' ' . php_uname('r'); ?></p>
            <p><strong>Apache:</strong> <?php echo apache_get_version(); ?></p>
            <p><strong>MySQL:</strong> Connected to <?php echo $host; ?></p>
            <p><strong>PHP:</strong> <?php echo phpversion(); ?></p>
        </div>
    </div>
</body>
</html>
