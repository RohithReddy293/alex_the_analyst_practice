#GROUP BY AND ORDER BY#
/* GROUP BY in SQL is used to group rows that have the same values in specified columns into summary rows, like totals or counts.
DISTINCT: Removes duplicate rows from the result and cannot perform aggregate functions on it
GROUP BY: Groups rows based on column values and is often used with aggregate functions like COUNT(), SUM(), etc
aggregate functions : group by,order by,sum,min,max
.*/
select * 
from employee_demographics;
select gender
from employee_demographics
group by gender;
select first_name
from employee_demographics
group by gender;
select gender, avg(age)
from employee_demographics
group by gender;
select distinct gender,avg ( age)
from employee_demographics;
select gender,avg(age),min(age),max(age),count(age)
from employee_demographics
group by gender;
select *
from employee_salary;
select occupation
from employee_salary
group by occupation;
select occupation,salary
from employee_salary
group by occupation,salary;
 -- Order BY--
 /*      ORDER BY is used to sort the result set of a query by one or more columns in ascending (ASC) or descending (DESC) order.
 */
 select *
 from employee_demographics;
 select *
 from employee_demographics
 order by age;
 select * 
 from employee_demographics
 order by first_name;
 select * 
 from employee_demographics
 order by gender,age;
 select *
 from employee_demographics
 order by gender,age desc; 
  select *
 from employee_demographics # here it will not give the output in order because age contains different values in it so we need to give the column name which have unique values first to perform #
      order by age,gender desc;                         #order by on different columns#
 select *
 from employee_demographics
 order by 5,4;
 