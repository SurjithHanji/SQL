create database inter;
use inter;

drop table emp;

create table emp
(id int primary key,
e_name varchar(20),
d_name varchar(20),
salary decimal(10,2));

INSERT INTO emp  VALUES (1, 'Aarav Singh', 'IT', 55000.00);
INSERT INTO emp VALUES (2, 'Sneha Patel', 'HR', 48000.00);
INSERT INTO emp  VALUES (3, 'Rahul Verma', 'Finance', 60000.00);
INSERT INTO emp  VALUEs (4, 'Neha Sharma', 'Marketing', 51000.00);
INSERT INTO emp  VALUES (5, 'Rohit Kumar', 'IT', 58000.00);
INSERT INTO emp  VALUES (6, 'Priya Das', 'HR', 47000.00);
INSERT INTO emp  VALUES (7, 'Vikram Joshi', 'Finance', 62000.00);
INSERT INTO emp VALUES (8, 'Kiran Mehta', 'Marketing', 50000.00);
INSERT INTO emp VALUES (9, 'Amit Rana', 'IT', 54000.00);
INSERT INTO emp  VALUES (10, 'Divya Rao', 'HR', 46000.00);
INSERT INTO emp VALUES (11, 'Sanjay Pillai', 'Finance', 61000.00);
INSERT INTO emp VALUES (12, 'Meera Nair', 'Marketing', 49500.00);
INSERT INTO emp VALUES (13, 'Harsh Tiwari', 'IT', 56000.00);
INSERT INTO emp  VALUES (14, 'Pooja Bhatt', 'HR', 47000.00);
INSERT INTO emp  VALUES (15, 'Nikhil Jain', 'Finance', 63000.00);
INSERT INTO emp  VALUES (16, 'Anita Roy', 'Marketing', 52000.00);
INSERT INTO emp VALUES (17, 'Karan Malhotra', 'IT', 59000.00);
INSERT INTO emp  VALUES (18, 'Ritu Choudhary', 'HR', 45500.00);
INSERT INTO emp VALUES (19, 'Sunil Deshmukh', 'Finance', 60500.00);
INSERT INTO emp  VALUES (20, 'Alka Reddy', 'Marketing', 48500.00);
INSERT INTO emp  VALUES (21, 'Deepak Yadav', 'IT', 57000.00);
INSERT INTO emp  VALUES (22, 'Swati Pandey', 'HR', 49000.00);
INSERT INTO emp values (23, 'Manoj Sharma', 'Finance', 64000.00);
INSERT INTO emp  values(24, 'Shalini Iyer', 'Marketing', 53000.00);


select * from emp;

select max(salary) as max_sal from emp;

select d_name,max(salary) as max_sal 
from emp
group by d_name
order by max_sal desc;


select e.*,
max(salary) over() as max_sal
from emp e;


select e.*,
max(salary) over(partition by d_name) as max_sal
from emp e;

/*          ROW_NUMBER()        */

select e.*, 
row_number() over() as rn
from emp e;


select e.*, 
row_number() over(partition by d_name) as rn
from emp e;


/* to get first 2 people who have joined their each department*/
select * from (
select e.*, 
row_number() over(partition by d_name order by id) as rn
from emp e
) x where x.rn<3;

select * from emp;

/*        RANK()        */

select * from (
select e.*,
rank() over(partition by d_name order by salary desc) as rnk  
from emp e) x
where x.rnk<4;

update emp set salary=63000 where id=7;

/*           DENSE RANK()      */

select e.*,
rank() over(partition by d_name order by salary desc) as rnk ,
dense_rank() over(partition by d_name order by salary desc) as dense_rnk ,
row_number() over(partition by d_name order by salary) as rn 
from emp e;


/*            lead() and lag()                */

select e.*,
lag(salary) over(partition by d_name order by id) as prev_emp_sal
from emp e;


select e.*,
lead(salary) over(partition by d_name order by id) as next_emp_sal
from emp e;



select e.*,
lag(salary) over(partition by d_name order by id) as next_emp_sal,
case
	when e.salary > lag(salary) over(partition by d_name order by id) then 'high than previous'
    when e.salary < lag(salary) over(partition by d_name order by id) then 'lower ro previous'
    when e.salary = lag(salary) over(partition by d_name order by id) then 'same salary'
    end sal_range

from emp e;
