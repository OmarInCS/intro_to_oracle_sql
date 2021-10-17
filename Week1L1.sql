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
Boolean Operators:
    >, >=, <, <=, =, <>
    between ... and .....


---------------------- Examples ------------------------


select *
from hr.departments

select *
from hr.employees


select last_name, hire_date, salary
from hr.employees


select last_name, hire_date, salary, salary * 12 as annual_salary
from hr.employees

select last_name, hire_date, salary, salary * 12 as "annual salary"
from hr.employees


select last_name, hire_date, salary, salary * 12 "annual salary"
from hr.employees

select first_name || ' ' || last_name as full_name
from hr.employees

select last_name, hire_date, job_id, salary, department_id
from hr.employees
where salary > 12000



select last_name, hire_date, job_id, salary, department_id
from hr.employees
where department_id = 80


select last_name, hire_date, job_id, salary, department_id
from hr.employees
where job_id = 'IT_PROG'

select last_name, hire_date, job_id, salary, department_id
from hr.employees
where salary between 5000 and 10000



select last_name, hire_date, job_id, salary, department_id
from hr.employees
where hire_date between '01-JAN-08' and '31-DEC-08'

select distinct department_id
from hr.employees


select unique department_id
from hr.employees


select last_name, hire_date, job_id, salary, department_id
from hr.employees
where salary not between 5000 and 10000




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
