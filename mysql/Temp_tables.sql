-- Temporary tables--
/* a temporary table is a special type of table that allows you to store and manipulate intermediate results within a database session. Unlike standard tables, 
temporary tables are session-specific and automatically deleted when the session ends or when explicitly dropped.*/
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100));
select*
from temp_table;
Insert into temp_table
values( 'rohith','shyamakuri','sadguru sai');
select *
from temp_table;
Create temporary table salary_over_50k
select *
from employee_salary
where salary>=50000;
select *
from salary_over_50k;     #temporary table works until you are in the same tab or you just open new tab without closing the original one but once you close tab it will not work
