************ Week 1, Lesson 1 ************** 
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

---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, job_id, salary
from employees


select last_name, hire_date, job_id, salary, salary * 12 as annual_salary
from employees


select last_name, hire_date, job_id, salary, salary * 12 annual_salary
from employees


select last_name, hire_date, job_id, salary, salary * 12 "Annual Salary"
from employees

select first_name || ' ' || last_name
from employees


select first_name || ' bin ' || last_name
from employees

select last_name, salary, commission_pct
                        , salary + salary * commission_pct as total_salary
from employees

select distinct department_id
from employees


select unique department_id
from employees

select last_name, hire_date, job_id, department_id, salary
from employees
where salary >= 10000


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = 'SA_MAN'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date > '01-JAN-08'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date between '01-JAN-08' and '31-DEC-08'

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id in (60, 30, 20)


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id in ('PU_CLERK', 'ST_CLERK')


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id like '%CLERK'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%08'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%MAY%'


select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like 'K%'


select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like '_e%'


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id is null


select last_name, hire_date, job_id, department_id, salary
from employees
order by last_name


select last_name, hire_date, job_id, department_id, salary
from employees
order by salary desc


select last_name, hire_date, job_id, department_id, salary
from employees
order by 5 desc


select last_name, hire_date, salary * 12 as annual_salary
from employees
order by salary * 12 desc


select last_name, hire_date, salary * 12 as annual_salary
from employees
where salary * 12 > 150000
order by annual_salary desc





-------------------- Questions ------------------------
* The HR department wants a query to display the last name, 
job ID, hire date, and employee ID for each employee, 
with the employee ID appearing first. Provide an alias
STARTDATE for the HIRE_DATE column.

* The HR department wants a query to display all 
unique job IDs from the EMPLOYEES table.

* Because of budget issues, the HR department needs 
a report that displays the last name and salary 
of employees who earn more than $12,000.

* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.


* Create a report to display the last name, salary, and commission of all employees who earn commissions. Sort the data in descending order of salary and commissions. Use the column’s numeric position in the ORDER BY clause.
