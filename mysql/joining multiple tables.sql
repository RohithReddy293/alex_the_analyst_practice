/* joining multiple tables: here the tables should have common data in it*/
select * 
from employee_demographics;
select*
from employee_salary;
select*
from parks_departments;
select*
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
join parks_departments as dept
on sal.dept_id=dept.department_id;
