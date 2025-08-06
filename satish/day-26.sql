use company;
select * from products;

alter table products
drop column discount_price;

alter table products 
add column discount_price numeric(10,2);

UPDATE products
SET discount_price = NULL
WHERE product_name IN ('laptop', 'desk');

SET SQL_SAFE_UPDATES = 0;

UPDATE products
SET discount_price = price*0.9
WHERE product_name not IN ('laptop', 'desk');

select product_name,price,discount_price 
from products;

select product_name,
	coalesce(discount_price,price) as final_price
from products;

