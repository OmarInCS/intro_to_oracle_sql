************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM
[WHERE bool-expr]
[ORDER BY column|expr|alias|number [ASC|DESC]]


* Retriving, Restricting and Sorting data

Math Expr: *, /, +, -
Concat Excpr: ||
Bool-expr:
	>, >=, <, <=, =, <>
	between ... and ...
	in (..., ..., ...)
	like ''
	is [NOT] null

Logical Operators:
	bool-expr and bool-expr
	bool-expr or bool-expr

* Using Single-Row Functions to Customize Output:

	* Characters:
		lower(), upper(), initcap(), trim(), replace(),
		substr(), instr(), length(), lpad(), rpad()
	
	* Numbers:
		round(), trunc(), mod()
		
	* Dates:
		sysdate, current_date, round(), trunc(),
		months_between(), add_months(),
		next_day(), last_day()
		
	* Conversion:
		to_char(), to_date(), to_number()
		
	* General

---------------------- Examples ------------------------

select upper(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'M%' or last_name like 'A%'


select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M')

select round(27.75), round(27.3), trunc(27.99)
from dual

select round(27.734355, 2), round(27.3978548, 3), trunc(27.99999, 2)
from dual

select last_name, salary, salary * 0.032234, round(salary * 0.032234)
from employees


select last_name, salary, salary * 0.032234, trunc(salary * 0.032234) as allowence
from employees


select last_name, salary, salary * 0.032234, trunc(salary * 0.032234, -1) as allowence
from employees

select mod(7, 3), mod(11, 3)
from dual

select sysdate, current_date
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(months_between(sysdate, hire_date) / 12)
from employees

select last_name, hire_date, trunc((sysdate - hire_date) / 365)
from employees

select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees


select last_name, hire_date, trunc(add_months(hire_date, 4), 'Month') as start_date
from employees


select last_name, hire_date, last_day(add_months(hire_date, 3)) as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual


select last_name, round(months_between(sysdate, hire_date)) as months_worked
from employees
order by months_worked

select last_name, trunc((sysdate - hire_date) / 7)
from employees
where department_id = 90

select last_name, to_char(hire_date, 'Day(Dy) DD- Month(Mon) MM-Year YYYY')
from employees

select to_char(sysdate, 'HH24:MI:SS')
from dual


select to_char(sysdate, 'Mon, DD, HH24:MI:SS')
from dual

select last_name, hire_date, to_char(hire_date, 'Ddsp')
from employees


select last_name, hire_date, to_char(hire_date, 'Ddspth')
from employees

select last_name, 'SAR' || to_char(salary, '00,000.00')
from employees


select last_name, 'SAR' || to_char(salary, '99,999.00')
from employees


select last_name, 'SAR' || to_char(salary, '999')
from employees


select to_char(sysdate, 'Mon, DD, "Time:" HH24:MI:SS')
from dual





-------------------- Questions ------------------------

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.



