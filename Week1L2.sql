************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ...]]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool Expression:
    >, >=, <, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ....)
    LIKE '.....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length()

    - Numbers:

    - Dates:

    - Conversion:

    - General:



---------------------- Examples ------------------------




select last_name, hire_date, job_id, salary
from employees
where hire_date like '%07' and salary > 10000

select last_name, hire_date, job_id, salary
from employees
where hire_date like '%07' or salary > 10000

-- IT_PROG, SA_REP
select last_name, hire_date, job_id, salary
from employees
where job_id = 'IT_PROG' or job_id = 'SA_REP'

select last_name, hire_date, job_id, salary
from employees
where job_id in ('IT_PROG', 'SA_REP')

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 50 and salary < 5000

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = &dept and salary < &sal

select last_name, hire_date, job_id, salary &more_col
from employees

define sal = 7000

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = &dept and salary < &sal

undefine dept
undefine sal



select last_name, hire_date, job_id, salary, department_id
from employees
order by last_name


select last_name, hire_date, job_id, salary, department_id
from employees
order by salary desc

select last_name, hire_date, job_id, salary, department_id
from employees
order by 4 desc

select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
order by salary * 12 desc

select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
order by annual_salary desc

select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
where job_id = 'IT_PROG'
order by annual_salary desc

select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
where salary * 12 > 150000
order by annual_salary desc

select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
order by department_id, last_name

----------------------

select upper(last_name), lower(hire_date), initcap(job_id)
from employees



select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
where upper(job_id) = upper('&job')


select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
where upper(job_id) = trim(upper('&job'))

select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), length(last_name)
from employees






-------------------- Questions ------------------------

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results descending by the employees’ last names.
