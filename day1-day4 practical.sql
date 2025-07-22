show databases;
drop database sys;

create database company;
use company;

create table employee(
	emp_id int primary key,
    emp_name varchar(20) NOT NULL,
    sal int ,
    address varchar(17),
    hiring_date date
    );
drop table employee;
desc employee;

select * from employee;

insert into employee values(
4,"namya",200000,"puram","2025-07-15"),
(2,"priya",300000,"bgkt","2024-03-12"),
(3,"sadu",400000,"jnpr","2024-01-01");

alter table employee rename column emp_name to first_name;

truncate table employee;