************ Week 1, Lesson 2 ************** 
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
	* Dates:
	* Conversion:
	* General:

---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary
from employees
where hire_date like '%08' and salary > 6000


select last_name, hire_date, job_id, salary
from employees
where hire_date like '%08' or hire_date like '%07'


select last_name, hire_date, job_id, salary
from employees
where job_id = 'SA_MAN' or job_id = 'PU_CLERK'

select last_name, hire_date, job_id, salary
from employees
where job_id in ('SA_MAN', 'PU_CLERK')

select last_name, hire_date, job_id, salary
from employees
where salary > &sal

accept sal prompt 'Enter value for salary:'
define sal = 7000

select last_name, hire_date, job_id, salary
from employees
where salary > &&sal

undefine sal


select last_name, hire_date, job_id, salary
from employees
where job_id = '&job'



select upper(last_name), lower(hire_date), initcap(job_id), salary
from employees



select last_name, hire_date, job_id, salary
from employees
where job_id = trim(upper('&job'))


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees


select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , 20 || substr(hire_date, -2) as hire_year
from employees

select last_name, instr(last_name, 'e')
from employees


select last_name, instr(last_name, 'e', 3)
from employees


select last_name, instr(last_name, 'e', 1, 2)
from employees

select last_name, length(last_name)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select upper(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'




-------------------- Questions ------------------------

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.


* Create a report to display the last name, salary, and commission of all employees who earn commissions. Sort the data in descending order of salary and commissions. Use the column’s numeric position in the ORDER BY clause.

* Write a query that displays the last name (with all letters in uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.
