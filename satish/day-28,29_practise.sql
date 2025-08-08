use company;
drop table Employees3;

CREATE TABLE Employees3 (
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50),

Last_name VARCHAR(58),
dept_id INT
);

insert into Employees3 values(1,'rahul','sharma',101),
	(2,'priaya','mehta',102),
    (3,'Ankit','Verma',103),
    (4,'Simran','kaur',104),
    (5,'aman','singh',105);
    
select * from Employees3;

create table dept1(
	dept_id int primary key,
    dept_name varchar(20)
    );
    
insert into dept1 values(101,'sales'),
	(102,'Marketing'),
    (103,'IT'),
    (104,'HR');
    
select * from dept1;


select e.employee_id,e.first_name,e.last_name,
	d.dept_id,d.dept_name
from Employees3 e
inner join
dept1 d
on e.dept_id=d.dept_id;



select e.employee_id,e.first_name,e.last_name,
	d.dept_id,d.dept_name
from Employees3 e
left join
dept1 d
on e.dept_id=d.dept_id;



select e.employee_id,e.first_name,e.last_name,
	d.dept_id,d.dept_name
from Employees3 e
right join
dept1 d
on e.dept_id=d.dept_id;


/*        fullouter join     */

select e.employee_id,e.first_name,e.last_name,
	d.dept_id,d.dept_name
from Employees3 e
left join
dept1 d
on e.dept_id=d.dept_id
UNION
select e.employee_id,e.first_name,e.last_name,
	d.dept_id,d.dept_name
from Employees3 e
right join
dept1 d
on e.dept_id=d.dept_id;

/*       cross join     */

select e.first_name,e.last_name,
	d.dept_name
from Employees3 e
cross join
dept1 d;

/* self join */

select e1.first_name as employee_name1,
	e2.first_name as employee_name2
from employees3 e1 join employees3 e2
on e1.dept_id=e2.dept_id and
e1.employee_id != e2.employee_id;