/* WHERE CLAUSE-It is used to filter  rows, It is also used to perform different comparision functions like >,<,=,!=*/
select * 
from employee_salary;
select first_name 
from employee_salary
where salary > 50000;
select first_name ,salary
from employee_salary
where salary > 50000;
select * 
from employee_salary
where first_name= 'ron'; #strings should be in single quote and the row data that youb enter is not case sensitive#
select*
from employee_salary
where first_name!= 'Ron';
 select*
from employee_salary
where salary>50000;
select*
from employee_salary
where salary>=50000;
 /* AND--OR--NOT*/
select *
from employee_salary
where salary>50000 AND dept_id =  1;
select * 
from employee_demographics
where gender= 'female' and age>40;
select * 
from employee_demographics
where gender= 'male'  or age<50;
select * 
from employee_demographics
where age>50 or not gender= 'female';
-- LIke Statement--
-- % __--
select * 
from employee_demographics
where first_name = 'Jer';
select * 
from employee_demographics
where first_name like  'Jer%';
select * 
from employee_demographics
where first_name like '%er%';
select * 
from employee_demographics
where first_name like 'j____';
select *
from employee_demographics
where first_name like '_e%';


