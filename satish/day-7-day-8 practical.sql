use company;

create table if not exists stu(
	stu_id int primary key,
    stu_name varchar(20) NOT NULL,
    marks int ,
    address varchar(17),
    hiring_date date
    );
    
desc stu;

insert into stu values(
4,"namya",89,"puram","2025-07-15"),
(2,"priya",91,"bgkt","2024-03-12"),
(3,"sadu",95,"jnpr","2024-01-01");

select * from stu;

select stu_id,stu_name from stu;

update stu set address="kgt" where stu_id=3;

select * from  stu order by marks asc;

select * from  stu order by marks desc;

update stu set address='kgt' where marks>90;

update stu set stu_name="hlo",marks=90 where stu_id=3;
select * from stu;

