/* self join: A self join is a regular join where a table is joined with itself to compare rows within the same table using aliases*/
select *
from employee_salary;
select *
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id=emp2.employee_id;
select *
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id+1=emp2.employee_id;
select *
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id=emp2.employee_id+1;
select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id,
emp2.first_name,
emp2.last_name
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id=emp2.employee_id;
select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id,
emp2.first_name,
emp2.last_name
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id+1=emp2.employee_id;


