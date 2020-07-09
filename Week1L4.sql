************ Week 1, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]


	
* Using Single-Row Functions to Customize Output

	* Characters:
		lower(), upper(), initcap(), trim(), replace(),
		substr(), instr(), length(), lpad(), rpad()
	
	* Numbers:
		round(), trunc(), mod()
		
	* Dates
	* Conversion
	* General

---------------------- Examples ------------------------


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary, department_id
from employees

select last_name, hire_date, substr(hire_date, 4, 3) as hire_month
                        , 20 || substr(hire_date, 8) as hire_year
from employees

select last_name, instr(last_name, 'e')
from employees


select last_name, instr(last_name, 'e', 4)
from employees


select last_name, instr(last_name, 'e', 1, 2)
from employees

select street_address
from locations
where street_address like '%St'


select street_address
from locations
where substr(street_address, instr(street_address, 'St')) = 'St'

select last_name, length(last_name)
from employees

select lpad(last_name, 15, '-'), rpad(last_name, 15, '-')
from employees

select round(19.7), round(19.3)
from dual


select trunc(19.7), trunc(19.3)
from dual


select round(19.7777, 2), round(19.3333, 2)
from dual


select trunc(19.7777, 2), trunc(19.3333, 2)
from dual

select last_name, salary, salary * 0.012312, round(salary * 0.012312)
from employees


select last_name, salary, salary * 0.012312, trunc(salary * 0.012312)
from employees


select last_name, salary, salary * 0.012312, trunc(salary * 0.012312, -1)
from employees

select mod(7, 3)
from dual


select mod(11, 3)
from dual

select upper(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'






-------------------- Questions ------------------------
* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.



