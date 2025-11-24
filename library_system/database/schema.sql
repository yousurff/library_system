[24.11.2025, 11:02:47] Hakan Ege Sarıçayır: CREATE TABLE Users (
user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password_hash VARCHAR(255) NOT NULL,
role ENUM('Member', 'Librarian', 'Admin') NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Books (
book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(150) NOT NULL,
author VARCHAR(100) NOT NULL,
category VARCHAR(50),
isbn VARCHAR(20) UNIQUE,
status ENUM('Available', 'Borrowed', 'Reserved') NOT NULL,
added_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Borrowings (
borrow_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
book_id INT NOT NULL,
request_date DATETIME NOT NULL,
issue_date DATETIME,
due_date DATE,
return_date DATETIME,
status ENUM('Pending', 'Approved', 'Returned', 'Overdue') NOT NULL,
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Reservations (
reservation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
book_id INT NOT NULL,
request_date DATETIME NOT NULL,
status ENUM('Pending', 'Approved', 'Cancelled', 'Completed') NOT NULL,
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);







[24.11.2025, 11:02:54] Hakan Ege Sarıçayır: INSERT INTO Users (full_name, email, password_hash, role) VALUES
('Ali Yılmaz', 'ali@kutuphane.com', 'e10adc3949ba59abbe56e057f20f883e', 'Admin'),
('Can Kaya', 'can@kutuphane.com', 'e10adc3949ba59abbe56e057f20f883e', 'Librarian'),
('Ece Demir', 'ece@kutuphane.com', 'e10adc3949ba59abbe56e057f20f883e', 'Member'),
('Kerem Ak', 'kerem@kutuphane.com', 'e10adc3949ba59abbe56e057f20f883e', 'Member');

[24.11.2025, 11:03:01] Hakan Ege Sarıçayır: INSERT INTO Books (title, author, category, isbn, status) VALUES
('Madonna Kürk Mantolu', 'Sabahattin Ali', 'Fiction', '978-6051141757', 'Borrowed'),
('Martin Eden', 'Jack London', 'Classic', '978-9750736181', 'Available'),
('Anna Karenina', 'Leo Tolstoy', 'Classic', '978-9754707647', 'Reserved'),
('Atomik Alışkanlıklar', 'James Clear', 'Personal Development', '978-6059590664', 'Available'),
('Araba Sevdası', 'Recaizade Mahmut Ekrem', 'Classic', '978-9754400516', 'Available'),
('Mai ve Siyah', 'Halit Ziya Uşaklıgil', 'Classic', 'Available'),
('Macbeth', 'William Shakespeare', 'Theater', 'Available');

[24.11.2025, 11:03:09] Hakan Ege Sarıçayır: INSERT INTO Borrowings (user_id, book_id, request_date, issue_date, due_date, return_date, status) VALUES
(3, 1, '2025-09-01 10:00:00', '2025-09-02 11:00:00', '2025-09-22', NULL, 'Overdue'),
(4, 7, '2025-11-20 15:30:00', '2025-11-20 16:00:00', '2025-12-10', NULL, 'Approved'),
(3, 4, '2025-11-23 09:00:00', NULL, NULL, NULL, 'Pending');

[24.11.2025, 11:03:14] Hakan Ege Sarıçayır: INSERT INTO Reservations (user_id, book_id, request_date, status) VALUES
(4, 3, '2025-11-05 14:00:00', 'Approved'),
(3, 2, '2025-11-24 09:30:00', 'Pending'),
(2, 5, '2025-10-15 11:00:00', 'Cancelled');