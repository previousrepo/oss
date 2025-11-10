-- Initialize database with sample data

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email) VALUES
    ('admin', 'admin@example.com'),
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com');

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);

INSERT INTO products (name, price, stock) VALUES
    ('Laptop', 999.99, 10),
    ('Mouse', 29.99, 50),
    ('Keyboard', 79.99, 30);
