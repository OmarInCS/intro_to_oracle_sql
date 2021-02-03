************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||



---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, job_id, salary
from employees

select last_name, salary, salary * 12 as annual_salary
from employees


select last_name, salary, salary * 12 annual_salary
from employees


select last_name, salary, salary * 12 "annual salary"
from employees

select last_name, salary, commission_pct
                , salary + salary * commission_pct as total_salary
from employees

select first_name || ' bin ' || last_name as "Full Name", salary
from employees

select distinct department_id
from employees


select unique department_id
from employees



-------------------- Questions ------------------------
* The HR department wants a query to display the last name, 
job ID, hire date, and employee ID for each employee, 
with the employee ID appearing first. Provide an alias
STARTDATE for the HIRE_DATE column.

* The HR department wants a query to display all 
unique job IDs from the EMPLOYEES table.

