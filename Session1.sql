************ Session 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


* Retriving, Restricting and Sorting data




---------------------- Examples ------------------------



select *
from employees

select LAST_NAME, HIRE_DATE, JOB_ID, SALARY
from employees

-- Math Operators: +, -, *, /
select LAST_NAME, HIRE_DATE, JOB_ID, SALARY, salary * 12 as annual_salary
from employees

select LAST_NAME, HIRE_DATE, JOB_ID, SALARY, salary * 12 annual_salary
from employees

select LAST_NAME, HIRE_DATE, JOB_ID, SALARY, salary * 12 "annual salary"
from employees

-- Concat Operator: ||
select first_name || ' ' || last_name, job_id
from employees

select first_name || ' bin ' || last_name as full_name, job_id
from employees


select last_name, salary, COMMISSION_PCT, salary + commission_pct * salary as total_salary
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

