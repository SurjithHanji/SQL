use company;

select * from products;

select now() as currentdate_time;

select current_date() as today_date;

select added_date,current_date(),(current_date-added_date) as day_diff from products;

select current_time() as current_tim;

select product_name,extract(year from added_date) as year_added from products;

select product_name,extract(month from added_date) as month_added from products;

select product_name,extract(day from added_date) as day_added from products;


select product_name,timestampdiff(month,added_date,current_date) as age_since_added from products;

select product_name,date_format(added_date,"%d-%m-%y") as formated_date from products;


SELECT product_name, added_date, DAYOFWEEK(added_date) AS day_of_week
FROM products;


select product_name,date_format(added_date,"%d-01-2023") as extrace_date from products;

select product_name,date_format(added_date,"%d-01-%y") as extrace_date from products;

select product_name,added_date,
     date_add(added_date,interval 6 day) as new_date 
	from products;

select product_name,added_date,
     date_add(added_date,interval 6 month) as new_date 
	from products;
    
select current_time() as cu_time;



