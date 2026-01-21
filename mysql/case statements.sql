/* CASE STATEMENTS:-The CASE statement in SQL is used to implement conditional logic within queries. It works like an if-then-else statement and allows you to return specific values based on conditions. */
select first_name,
last_name,
age,
case
when age<=30 then 'young'
when age between 31 and 50 then 'old'
when age >=50 then 'on death bed'
End as age_bracket
from employee_demographics;
-- Pay increase and bonus 
-- <50000=5%
-- >5000=7%
-- finance_department= 10% bonjs
select first_name,last_name,salary,
case
when salary<50000 then salary*1.05
when salary>50000 then salary*1.07
end as new_salary,
case 
when dept_id=6 then salary*.10
end as bonus
from employee_salary;


    