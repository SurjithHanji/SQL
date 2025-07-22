use company;

select * from products;

select product_name,quantity,
	case
		when quantity>=10 then "Instock"
        when quantity between 5 and 9 then "limited stock"
        else "out of stock"
	end as stock_satus
from products;


select product_name,category,
	case
		when category="electronics" then "electronics itmes"
        when category="furniture" then "furniture items"
        else "accessories items"
	end as category_items
from products;

