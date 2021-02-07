************ Week 1, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
	>, >=, <, <=, =, <>
	expr [NOT] BETWEEN .... AND ....
	expr [NOT] IN (.., .., ..)
	expr [NOT] LIKE '...'
	expr IS [NOT] NULL
	
Logical Operators:
	
	bool-expr  AND  bool-expr
	bool-expr  OR  bool-expr
	
* Using Single-Row Functions to Customize Output

	- Charcters:
		upper(), lower(), initcap(), trim(), replace()
		length(), substr(), instr(), lpad(), rpad()
		
	- Numbers:
		round(), trunc(), mod()
		
	- Dates:
		round(), trunc(), sysdate
		months_between( , ), add_months()
		last_day(), next_day()
		
	- Conversion:
	- General:

---------------------- Examples ------------------------

select round(19.75), round(19.6666, 2), round(17.6666, -1)
from dual

select trunc(19.75), trunc(19.6666, 2), trunc(17.6666, -1)
from dual

select last_name, salary, salary * 0.0173, trunc(salary * 0.0173, -1)
from employees

select mod(7, 3), mod(11, 3)
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, round(hire_date, 'Year')
from employees

select sysdate
from dual

select employee_id, job_id
    , round(months_between(end_date, start_date)) as service_period
from job_history


select employee_id, job_id
    , round(months_between(end_date, start_date) / 12) as service_period
from job_history


select employee_id, job_id
    , round(end_date - start_date) as service_period
from job_history


select last_name, hire_date, add_months(hire_date, 3)
        , round(add_months(hire_date, 3), 'Month') as start_date
from employees

select last_name, hire_date, hire_date + 7 as start_date
from employees

select last_day(sysdate)
from dual


select next_day(sysdate, 'Sunday')
from dual


select next_day(sysdate, 'Sun')
from dual


select next_day(sysdate, 1)
from dual



-------------------- Questions ------------------------
* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

* The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.


* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal place. Show the records in descending order of the employee’s tenure.



