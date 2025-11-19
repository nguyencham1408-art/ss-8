create database bai_2;
use bai_2;

CREATE TABLE employees (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50),
salary DECIMAL(15,2),
hire_date DATE
);

INSERT INTO employees (full_name, department, salary, hire_date) VALUES
('Nguyễn Văn A', 'Sales', 15000000, '2019-03-15'),
('Trần Thị B', 'IT', 22000000, '2020-07-01'),
('Lê Văn C', 'HR', 12000000, '2018-01-10'),
('Phạm Thị D', 'IT', 25000000, '2021-05-20'),
('Hoàng Văn E', 'Sales', 18000000, '2017-09-05'),
('Vũ Thị F', 'IT', 20000000, '2016-11-30');

SELECT COUNT(*) AS number_of_employees
FROM employees;

SELECT SUM(salary) AS Total_monthly_salary
FROM employees;

SELECT AVG(salary) AS Average_salary
FROM employees;

SELECT MAX(salary) AS high_salary
FROM employees;

SELECT MIN(salary) AS low_salary
FROM employees;

SELECT MIN(hire_date) AS Early_hire_date
FROM employees;

SELECT SUM(salary) AS it_department_salary
FROM employees
WHERE department = 'IT';
