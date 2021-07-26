************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]

* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, >=, <, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL



---------------------- Examples ------------------------


select *
from employees;

select last_name, hire_date, job_id, salary
from employees;

select last_name, hire_date, job_id, salary, salary * 12 as annual_salary
from employees;


select last_name, hire_date, job_id, salary, salary * 12 as "annual salary"
from employees;

select last_name, hire_date, job_id, salary, salary * 12 "annual salary"
from employees;

select first_name || ' bin ' || last_name as full_name
from employees;

select distinct department_id
from employees;

select unique department_id
from employees;


select last_name, hire_date, job_id, salary
from employees;

select last_name, hire_date, job_id, salary
from employees
where salary > 12000;

select last_name, hire_date, job_id, salary
from employees
where job_id = 'IT_PROG';

select last_name, hire_date, job_id, salary
from employees
where hire_date > '01-JAN-08';

select last_name, hire_date, job_id, salary
from employees
where hire_date between '01-JAN-07' and '31-DEC-07';

select last_name, hire_date, job_id, salary
from employees
where hire_date like '%07';

select last_name, hire_date, job_id, salary
from employees
where hire_date like '%JUN%';

select last_name, hire_date, job_id, salary
from employees
where last_name like 'A%'

select last_name, hire_date, job_id, salary
from employees
where last_name like '__a%'

select last_name, hire_date, job_id, salary
from employees
where job_id in ('SA_REP', 'SH_CLERK', 'AD_ASST')


select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees

select last_name, hire_date, job_id, salary, salary + salary * commission_pct as total_salary
from employees
where commission_pct is not null


select *
from employees
where salary > 12000




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
