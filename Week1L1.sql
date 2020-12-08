************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||


---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, salary, job_id, department_id
from employees


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees


select last_name, hire_date, salary, salary * 12 annual_salary
from employees

select last_name, hire_date, salary, salary * 12 as "annual salary"
from employees

select first_name || ' bin ' || last_name as "Full Name"
from employees

select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees

select distinct department_id
from employees


select unique department_id
from employees

select unique department_id
from employees
order by department_id

select unique department_id
from employees
order by department_id desc


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees
order by last_name


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees
order by 2


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees
order by salary * 12 desc


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees
order by annual_salary desc


select last_name, hire_date, department_id, salary, salary * 12 as annual_salary
from employees
order by department_id, hire_date





-------------------- Questions ------------------------
* The HR department wants a query to display the last name, 
job ID, hire date, and employee ID for each employee, 
with the employee ID appearing first. Provide an alias
STARTDATE for the HIRE_DATE column.

* The HR department wants a query to display all 
unique job IDs from the EMPLOYEES table.

