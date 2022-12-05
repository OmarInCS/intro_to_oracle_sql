************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool Expression:
    >, >=, <, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ....)
    LIKE '.....'
    IS [NOT] NULL



---------------------- Examples ------------------------



select *
from employees

select last_name, hire_date, job_id, salary, department_id
from employees

select last_name, hire_date, job_id, salary * 12, department_id
from employees

select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees

select last_name, hire_date, job_id, salary * 12 as "annual salary", department_id
from employees

select last_name, hire_date, job_id, salary * 12 "annual salary", department_id
from employees


select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees

select first_name || ' ' || last_name as full_name
from employees

select first_name || ' bin ' || last_name as full_name
from employees

select distinct department_id
from employees

select unique department_id
from employees


select employee_id, last_name, job_id, hire_date as startdate
from employees

select unique job_id
from employees

select employee_id, last_name, job_id, hire_date as startdate
from employees

------------------

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 90

select last_name, hire_date, job_id, salary, department_id
from employees
where salary <= 2500

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = 'IT_PROG'

select last_name, hire_date, job_id, salary, department_id
from employees
where salary between 2500 and 7500

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date between '01-JAN-07' and '31-DEC-07'

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id in (30, 60, 90)

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%07'

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%MAY%'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '%a%'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '__a%'

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id is null

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id is not null










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
