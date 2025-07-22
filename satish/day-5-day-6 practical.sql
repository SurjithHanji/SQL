show databases;
use company;

create table employee2(
emp_id int primary key,
    emp_name varchar(20) NOT NULL,
    sal int ,
    address varchar(17),
    hiring_date date
    );

select * from employee2;

insert into employee2 values(
4,"namya",200000,"puram","2025-07-15"),
(2,"priya",300000,"bgkt","2024-03-12"),
(3,"sadu",400000,"jnpr","2024-01-01");

delete from employee2 where emp_id=2;

alter table employee2 drop column sal;

drop table if exists employee2;

truncate employee2;

create table user(
emp_id int primary key,
    emp_name varchar(20) NOT NULL,
    email varchar(20) unique,
    sal int ,
    address varchar(17),
    hiring_date date,
    age int check(age>18)
    );


insert into user values(
4,"namya","nam@22cs.ac.in",20000,"puram","2025-07-15",25);

insert into user values(
5,"namya","naman@22cs.ac.in",20000,"puram","2025-07-15",10);

select * from user;

