use company;

create table stu3(
employee_id	int	primary key,
first_name	varchar(20)	not null,
last_name	varchar(20)	not null,
department	varchar(20),	
salary	int	,
joining_date	date,	
age	int
);

desc stu3;

select * from stu3;

select * from importing;

select first_name,last_name,salary,(salary*0.1) as bonus from importing;

select first_name , last_name,salary, 
(salary*12) as anual_salary,
(salary*0.5) as increment_salary,
(salary+salary*0.05) as new_salary
from importing;