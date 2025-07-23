use inter;
select * from emp;

/* fetch employees who earn more than average salary of all employees */

with average_sal (avg_sal) as 
	(select round(avg(salary),0) from emp)
select * from emp e,average_sal av
where e.salary > av.avg_sal;


/*