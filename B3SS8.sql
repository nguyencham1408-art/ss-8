CREATE DATABASE BAI_3;
USE BAI_3;

CREATE TABLE Books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author VARCHAR(255),
published_year INT,
pages INT
);

INSERT INTO Books (title, author, published_year, pages) VALUES
('Lập Trình C++ Cơ Bản', 'Nguyễn Văn A', 1999, 320),
('Dữ Liệu Lớn Và Ứng Dụng', 'Trần Thị B', 2015, 450),
('Học Máy Cơ Bản', 'Lê Văn C', 2020, 380),
('Thuật Toán Tối Ưu', 'Phạm Thị D', 2005, 500),
('Lập Trình Python Nâng Cao', 'Vũ Quang E', 2018, 600),
('Cơ Sở Dữ Liệu SQL', 'Ngô Hồng F', 2002, 410);

CREATE TABLE BorrowingRecords (
record_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
loan_date DATE,
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO BorrowingRecords (book_id, loan_date) VALUES
(1, '2020-01-15'),
(2, '2021-03-10'),
(3, '2021-07-22'),
(1, '2022-02-05'),
(4, '2022-10-18'),
(6, '2023-01-12'),
(5, '2023-03-20');

SELECT COUNT(*) AS Total_books
FROM Books;

SELECT SUM(pages) AS Total_pages_in_library
FROM Books;

SELECT AVG(pages) AS Average_pages_per_book
FROM Books;

SELECT MIN(published_year) AS old_book_year
FROM Books;

SELECT MAX(published_year) AS new_book_year
FROM Books;

SELECT MIN(loan_date) AS first_borrow_date
FROM BorrowingRecords;

SELECT COUNT(*) AS books_after_2000
FROM Books
WHERE published_year > 2000;

