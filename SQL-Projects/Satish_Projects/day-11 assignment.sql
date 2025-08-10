create database assign1;

use assign1;

create table emp(
	emp_id serial primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    department varchar(20),
    salary decimal(10,2) check (salary>0),
    joining_date date not null,
    age int check(age>=18)
    );
desc emp;


insert into emp values(1,"amit","sharma","it",60000,"2022-05-01",29),
	(2,"neha","patil","hr",70000,"2021-08-15",32),
    (3,"ravi","kumar","Finance",65000,"2020-03-10",35),
    (4,"anjali","verma","it",80000,"2019-11-12",28),
    (5,"suresh","reddy","operations",65000,"2023-01-10",26);
    
select * from emp;

SET SQL_SAFE_UPDATES = 0;
select first_name,department from emp;
update emp set salary=salary+(salary/10) where department='it';
delete from emp where age>=34;

alter table emp add column email varchar(30);
alter table emp rename column department to dept_name;

select first_name,joining_date from emp where joining_date>"2021-01-01";

alter table emp modify salary int;

select first_name,age,salary from emp order by salary desc;

insert into emp values(6,"raj","kiran","market",85000,"2023-01-01",35,"abc@gmail.com");

update emp set age=age+1;