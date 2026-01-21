-- outer join--
/*Outer Join returns all rows from one or both tables, including non-matching rows, with NULLs where there's no match.
Types: LEFT, RIGHT, FULL OUTER JOIN */
 select *
from employee_demographics as dem
left join employee_salary as sal
on dem.employee_id=sal.employee_id;
select *
from employee_demographics as dem
right join employee_salary as sal
on dem.employee_id=sal.employee_id;
select *
from employee_salary as dem
left join employee_demographics as sal
on dem.employee_id=sal.employee_id;
select *
from employee_salary as dem
right join employee_demographics as sal
on dem.employee_id=sal.employee_id;
