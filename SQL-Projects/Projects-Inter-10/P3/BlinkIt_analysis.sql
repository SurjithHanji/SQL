show databases;
create database blinkit;
use blinkit;
drop table if exists blink;
show tables;

select * from blink;
select count(*) as no_of_orders from blink;

ALTER TABLE blink
RENAME COLUMN `item fat content` TO `item_fat_content`;

set sql_safe_updates=0;

-- Data cleaning
update blink set item_fat_content=
	case 
		when item_fat_content in ('lf','low fat') then 'low fat'
        when item_fat_content in ('reg','regular') then 'regular'
	else item_fat_content
    end ;

select distinct item_fat_content from blink;

-- total sales
select round(sum(total_sales),2) as total from blink;

select cast(round(sum(total_sales),2)/1000000 as decimal (10,2)) as total from blink;

-- avg sales
select round(avg(total_sales),2) as average_sales from blink;

-- avg rating
select item_fat_content,round(avg(rating),2) as avg_rate from blink
group by item_fat_content;

-- total sales by fat content
select item_fat_content,round(sum(total_sales),2) from blink 
group by item_fat_content;

--  Total Sales by Item Type
select item_type,round(sum(total_sales),2) from blink 
group by item_type
order by 2 desc;

-- Fat Content by Outlet for Total Sales
select outlet_type,item_fat_content,
	cast(sum(total_sales) as decimal(10,2)) as total_sales,
    cast(avg(total_sales) as decimal(10,2)) as avg_sales,
    count(*) as no_of_itmes,
    cast(avg(rating) as decimal(10,2)) as avg_rating
from blink
group by outlet_type,item_fat_content
order by total_sales asc;

-- Total Sales by Outlet Establishment
select Outlet_Establishment_Year,round(sum(total_sales),2) from blink 
where item_fat_content='regular'
group by Outlet_Establishment_Year
order by 1 ;

-- . Percentage of Sales by Outlet Size
select Outlet_Size,
	cast(sum(total_sales) as decimal(10,2)) as total_sales,
    cast(sum(total_sales) * 100 / sum(sum(total_sales)) over() as decimal(10,2))as percentage
from blink
group by Outlet_Size;


-- G. Sales by Outlet Location
select Outlet_Location_Type,cast(sum(total_sales) as decimal(10,2)) as total_sales
from blink
group by Outlet_Location_Type;

-- H. All Metrics by Outlet Type:
select outlet_type,
	round(sum(total_sales),2) as total,
	round(avg(total_sales),2) as avg_sal,
    count(*) as total_rows,
    round(avg(item_visibility),2) as visible
from blink
group by outlet_type
order by visible desc;
    
