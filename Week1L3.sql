************ Week 1, Lesson 3 ************** 
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
	- Dates:
	- Conversion:
	- General:

---------------------- Examples ------------------------


define low = 5000
define high = 10000

select last_name, hire_date, job_id, salary, department_id
from employees
where salary between &&low and &&high

undefine low
undefine high

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '&name%'

select last_name, hire_date, job_id, salary &columns
from employees


select upper(last_name), lower(hire_date), initcap(job_id)
from employees

select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = upper('&job')

select trim('    Hello   ')
from dual


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees

select last_name, length(last_name)
from employees

select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , 20 || substr(hire_date, -2) as hire_year
from employees

select last_name, instr(last_name, 'e')
from employees


select last_name, instr(last_name, 'e', 4)
from employees


select last_name, instr(last_name, 'e', 1, 3)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees


-------------------- Questions ------------------------
* Write a query that displays the last name (with all letters in uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.



