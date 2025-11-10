CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO contacts (name, email, phone) VALUES
    ('John Doe', 'john@example.com', '1234567890'),
    ('Jane Smith', 'jane@example.com', '0987654321');
