-- QUESTION 1
--library management system database schema
-- This schema includes tables for members, books, authors, categories, and borrowing records.
-- It also includes many-to-many relationships between books and authors, and books and categories.
-- Create database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    registration_date DATE
);

-- Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Categories table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year YEAR,
    copies_available INT DEFAULT 1 CHECK (copies_available >= 0)
);

-- Book_Author (Many-to-Many)
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Book_Category (Many-to-Many)
CREATE TABLE Book_Category (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

-- Borrowing Records
CREATE TABLE Borrowing_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);
INSERT INTO Members (name, email, phone, registration_date)
VALUES 
('Alice Johnson', 'alice@example.com', '1234567890', CURDATE()),
('Bob Smith', 'bob@example.com', '0987654321', CURDATE());

-- Sample data for Authors
INSERT INTO Authors (name, bio)
VALUES 
('J.K. Rowling', 'Author of the Harry Potter series.'),
('George Orwell', 'Author of 1984 and Animal Farm.');

-- Sample data for Categories
INSERT INTO Categories (name)
VALUES 
('Fiction'),
('Science Fiction'),
('Fantasy');

-- Sample data for Books
INSERT INTO Books (title, isbn, publication_year, copies_available)
VALUES 
('Harry Potter and the Sorcerer\'s Stone', '9780439554930', 1997, 5),
('1984', '9780451524935', 1949, 3);

-- Linking Books to Authors
INSERT INTO Book_Author (book_id, author_id)
VALUES 
(1, 1),  -- Harry Potter -> J.K. Rowling
(2, 2);  -- 1984 -> George Orwell

-- Linking Books to Categories
INSERT INTO Book_Category (book_id, category_id)
VALUES 
(1, 3),  -- Harry Potter -> Fantasy
(2, 2);  -- 1984 -> Science Fiction

-- Sample Borrowing Records
INSERT INTO Borrowing_Records (member_id, book_id, borrow_date, return_date)
VALUES 
(1, 1, CURDATE(), NULL),  -- Alice borrows Harry Potter
(2, 2, CURDATE(), NULL);  -- Bob borrows 1984
