show databases;
use projects;
drop table if exists retail;

create table retail (
	transactions_id	int primary key,
    sale_date date,
    sale_time time,
    customer_id	int,
    gender varchar(50),
    age int,	
    category varchar(30),
	quantiy int,	
    price_per_unit float,
    cogs float,	
    total_sale float
    );
desc retail;
select * from retail ;
select count(*) from retail;

-- Data cleaning null values
select * from retail
where transactions_id is null
	or sale_date is null
    or sale_time is null
    or customer_id is null
    or gender is null
    or age is null
    or category is null
    or quantiy is null
    or price_per_unit is null
    or cogs is null
    or total_sale is null;
    
delete from retail
	where transactions_id is null
	or sale_date is null
    or sale_time is null
    or customer_id is null
    or gender is null
    or age is null
    or category is null
    or quantiy is null
    or price_per_unit is null
    or cogs is null
    or total_sale is null;
set sql_safe_updates=0;

select count(distinct customer_id) from retail;
select count(distinct category) from retail;
select distinct category from retail;


-- Data analysis


-- 1) write sql query  to retrive all columns for sales made on 2022-11-05
select * from retail
where sale_date='2022-11-05';

-- 2)  all columns where category is clothing and quantity sold is more than the 4 in month of nov-2022
select * from retail
where category='clothing' and quantiy>=4  and sale_date between '2022-11-01' and '2022-11-30';

-- 3)Write a SQL query to calculate the total sales (total_sale) for each category.:
select category,sum(quantiy) as total_sales,
count(*) as total_orders
from retail
group by category;

-- 4)Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select category,round(avg(age),2) as avg_age 
from retail
where category="Beauty";

-- 5)Write a SQL query to find all transactions where the total_sale is greater than 1000.:
select * from retail
where total_sale>1000;

-- 6)Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select category,gender,count(transactions_id) as trans_id
from retail
group by gender,category
order by 1;

-- 7)Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
select * from (
	select 
	extract(year from sale_date) as year,
    extract(month from sale_date)as month,
    round(avg(total_sale),2) as avg_sale,
    rank() over (partition by extract(year from sale_date) order by avg(total_sale) desc) as ranki
    from retail
group by 1,2
order by 1,3 desc)
 as t1
where ranki=1;

-- 8)**Write a SQL query to find the top 5 customers based on the highest total sales **:
select customer_id,sum(total_sale) as to_sale
from retail
group by customer_id
order by to_sale desc limit 5;

-- 9)Write a SQL query to find the number of unique customers who purchased items from each category.:
select category,count(distinct customer_id) as unique_cust from retail
group by category; 

-- 10)Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
with hourly_sale
as
(
select *,
	case 
		when extract(hour from sale_time) <12 then "Morning"
        when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
        else "evening"
	end as shift
from retail)
select shift,count(*) as total_orders
from hourly_sale
group by shift;
