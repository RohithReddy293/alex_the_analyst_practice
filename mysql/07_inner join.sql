 -- Joins --
 /* Inner join: Inner Join returns only the matching rows from two or more tables based on a related column.*/
 select *
 from employee_demographics;
 select*
 from employee_salary;
select*
from employee_demographics
join employee_salary # join by default means inner join
on employee_demographics.employee_id=employee_salary.employee_id;
select *
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id;
select*
from employee_salary as sal
join employee_demographics as dem
on sal.employee_id=dem.employee_id;
select *
from employee_demographics as dem
join employee_salary as sal
on dem.first_name=sal.first_name;
select dem.employee_ID,age,occupation
from employee_demographics as dem
join employee_salary as sal
on  dem.employee_id=sal.employee_id;