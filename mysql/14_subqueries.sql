/* subquery;- It is just a query within another query
Subqueries can return:
A single value (scalar)
A list of values (used with IN)
A table (used in FROM)
They must be enclosed in parentheses ()
Can be correlated (depends on outer query) or non-correlated */

select *
from employee_demographics
where employee_id In 
                      (select employee_id
                       from employee_salary
                       where dept_id=1 )
;
select *
from employee_demographics
where employee_id In
                      (select employee_id,dept_id      #It gives error because operand cannot have two columns
                      from employee_salary  #An operand is the value (or column) that the operator acts on. It's what the operator works with.
                       where dept_id=1 ) #An operator is a symbol or keyword that performs an action on one or more operands. It tells SQL what to do.
;
select first_name,salary,avg(salary)
from employee_salary
group by first_name,salary  #here it is gives average for each person i.e, equal to there salary
;
select first_name,salary,
(select avg(salary)
from employee_salary)
from employee_salary
;
select gender,min(age),max(AGE),avg(age),count(age)
from employee_demographics
group by gender;
select* #It gonna give you same output as previous one as we are not performing any aggregate function
from (select gender,min(age),max(AGE),avg(age),count(age)
from employee_demographics
group by gender) as agg_age
;
select gender,avg(max(age)) # here it gonna give you error because we did not mention age anywhere to get rid of this use ` before and after max(age) or use aliasing in operand
from (select gender,min(age),max(AGE),avg(age),count(age)
from employee_demographics
group by gender) as agg_age
;
select gender,avg(`max(age)`) #here it will give same  max(age) output as the previous table where we performed  agg function by grouping gender to get avg(age) of both genders together we need to remove group by
from (select gender,min(age),max(AGE),avg(age),count(age)
from employee_demographics
group by gender) as agg_age
group by gender
;
select avg(`max(age)`)
from (select gender,min(age),max(AGE),avg(age),count(age)
from employee_demographics
group by gender) as agg_age
;



