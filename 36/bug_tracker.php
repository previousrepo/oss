<!DOCTYPE html>
<html>
<head>
    <title>Simple Bug Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background: #f5f5f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 3px solid #4CAF50;
            padding-bottom: 10px;
        }
        .bug-form {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #45a049;
        }
        .bug-list {
            margin-top: 30px;
        }
        .bug-item {
            background: #fff;
            border-left: 4px solid #4CAF50;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .bug-item.high {
            border-left-color: #f44336;
        }
        .bug-item.medium {
            border-left-color: #ff9800;
        }
        .bug-item.low {
            border-left-color: #4CAF50;
        }
        .priority {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
        }
        .priority.high {
            background: #f44336;
            color: white;
        }
        .priority.medium {
            background: #ff9800;
            color: white;
        }
        .priority.low {
            background: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🐛 Simple Bug Tracker</h1>
        <p>Lightweight bug tracking system running in Docker</p>
        
        <div class="bug-form">
            <h2>Report a Bug</h2>
            <form method="POST">
                <input type="text" name="title" placeholder="Bug Title" required>
                <textarea name="description" rows="4" placeholder="Bug Description" required></textarea>
                <select name="priority" required>
                    <option value="">Select Priority</option>
                    <option value="high">High</option>
                    <option value="medium">Medium</option>
                    <option value="low">Low</option>
                </select>
                <button type="submit" name="submit">Submit Bug</button>
            </form>
        </div>
        
        <?php
        // Simple file-based storage
        $bugs_file = '/tmp/bugs.json';
        
        if (isset($_POST['submit'])) {
            $bugs = file_exists($bugs_file) ? json_decode(file_get_contents($bugs_file), true) : [];
            
            $bug = [
                'id' => count($bugs) + 1,
                'title' => $_POST['title'],
                'description' => $_POST['description'],
                'priority' => $_POST['priority'],
                'date' => date('Y-m-d H:i:s'),
                'status' => 'open'
            ];
            
            $bugs[] = $bug;
            file_put_contents($bugs_file, json_encode($bugs));
            
            echo '<div style="background: #d4edda; padding: 15px; border-radius: 5px; margin: 20px 0;">
                    ✓ Bug reported successfully!
                  </div>';
        }
        
        // Display bugs
        if (file_exists($bugs_file)) {
            $bugs = json_decode(file_get_contents($bugs_file), true);
            
            if (!empty($bugs)) {
                echo '<div class="bug-list">';
                echo '<h2>Bug List (' . count($bugs) . ')</h2>';
                
                foreach (array_reverse($bugs) as $bug) {
                    echo '<div class="bug-item ' . $bug['priority'] . '">';
                    echo '<h3>#' . $bug['id'] . ' - ' . htmlspecialchars($bug['title']) . '</h3>';
                    echo '<p>' . htmlspecialchars($bug['description']) . '</p>';
                    echo '<span class="priority ' . $bug['priority'] . '">' . strtoupper($bug['priority']) . '</span> ';
                    echo '<small>Reported: ' . $bug['date'] . '</small>';
                    echo '</div>';
                }
                
                echo '</div>';
            }
        }
        ?>
    </div>
</body>
</html>
