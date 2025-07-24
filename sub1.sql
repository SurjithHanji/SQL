use inter;

CREATE TABLE emp1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO emp1 VALUES
(1, 'Alice', 'HR', 50000.00),
(2, 'Bob', 'Finance', 60000.00),
(3, 'Charlie', 'IT', 75000.00),
(4, 'Diana', 'Marketing', 55000.00);


CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50)
);

-- Insert sample data
INSERT INTO department (id, name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Marketing', 'Hyderabad'),
(5, 'Sales', 'Chennai'),
(6, 'Operations', 'Pune'),
(7, 'Logistics', 'Ahmedabad');

select * from department;
select * from emp1;

/* find the emp who earns more than the average salary */

select avg(salary) from emp1;

select * from emp1
where salary > (
select avg(salary) from emp1);

-- Scalar Subquery
/* it always returns one row and one column*/

select * from emp1 e
join (select avg(salary) sal from emp1 ) avg_sal
	on e.salary > avg_sal.sal;


-- Multiple Row Sub query
-- subquery which returns multiple column and multiple row
-- subquery which returns only 1 column and multiple rows

/* find employees who earns highest salary in each department */

select max(salary) as high_sal,department
from emp1
group by department;

select * from emp1
where (department,salary) in (
select max(salary) as high_sal,department
from emp1
group by department);


-- Single column multiple row subquery
/* find dept who do not have any employees */

select * from department
where name not in (select distinct department from emp1);


-- Correlated Subquery
-- A subquery which is related to outer query

/* find employees in each dept who earn more than avg sal in that dept*/

select * from emp1 e1
where salary > (
			select avg(salary) from emp1 e2 
            where e2.name =e1.name);
