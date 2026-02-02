-- TRiggers --
/* A trigger in SQL is a special kind of stored procedure that automatically executes or "fires" when certain events occur in the database. These events can be:

INSERT (when a new row is added),

UPDATE (when a row is modified),

DELETE (when a row is removed). */
select *
from employee_salary;
select*
from employee_demographics;
 
 
delimiter $$
create trigger employee_insert
after insert on employee_salary
for each row
begin
insert into employee_demographics(employee_id,first_name,last_name)
values(new.employee_id,new.first_name,new.last_name);
end $$parks_departmentsemployee_salary
delimiter ;
insert into employee_salary( employee_id,first_name,last_name,occupation,salary,dept_id)
values (13,'Jhonson','kennedy','entertainment',1000000,null);
-- EVENTS--
/*Events in SQL are scheduled tasks that run automatically at a specified time or interval. 
They are used to perform actions like updating tables, deleting old data, or running maintenance tasks without manual intervention.*/
select *
from employee_demographics;


delimiter $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    delete 
    from employee_demographics
    WHERE age >= 60;
END $$
delimiter ;
show variables like 'event%'
