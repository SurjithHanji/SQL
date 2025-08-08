use company;
select * from products;

select product_name,category,price,
	row_number() over(partition by category order by price asc) as row_num
from products;

select product_name,category,price,
	dense_rank() over(partition by category order by price asc) as row_num
from products;

select product_name,category,price,
	sum(price) over(order by price asc) as runnig_total
from products;

select product_name,category,price,
	sum(price) over(partition by category order by price asc) as run_total
from products;