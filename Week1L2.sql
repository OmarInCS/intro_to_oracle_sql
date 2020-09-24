************ Week 1, Lesson 2 ************** 
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
	* Numbers
	* Dates
	* Conversion
	* General

---------------------- Examples ------------------------


select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK') and salary not in (2500, 3500, 7000)

select last_name, job_id, salary
from employees
where salary > &sal


select last_name, job_id, salary
from employees
where job_id = '&job'

select last_name, job_id, salary &more_columns
from employees

select last_name, job_id, salary, hire_date
from employees
order by salary desc


select last_name, job_id, salary * 12 as annual_salary, hire_date
from employees
order by salary * 12 desc


select last_name, job_id, salary * 12 as annual_salary, hire_date
from employees
order by annual_salary desc


select last_name, job_id, salary * 12 as annual_salary, hire_date
from employees
--where annual_salary > 150000  Error
where salary * 12 > 150000

select last_name, job_id, salary * 12 as annual_salary, hire_date
from employees
order by 3 desc


select last_name, job_id, salary * 12 as annual_salary, hire_date
from employees
order by &column &sort_type


select last_name, job_id, salary , hire_date
from employees
order by job_id, last_name

select upper(last_name), initcap(job_id), lower(hire_date)
from employees

select last_name, job_id, salary
from employees
where upper(job_id) = upper('&job')

select trim('    Hello     ')
from dual

select *
from dual


select replace('    Hello World     ', ' ', '-')
from dual

select last_name, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))



select last_name, replace(job_id, 'MAN', 'MGR') as job_id, salary
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


select lpad(last_name, 15, '-'), rpad(last_name, 15, '-')
from employees







-------------------- Questions ------------------------

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.

* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.



