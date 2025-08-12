create database p2;
use p2;
DROP TABLE books;
show tables;

select * from books;
desc books;
select * from branch;
select * from employees;
select * from issued_status;
select * from members;
select * from return_status;
SET SQL_SAFE_UPDATES = 0;


-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. 
-- Lippincott & Co.')"
insert into books values('978-0-101-425787-7','The gently falls bakula','fiction',8.9,'yes','sudha murthy','murty');

-- Task 2: Update an Existing Member's Address
update books 
set category="romantic"
where isbn='978-0-101-425787-7';

--  Delete the record with issued_id = 'IS121' from the issued_status table.
delete from issued_status
where issued_id='IS121';

-- Select all books issued by the employee with emp_id = 'E101'.
select * from issued_status
where issued_emp_id='E101';

-- Use GROUP BY to find members who have issued more than one book.
select issued_emp_id,count(*)
from issued_status
group by 1
having count(issued_emp_id)>1;

-- List Members Who Registered in the Last 180 Days:
select * from members
where reg_date<= (current_date-interval 180 day);

-- List Employees with Their Branch Manager's Name and their branch details:
select e.emp_name,e.branch_id,b.branch_address,b.manager_id
from employees e
join branch b
on e.branch_id=b.branch_id;



 

