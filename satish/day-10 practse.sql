use company;

create table if not exists people(
	id int primary key,
    name varchar(20) NOT NULL,
    sal int ,
    address varchar(17),
    hiring_date date
    );
    
desc people;

insert into people values(
4,"namya",89000,"puram","2025-07-15"),
(2,"priya",91000,"bgkt","2024-03-12"),
(3,"sadu",95000,"jnpr","2024-01-01");

select * from people;

/*to change the column name*/
alter table people rename column name to full_name;

/*to change the data type of column*/
alter table people modify column sal decimal;

/*to add constraint*/
alter table people modify full_name varchar(20) not null;

/*alter table people drop constraint age;*/

/*to rename the table*/
alter table people rename to persons;
select * from persons;


