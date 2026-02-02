/*select stament is used to work with columns and it used to see what columns we need in the output
*/
select *
from parks_departments;
select department_name
from parks_departments;
select department_id
from parks_departments;
select *
from employee_demographics;
select first_name,last_name,gender
from employee_demographics;
select first_name, #It doesn't matter whether you write the column name in same line or different lines it is used just for clear visual representation#
last_name,
gender
from employee_demographics;
select age 
from employee_demographics;
select first_name,
last_name,
age,
age+15
from employee_demographics;
select age,# sql follows the PEMDAS rule division and multiplication,addition and substration from left to right order you can use parenthesis for chaging in order#
(age+10)*20,
age - 10+20
from employee_demographics;
select age,# AS it follows the pemdas rule here it does the division operation first and then  add it to age#
age+10/2
from employee_demographics;
select age,# AS it follows the pemdas rule here it does the addition operation first and then  divide it#
(age+10)/2
from employee_demographics;
select age,
age*10/2
from employee_demographics;
select gender
from employee_demographics;
select Distinct gender
from employee demographics;  #it gonna give you only two output that is male and female because those are the only two different genders available in the table#
select distinct gender,
first_name
from eomployee_demographics; # it guves all the first name and gender in the output even though you entered distinct because first name and gender combined no more a distinct value#
