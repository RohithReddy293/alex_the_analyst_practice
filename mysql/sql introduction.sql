/* select* is used to select all the data in a particular table 
syntax should always end with ;or else it gonna show errror syntax
you cannot select all the data from different tables at the same time using select function
database and table should be seperated with (.) if you do not highlight database on the left side use table name along with database seperated by . to get output without error
To run full code that you have written click on the thunderstorm button and to run particular part of the code highlight the code and click on the thunderstorm with i on it
it doesn't matter whether you enter * with space or without space  with select function
Keywords and column indexes like select where and ID are not case sensitive
aliases string comparisions are case sensitive
*/


SELECT*
from parks_and_recreation.employee_demographics;
select *
from parks_and_recreation.employee_demographics;
select*
from parks_and_recreation.employee_salary;
select*
from parks_and_recreation.parks_departments;
select*
from parks_and_recreation.parks_departments,employee_salary,eomployee_demographics;
select *
from parks_departments;
select*
from employee_demographics;
select* 
from employee_salary;