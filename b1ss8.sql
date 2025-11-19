create database bai_co_ban1;
use bai_co_ban1;

create table san_pham (
product_id int primary key,
product_name VARCHAR(255),
price decimal(12,2),
stock_quantity int 
);

insert into san_pham (product_id, product_name, price, stock_quantity)
values
(1, 'Laptop A', 20000000, 15),
(2, 'Điện thoại B', 15000000, 30),
(3, 'Chuột không dây C', 300000, 100),
(4, 'Bàn phím cơ D', 1200000, 50),
(5, 'Màn hình E', 4500000, 20);

create table khach_hang (
customer_id int primary key,
customer_name varchar(255),
city varchar(100)
);

insert into khach_hang (customer_id, customer_name, city)
values
(101, 'Nguyễn Văn A', 'Hà Nội'),
(102, 'Trần Thị B', 'TP.HCM'),
(103, 'Lê Hoàng C', 'Hà Nội'),
(104, 'Phạm Quang D', 'Đà Nẵng'),
(105, 'Đỗ Minh E', 'Hải Phòng');

create table don_hang (
order_id int primary key,
customer_id int,
order_date date,
total_amount decimal(15,2),
foreign key (customer_id) references Customers(customer_id)
);

insert into don_hang (order_id, customer_id, order_date, total_amount)
values
(1, 101, '2023-01-10', 20000000),
(2, 102, '2023-02-15', 15000000),
(3, 101, '2023-03-05', 23000000),
(4, 103, '2023-03-18', 3000000),
(5, 104, '2023-04-02', 12000000),
(6, 102, '2023-05-20', 18000000),
(7, 105, '2023-06-01', 4500000),
(8, 103, '2023-07-11', 21000000);

select COUNT(*) as Total_products
from san_pham;

select SUM(total_amount) as Total_revenue
from don_hang;

select avg(price) as Average_price
from san_pham;

select MAX(total_amount) as max_order_amount
from don_hang;

select MIN(total_amount) as min_order_amount
from don_hang;

select COUNT(*) as hanoi_customers_count
from khach_hang
where city = 'Hà Nội';










