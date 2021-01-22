************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
	>, >=, <, <=, =, <>
	expr between .... and ....
	expr in (.., ..., ...)
	expr like '...'
	expr is [not] null
	
Logical Operators:
		bool-expr and	bool-expr
		bool-expr	or	bool-expr
		not bool-expr
		
* Using Single-Row Functions to Customize Output

	* Characters:
		upper(), lower(), initcap(), trim(), replace()
		substr(), instr(), length(), lpad(), rpad()
		
	* Numbers:
		round(), trunc(), mod()
	
	* Dates:
		round(), trunc(), sysdate
		months_between(), add_months()
		next_day(, last_day()
	
	* Conversion:
	* General:

---------------------- Examples ------------------------


select round(27.7), round(27.3), round(27.6666, 2)
from dual


select trunc(27.7), trunc(27.3), trunc(27.6666, 2)
from dual

select last_name, salary, salary * 0.0133
                        , trunc(salary * 0.0133)
                        , trunc(salary * 0.0133, -1)
from employees

select mod(7, 3)
from dual

select mod(11, 3)
from dual

select sysdate
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12)
from employees

select last_name, hire_date, sysdate - hire_date
from employees

select last_name, hire_date, add_months(hire_date, 3)
from employees


select last_name, hire_date, hire_date + 7
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual


select next_day(sysdate, 'Sun')
from dual

select last_name, hire_date, salary
                , next_day(add_months(hire_date, 6), 'Monday') as review
from employees



-------------------- Questions ------------------------

* Write a query that displays the last name (with all letters in uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.

* The HR department wants to find the duration of employment for each employee. For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column as MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Show the records in descending order of the employee’s tenure.

* Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW.

