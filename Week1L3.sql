************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using Single-Row Functions to Customize Output

	* Characters:
		lower(), upper(), initcap(), trim(), replace()
		length(), substr(), instr(), lpad(), rpad()
	* Numbers:
	* Dates:
	* Conversion:
	* General:
	

---------------------- Examples ------------------------


accept low prompt 'Plz, enter lower bound'
define high = 10000

select last_name, hire_date, job_id, salary
from employees
where salary > &&low and salary < &&high

undefine low
undefine high

select last_name, job_id, salary
from employees
where job_id = '&job'

select upper(last_name), lower(hire_date), initcap(job_id)
from employees

select last_name, job_id, salary
from employees
where upper(job_id) = upper('&job')

select trim('    Hello     ')
from dual


select replace('    Hello     ', ' ', '-')
from dual


select last_name, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))

select last_name, employee_id, salary, department_id
from employees
where manager_id = &mgr
order by &col

select upper(last_name) as last_name, length(last_name) as length
from employees
where last_name like 'J%' 
    or last_name like 'A%'
    or last_name like 'M%'
order by last_name

select last_name, hire_date
        , substr(hire_date, 4, 3) as month
        , 20 || substr(hire_date, -2) as year
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
* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

