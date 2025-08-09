create database Projects;
use Projects;
drop table if exists zepto;
show tables;
SET SQL_SAFE_UPDATES = 0;


select count(*) from zepto_v2;
select * from zepto_v2 limit 10;
desc zepto_v2;
ALTER TABLE zepto_v2 
CHANGE `ï»¿Category` category VARCHAR(255);


-- null values 
select * from zepto_v2
where name is null
or
category is null
or
discountPercent is null
or
discountedSellingPrice is null
or
weightingms is null
or
availableQuantity is null
or
outOfStock is null
or
quantity is null;


-- different product catgories
select distinct category
from zepto_v2
order by category;

-- product in stock and outstock
select outofstock,count(*)
from zepto_v2
group by outofstock;

-- product name more than once
select name,count(*) as num
from zepto_v2
group by name
having count(*)>1
order by num desc;

-- data cleaning

-- products with prize zero
select * from zepto_v2 where mrp=0 or discountedSellingPrice=0;

-- delete them
delete from zepto_v2
where mrp=0;

-- convert paisa into rupees
update zepto_v2
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100;

-- Q1.top 10 best value procuts based on discount percentage
select * from zepto_v2
order by discountPercent desc
limit 10;

-- Q2.what are the products with high mrp but out of stock
select distinct name,category,mrp,outofstock
from zepto_v2
where outofstock='True'
order by mrp desc;

-- Q3.Calculate estimate revenue for each category
select category,sum(discountedSellingPrice * availableQuantity) as revenue
from zepto_v2
group by category
order by revenue desc;

-- Q4. find all products where mrp is greater than 500 and discountPrice is less than 10%
select * from zepto_v2
where mrp>500 and discountPercent<10;

-- Q5.identify the top 5 categories offering the highest average discount percentage
select category,avg(discountPercent) as disper
from zepto_v2
group by category
order by disper desc
limit 5;

-- Q6.find the price per gram for products above 100g and sort by best value
select distinct name,round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto_v2
where weightInGms >= 100
order by price_per_gram desc;

-- Q7.group the products into categories like low,medium and  bulk
select distinct name,weightinGms,
	case 
		when weightInGms < 1000 then "Low"
        when weightInGms <5000 then "Medium"
        else "BULK"
        end as weight_category
	from zepto_v2
    order by weight_category;
    
-- Q8.what is the total inventory weight per category
select category,sum(weightInGms * availableQuantity) as total_weight
from zepto_v2
group by category
order by total_weight;
	
