use company;

show tables;

/*      Arithmetic Operators          */
select * from importing;

select * from importing where age=30;

select * from importing where age!=30;

select * from importing where salary>50000;

select * from importing where salary<=50000;



/*           Logical Operators        */

select * from importing where age>40 and salary>50000;

select * from importing where age>40 and department="IT";

select * from importing where age>40 or salary>50000;

select * from importing where first_name="Louis" or salary>50000;

select * from importing where not department="IT";




/*            Between like etc operators             */

select first_name,last_name,salary from importing where salary between 40000 and 60000;

select first_name,last_name from importing where first_name like 'M%';

select first_name,last_name from importing where first_name like '%M';

select first_name,last_name from importing where first_name like '%M%';


select first_name ,last_name,department from importing where department in("finance","IT");




/*         other Operators            */

select first_name,last_name from importing where salary is null;

select * from importing order by salary;

select * from importing order by salary desc;

select * from importing order by salary asc;


select * from importing order by salary asc limit 5;

select distinct department from importing;

select count(distinct department) as unique_count from importing;