use company;
show tables;

select * from products;

select product_name,price,
	case
		when price>=50000 then "expensive"
        when price>=10000 and price<=49999 then "Moderate"
        else "affordable"
	end as price_category
from products;
