 /* LIMIT AND ALIASING The LIMIT clause is used to restrict the number of rows returned by a SQL query.
 Aliasing is used to give a temporary name to a table or column in a SQL query for better readability.*/
 SELECT * 
 from employee_demographics
 limit 3;
 select * 
 from employee_demographics
 order by age desc
 limit 3;
 select *
 from employee_demographics
 limit 3,1;
 -- aliasing--
 select gender,avg(age) as avg_age
 from employee_demographics
 group by gender;
 select gender,avg(age)  avg_age # even without as it does same if we add new name
 from employee_demographics
 group by gender;
 