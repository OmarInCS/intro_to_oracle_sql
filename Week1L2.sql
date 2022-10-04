************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ....]]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

* Retriving, Restricting and Sorting data


Math Operators: +, -, *, /
Concat Operator: ||
Bool Expression:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()

    - Numbers:

    - Dates:

    - Conversion:

    - General:

---------------------- Examples ------------------------



select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%07' and salary > 7000

select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%07' or salary > 7000

select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%07' or salary > &sal


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%07' and job_id = '&job'

select last_name, hire_date, job_id, department_id, salary &more_cols
from employees
where hire_date like '%07'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%07'
order by last_name

select last_name, hire_date, job_id, department_id, salary
from employees
order by last_name

select last_name, hire_date, job_id, department_id, salary
from employees
order by salary

select last_name, hire_date, job_id, department_id, salary
from employees
order by salary desc

select last_name, hire_date, job_id, department_id, salary
from employees
order by 5 

select last_name, hire_date, job_id, department_id, salary * 12 as annual_salary 
from employees
order by salary * 12

select last_name, hire_date, job_id, department_id, salary * 12 as annual_salary 
from employees
order by annual_salary

select last_name, hire_date, job_id, department_id, salary * 12 as annual_salary 
from employees
-- where annual_salary > 150000
where salary * 12 > 150000
order by annual_salary


select last_name, hire_date, job_id, department_id, salary * 12 as annual_salary 
from employees
-- where annual_salary > 150000
where salary * 12 > 150000
order by annual_salary desc


select last_name, hire_date, job_id, department_id, salary
from employees
order by job_id, last_name

select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK') and salary not in (2500, 3500, 7000)


select upper(last_name), lower(hire_date), initcap(job_id)
from employees


select last_name, hire_date, job_id, department_id, salary
from employees
where upper(job_id) = upper('&job')

select *
from dual


select trim('   Hello World   ')
from dual

select last_name, hire_date, job_id, department_id, salary
from employees
where upper(job_id) = trim(upper('&job'))

select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), department_id, salary
from employees


select last_name, length(last_name)
from employees




-------------------- Questions ------------------------

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.

* from locations table display city and building num. which is the number at the begining 
of street address for all addresses in US and JP. (hint: use substr function)
