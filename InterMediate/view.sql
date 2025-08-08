use inter;
CREATE TABLE customer_data (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO customer_data (customer_id, customer_name, city, email) VALUES
(1, 'John Doe', 'Delhi', 'john@example.com'),
(2, 'Sara Ali', 'Mumbai', 'saraali@example.com'),
(3, 'Ravi Kumar', 'Bangalore', 'ravi.k@example.com'),
(4, 'Neha Singh', 'Delhi', 'nehas@example.com'),
(5, 'Arjun Mehta', 'Chennai', 'arjun.m@example.com');


CREATE TABLE product_info (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO product_info (product_id, product_name, category, price) VALUES
(101, 'Wireless Mouse', 'Electronics', 799.00),
(102, 'Keyboard', 'Electronics', 1199.50),
(103, 'T-shirt', 'Clothing', 499.00),
(104, 'Notebook', 'Stationery', 120.00),
(105, 'Headphones', 'Electronics', 1599.00);

CREATE TABLE order_details (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);
INSERT INTO order_details (order_id, customer_id, product_id, quantity, order_date) VALUES
(1001, 1, 101, 2, '2025-07-15'),
(1002, 2, 103, 1, '2025-07-18'),
(1003, 1, 105, 1, '2025-08-01'),
(1004, 3, 104, 3, '2025-08-03'),
(1005, 4, 102, 2, '2025-08-07'),
(1006, 5, 101, 1, '2025-08-07');

select * from product_info;
select * from order_details; 
select * from customer_data;

-- fetch the order summary to give it to client
create view order_summary 
as 
select o.order_id,o.product_id,o.order_date,
p.product_name,p.price,c.customer_id,c.customer_name,c.email
from order_details o 
join product_info p on o.product_id=p.product_id
join customer_data c on o.customer_id=c.customer_id;

select * from order_summary;





