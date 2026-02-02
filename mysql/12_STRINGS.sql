-- strings functions --
/* LENGHT */
select length( 'skyfall');
select first_name,length(first_name)
from employee_demographics;
select birth_date,length(birth_date)
from employee_demographics;
select first_name,length(first_name)
from employee_demographics
order by 1; # 1 is column number 
/* UPPER AND LOWER*/
select upper('sky');
select lower ('sky');
select first_name,upper(first_name)
from employee_demographics;
select first_name,lower(first_name)
from employee_demographics;
/* TRIM */
SELECT TRIM('SKY') AS TRIM;
SELECT TRIM('    SKY');
SELECT TRIM('SKY      ') AS TRIM;
SELECT TRIM('   SKY    ') AS TRIM;
/* SUBSTRING */
select first_name,
left(first_name,4),
right(first_name,4),
substring( first_name,3,2),
substring(birth_date,6,2) as birth_month
from employee_demographics;
/* REPLACE AND LOCATE*/
select first_name, replace(first_name,'o','c')
from employee_demographics;
select locate('o','Rohith');
select first_name,locate('An','first_name')
from employee_demographics;
/* CONCATINATION */
selec
t first_name,last_name,
concat(first_name,' ',last_name)
from employee_demographics;




