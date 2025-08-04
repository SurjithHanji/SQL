use company;

/*             String Functions           */

select * from products;


select upper(category) as cat_capital from products;

select lower(category) as cat_lower from products;

select concat(product_name,'-',category) as product_details from products;

select substring(product_name,1,5) as sub_pro from products;

select length(product_name) length_of_char from products;

select product_name,length(product_name) length_of_char from products;

select trim('  Monitor  ') as clean_text;
select length('  Monitor  ') as clean_text;

select length(trim('  Monitor  ')) as clean_text;

select replace(product_name,'phone','device') as replaced_text from products;

select left(category,3) as cat_left from products;

select right(category,3) as cat_right from products;