use company;

show tables;

create table stu_2023 (
	stu_id int primary key,
    stu_name varchar(20),
    course varchar(30)
    );
    
insert into stu_2023 values(1,"arav","cse"),
	(2,"ishita","Mech"),
    (3,"kabir","ece"),
    (4,"ananya","civil"),
    (5,"rahul","cse");
select * from stu_2023;


create table stu_2024 (
	stu_id int primary key,
    stu_name varchar(20),
    course varchar(30)
    );
    
insert into stu_2024 values(3,"kabir","ece"),
	 (4,"ananya","civil"),
     (6,"meera","CSE"),
     (7,"vikram","math"),
     (8,"sanya","phy");
select * from stu_2024;

select stu_name,course from stu_2023 
union
select stu_name,course from stu_2024;

select stu_name,course from stu_2023 
union all
select stu_name,course from stu_2024;

select stu_name,course from stu_2023 
intersect
select stu_name,course from stu_2024;

select stu_name,course from stu_2023 
except
select stu_name,course from stu_2024;
    