show databases;

use satish_project;
show tables;

/* 1) Retrieve the total number of books sold for each genre */

select b.genre,sum(o.quantity) as total_books_sold
from orders o
join books b on
o.book_id=b.book_id
group by b.genre;


/*  2) Find the average price of books in the "Fantasy" genre */

select avg(price) as books_fantasy_avg from books 
where genre="fantasy";


/*  3) List customers who have placed at least 2 orders */

select customer_id,count(order_id) as order_count
from orders 
group by customer_id
having count(order_id) >= 2;

SELECT o.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;


/*  4) Find the most frequently ordered book */

select book_id,count(order_id) as order_count 
from orders
group by book_id
order by order_count desc limit 1;


/* 5) Show the top 3 most expensive books of 'Fantasy' Genre  */

select * from books where genre="fantasy" 
order by price desc limit 3;


/* 6) Retrieve the total quantity of books sold by each author */

select b.author,sum(o.quantity) as total_books_sold 
from orders o 
join books b on o.book_id=b.book_id
group by b.author;


/* 7) List the cities where customers who spent over $30 are located */

select distinct c.city,o.total_amount
from orders o 
join customers c on o.customer_id=c.customer_id
where o.total_amount>30;


/* 8) Find the customer who spent the most on orders */

select c.customer_id,c.name,sum(o.total_amount) as total_spent  
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_id,c.name
order by total_spent desc limit 1;

/*  9) Calculate the stock remaining after fulfilling all orders */

select b.title,b.book_id,b.stock, coalesce(sum(o.quantity),0) as order_quantity,
	b.stock-coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o on b.book_id=o.book_id
group by b.book_id;


select * from books;
select * from customers;
select * from orders;