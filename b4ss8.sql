CREATE DATABASE BAI_KHA4;
USE BAI_KHA4;

CREATE TABLE Products (
id_san_pham INT PRIMARY KEY AUTO_INCREMENT,
ten_san_pham VARCHAR(255) NOT NULL,
danh_muc VARCHAR(100) NOT NULL,
gia DECIMAL(10,2) NOT NULL
);

INSERT INTO Products (ten_san_pham, danh_muc, gia) VALUES
('Tai nghe Bluetooth', 'Điện tử', 500000),
('Điện thoại A1', 'Điện tử', 3500000),
('Laptop Pro X', 'Điện tử', 15000000),
('Sách kỹ năng mềm', 'Sách', 120000),
('Sách lập trình Python', 'Sách', 180000),
('Áo thun nam', 'Quần áo', 250000),
('Áo khoác nữ', 'Quần áo', 600000),
('Quần jeans nam', 'Quần áo', 450000),
('Sách kinh tế', 'Sách', 150000),
('Máy ảnh Mini', 'Điện tử', 4500000),
('Tai nghe Gaming', 'Điện tử', 900000),
('Áo sơ mi nam', 'Quần áo', 300000);

CREATE TABLE DonHang (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
ngay_dat_hang DATE NOT NULL,
tong_so_tien DECIMAL(10,2) NOT NULL
);

INSERT INTO DonHang (customer_id, ngay_dat_hang, tong_so_tien) VALUES
(1, '2025-01-02', 1200000),
(1, '2025-01-15', 800000),
(2, '2025-01-05', 300000),
(2, '2025-02-10', 900000),
(3, '2025-02-15', 2500000),
(3, '2025-03-01', 1500000),
(4, '2025-01-08', 500000),
(4, '2025-02-20', 450000),
(5, '2025-03-10', 800000),
(5, '2025-03-22', 350000),
(6, '2025-03-25', 1800000),
(6, '2025-03-29', 500000);

SELECT 
danh_muc AS category,
COUNT(*) AS so_san_pham
FROM Products
GROUP BY danh_muc;

SELECT 
customer_id,
SUM(tong_so_tien) AS Total_spent
FROM Donhang
GROUP BY customer_id;

SELECT 
danh_muc AS category,
COUNT(*) AS product_count,
AVG(gia) AS average_price,
MAX(gia) AS max_price,
MIN(gia) AS min_price
FROM Products
GROUP BY danh_muc;

SELECT 
customer_id,
SUM(tong_so_tien) AS Total_spent
FROM Donhang
GROUP BY customer_id
HAVING SUM(tong_so_tien) > 1000;

SELECT 
danh_muc AS category,
COUNT(*) AS product_count
FROM Products
GROUP BY danh_muc
HAVING COUNT(*) > 5;

SELECT 
customer_id,
SUM(tong_so_tien) AS Total_spent
FROM Donhang
GROUP BY customer_id
ORDER BY Total_spent DESC
LIMIT 3;

