************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
	>, >=, <, <=, =, <>
	between ... and ....
	in (..., ..., ...)
	like '...'
	is [not] null

Logical Operators:
		bool-expr and bool-expr
		bool-expr or bool-expr

	
* Using Single-Row Functions to Customize Output

	* Characters:
		lower(), upper(), initcap(), trim(), replace()
	* Numbers
	* Dates
	* Conversion
	* General

---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 80 and salary > 5000


select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
where manager_id = 103 or manager_id = 121


select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
where manager_id in (103, 121)

select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
where hire_date >= '01-JAN-08' and hire_date <= '31-DEC-08'


--select last_name, hire_date, job_id, salary, department_id, manager_id
--from employees
--where hire_date like '%05' or hire_date like '%08' and salary > 5000 -- Logic Error


select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
where (hire_date like '%05' or hire_date like '%08') and salary > 5000
order by hire_date

select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
order by last_name


select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
order by 2


select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
order by salary desc


select last_name, hire_date, job_id, salary, department_id, manager_id
from employees
order by salary desc, last_name


select last_name, hire_date, job_id, salary, salary * 12 as annual_salary
from employees
where salary * 12 > 50000
order by annual_salary

select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK') and salary not in (2500, 3500, 7000)
 
select last_name, job_id, salary
from employees
where salary > &sal


select last_name, job_id, salary
from employees
where job_id = '&job'


select last_name, job_id, salary, &col
from employees

select upper(last_name), initcap(job_id), lower(hire_date)
from employees

select last_name, job_id, salary
from employees
where job_id = upper('&job')


select last_name, job_id, salary
from employees
where upper(job_id) = upper('&job')

select *
from dual

select trim('    Hello     ')
from dual


select replace('    Hel lo     ', ' ', '-')
from dual


select replace('    Hel lo     ', ' ', '')
from dual


select last_name, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))








-------------------- Questions ------------------------
* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.


* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.

* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.



