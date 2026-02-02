-- CTE's --
/*A CTE (Common Table Expression) in SQL is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
 It's often used to make complex queries easier to read and maintain.*/
 with cte_example as
 (
 select gender,avg(salary),min(salary),max(salary),count(salary)
 from employee_demographics dem
 join employee_salary sal
 on dem.employee_id=sal.employee_id
 group by gender
 )
 select*
 from cte_example;
 with cte_example as
 (
 select gender,avg(salary) avg_sal,min(salary) min_sal,max(salary) max_sal,count(salary) count_sal
 from employee_demographics dem
 join employee_salary sal
 on dem.employee_id=sal.employee_id
 group by gender
 )
 select avg(avg_sal)
 from cte_example;
 
 select avg(avg_sal)
 from (select gender,avg(salary) avg_sal,min(salary) min_sal,max(salary) max_sal,count(salary) count_sal
  from employee_demographics dem
 join employee_salary sal
 on dem.employee_id=sal.employee_id
 group by gender
 ) example_subquerie   /*using sunbquery or cte gives same output but we use cte for better redability*/
 ;
 with cte_example as 
 (
 select employee_id,gender,birth_date
 from employee_demographics dem
 where birth_date> '1985-01-01'
 ),
 cte_example2 as
 (
 select employee_id,salary
 from employee_salary as sal
 where salary>50000
 )
 select*
 from cte_example
 join cte_example2
 on cte_example.employee_id=cte_example2.employee_id;
 with cte_example (Gender,Avg_salary,Min_salary,Max_salary,Count_sal) as
 (
 select gender,avg(salary),max(salary),min(salary),count(salary)
 from employee_demographics dem
 join employee_salary sal
 on dem.employee_id=sal.employee_id
 group by gender
 )
 select*
 from cte_example;
 
 

