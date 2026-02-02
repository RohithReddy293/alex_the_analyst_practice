-- WINDOWS FUNCTION --
/* In SQL, a window function performs a calculation across a set of table rows that are related to the current row,
without collapsing the result into a single row like aggregate functions (e.g., SUM, AVG) usually do in GROUP BY. */
select gender, avg(salary)
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id
group by gender
;
select gender,avg(salary) over()
from employee_demographics dem #In the above example everything rolled into one and did agg func but here it remained seperate
join employee_salary sal
on dem.employee_id=sal.employee_id
;
select gender,avg(salary) over(partition by(gender))
from employee_demographics dem 
join employee_salary sal
on dem.employee_id=sal.employee_id
;
select dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by(gender)) sum_salary
from employee_demographics dem 
join employee_salary sal
on dem.employee_id=sal.employee_id
;
select dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by(gender) order by dem.employee_id) as rolling_total
from employee_demographics dem 
join employee_salary sal
on dem.employee_id=sal.employee_id
;
select dem.first_name,dem.last_name,gender,salary,row_number() over() as row_num #it guves row number from first to last
from employee_demographics dem 
join employee_salary sal
on dem.employee_id=sal.employee_id
;
select dem.first_name,dem.last_name,gender,salary,row_number() over(partition by(gender)) as row_num #it guves row number based on gender
from employee_demographics dem 
join employee_salary sal
on dem.employee_id=sal.employee_id
;
select dem.first_name,dem.last_name,gender,salary,row_number() over(partition by(gender) order by salary desc) as row_num
from employee_demographics dem 
join employee_salary sal  #it ginna give row  numbers in desc order of salary divided by gender
on dem.employee_id=sal.employee_id
;
select dem.first_name,dem.last_name,gender,salary,row_number() over(partition by(gender) order by salary desc) as row_num,
rank() over(partition by(gender) order by salary desc)
from employee_demographics dem 
join employee_salary sal  #it gonna give rankings based on salary but 5 repeated two times and rank 6 skipped
on dem.employee_id=sal.employee_id # because both of them earn same salary and systems runs something in background gives ranks 
;
select dem.first_name,dem.last_name,gender,salary,row_number() over(partition by(gender) order by salary desc) as row_num,
rank() over(partition by(gender) order by salary desc)  as rank_num,
dense_rank() over(partition by(gender) order by salary desc) dense_rank_num
from employee_demographics dem  #dense rank wont repeat 5
join employee_salary sal  
on dem.employee_id=sal.employee_id  
;