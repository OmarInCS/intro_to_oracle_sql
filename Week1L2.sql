************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Boolean Operators:
    >, >=, <, <=, =, <>
    BETWEEN .... AND ....
    IN (.., ..., ...)
    LIKE '....'
    IS [NOT] NULL

Logical Operators:

    bool-expr and bool-expr
    bool-expr or bool-expr
 
* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()

    - Numbers:
    - Dates:
    - Conversion:
    - General:



---------------------- Examples ------------------------


select *
from hr.employees

select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from hr.employees

select last_name, salary, hire_date, job_id, department_id
from hr.employees
where department_id = 90


select last_name, salary, hire_date, job_id, department_id
from hr.employees
where department_id in (90, 60, 30)


select last_name, salary, hire_date, job_id, department_id
from hr.employees
where job_id in ('IT_PROG', 'SA_REP')



select last_name, salary, hire_date, job_id, department_id
from hr.employees
where hire_date like '%08'


select last_name, salary, hire_date, job_id, department_id
from hr.employees
where hire_date like '%FEB%'


select last_name, salary, hire_date, job_id, department_id
from hr.employees
where last_name like 'A%'


select last_name, salary, hire_date, job_id, department_id
from hr.employees
where last_name like '_e%'

select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where commission_pct is null

select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where commission_pct is not null


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where job_id like '%MAN'

select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where salary in (12000, 11000, 7000)


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where salary in (12000, 11000, 7000) and hire_date like '%07'


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where salary in (12000, 11000, 7000) or hire_date like '%07'


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where department_id = 50 and salary > 5000


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where (department_id = 50 or department_id = 80) and salary > 5000


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where salary > 12000
order by last_name


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where salary > 12000
order by last_name desc


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where salary > 12000
order by 3


select last_name, salary, hire_date, job_id, salary * 12 as annual_salary
from hr.employees
where salary > 12000
order by salary * 12


select last_name, salary, hire_date, job_id, salary * 12 as annual_salary
from hr.employees
where salary > 12000
order by annual_salary desc


select last_name, salary, hire_date, job_id, salary * 12 as annual_salary
from hr.employees
where salary * 12 > 150000
order by annual_salary desc


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
order by department_id desc, hire_date


select upper(last_name), salary, lower(hire_date), initcap(job_id)
from hr.employees



select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where upper(job_id) = upper('it_prog')



select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where upper(job_id) = upper(' it_prog')


select trim('    Welcome   ')
from dual

select *
from dual


select replace('    Welcome   ', ' ', '-')
from dual


select last_name, salary, hire_date, replace(job_id, 'MAN', 'MGR'), department_id, commission_pct
from hr.employees


select last_name, salary, hire_date, job_id, department_id, commission_pct
from hr.employees
where upper(job_id) = trim(upper(' it_prog'))




-------------------- Questions ------------------------
* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


* Create a report to display the last name, salary, and commission of all 
employees who earn commissions. Sort the data in descending order of salary 
and commissions. Use the column’s numeric position in the ORDER BY clause.
