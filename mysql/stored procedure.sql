-- STORED PROCEDURES --
/* A stored procedure is a predefined set of SQL statements stored in the database that can be executed repeatedly to perform tasks like querying, updating, or processing data.*/
create procedure large_salaries()
select*
from employee_salary
where salary>=50000;
call large_salaries();
Delimiter && #we can create this by clicking on stored procedures then create stored procedure that is new procedure in the file
 create procedure large salaries2()
begin
	select*
    from employee_salary
    where salary>50000;
    select*
    from employee_salary
    where salary>10000;
end &&
delimiter ;

Delimiter &&
create procedure large_salaries3(par_employee_id int)
begin
	select*
    from employee_salary
    where employee_id=par_employee_id;
end &&
delimiter ;
call large_salaries2(1)

