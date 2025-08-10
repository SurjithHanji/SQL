create database satish_project;
use satish_project;

show databases;
drop table customer;
create table Books(
	Book_ID int primary key,
	Title varchar(30),
	Author varchar(30),
	Genre varchar(50),
	Published_Year int,
	Price numeric(10,2),
    stock int
);

create table customers(
	Customer_ID int primary key,	
    Name varchar(20),
    Email varchar(20),
    Phone varchar(15),
    City varchar(30),
    Country varchar(20)
);

create table orders(
	Order_ID int primary key,	
    Customer_ID	int references customer(customer_id),
    Book_ID	int references books(book_id),
    Order_Date date,
    Quantity int,
    Total_Amount numeric(10,2)
);


/* 1) Retrive all books in the file "fiction" genre */

select * from books where genre="fiction";

/* 2) Find books published after the year 1950 */

select * from books where published_year > 1950 order by published_year asc;

/* 3) List all customers from the Canada */

select * from customers where country="canada";

/* 4)  Show orders placed in November 2023 */

select * from orders where order_date between "2023-11-01" and "2023-11-30";

/* 5) Retrieve the total stock of books available */

select sum(stock) as total_books from books ;

/* 6)  Find the details of the most expensive book */

select * from books 
order by price desc limit 1;

/* 7) Show all customers who ordered more than 1 quantity of a book */

select * from orders where quantity > 1 order by quantity;

/*  8) Retrieve all orders where the total amount exceeds $20 */

select * from orders 
where total_amount > 20 order by total_amount;

/* 9) List all genres available in the Books table */

select distinct genre from books;

/* 10) Find the book with the lowest stock */

select * from books 
order by stock asc limit 1;

/*  11) Calculate the total revenue generated from all orders */

select sum(total_amount) as total_revenue from orders;

select * from books;
select * from customers;
select * from orders;






