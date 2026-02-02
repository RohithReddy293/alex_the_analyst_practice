/* UNION: UNION is used to combine the results of two or more SELECT statements into a single result set, removing duplicate rows.*/
select *
from employee_demographics
union 
select * #union merges two different tables based on rows
from employee_salary;
select *
from employee_demographics
union
select* # union eliminates the duplicate values because by default union means distinct union if you need full data with duplicates you need enter union all
from employee_demographics;
select *
from employee_demographics
union all
select* # union eliminates the duplicate values because by default union means distinct union if you need full data with duplicates you need enter union all
from employee_demographics;
select first_name,last_name, 'old man' as label
from employee_demographics
where age>40 and gender='male'
union
select first_name,last_name, 'old lady' as label
from employee_demographics
where age>40 and gender='female'
union
select first_name,last_name, salary
from employee_salary
where salary> 70000
order by first_name,last_name;