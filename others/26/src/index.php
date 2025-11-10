<!DOCTYPE html>
<html>
<head>
    <title>Contact Form - MySQL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center text-primary">Contact Form with MySQL</h1>
        <hr>
        
        <?php
        $host = 'mysql';
        $db = 'formdb';
        $user = 'formuser';
        $pass = 'formpass';
        
        try {
            $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            // Handle form submission
            if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add'])) {
                $name = $_POST['name'];
                $email = $_POST['email'];
                $phone = $_POST['phone'];
                
                $stmt = $pdo->prepare("INSERT INTO contacts (name, email, phone) VALUES (?, ?, ?)");
                $stmt->execute([$name, $email, $phone]);
                echo '<div class="alert alert-success">Record added successfully!</div>';
            }
            
            // Handle delete
            if (isset($_GET['delete'])) {
                $id = $_GET['delete'];
                $stmt = $pdo->prepare("DELETE FROM contacts WHERE id = ?");
                $stmt->execute([$id]);
                echo '<div class="alert alert-info">Record deleted!</div>';
            }
        } catch(PDOException $e) {
            echo '<div class="alert alert-danger">Connection failed: ' . $e->getMessage() . '</div>';
        }
        ?>
        
        <!-- Add Record Form -->
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4>Add New Contact</h4>
                    </div>
                    <div class="card-body">
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone</label>
                                <input type="text" name="phone" class="form-control" required>
                            </div>
                            <button type="submit" name="add" class="btn btn-primary w-100">Add Record</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Display Records -->
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h4>All Contacts</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Created At</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $stmt = $pdo->query("SELECT * FROM contacts ORDER BY id DESC");
                                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                    echo "<tr>";
                                    echo "<td>{$row['id']}</td>";
                                    echo "<td>{$row['name']}</td>";
                                    echo "<td>{$row['email']}</td>";
                                    echo "<td>{$row['phone']}</td>";
                                    echo "<td>{$row['created_at']}</td>";
                                    echo "<td><a href='?delete={$row['id']}' class='btn btn-danger btn-sm'>Delete</a></td>";
                                    echo "</tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
