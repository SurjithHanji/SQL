use company;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price NUMERIC(10, 2),
quantity INT,
added_date DATE,
discount_rate NUMERIC(5, 2)
);


INSERT INTO products VALUES
(13, 'Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
(14, 'irtphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
(15, 'Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
(16, 'Office_Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
(17, 'Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
(18, 'Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
(19, 'Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
(20, 'Mouse', 'Accessories', 750.00, 40, '2024-03-18', 18.00),
(21, 'Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
(22, 'Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

select * from products;

/*                      aggregation Functions           */

select sum(quantity) as total_quantity from products;

select sum(quantity) as total from products
where category="Electronics" and price > 20000;


select count(*) as total_product from products
where 
product_name like "%phone";

select avg(price) as avg_price from products;

select avg(price) as avg_price from products
where 
category="Accessories" or added_date > '2024-02-01';

select max(price) as max_price from products;

select min(price) as min_price from products;
