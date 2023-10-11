************ Session 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns [AS alias]
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]


* Retriving, Restricting and Sorting data

Math Expr: +, -, *, /
Concat Expr: ||
Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND .....
    IN (..., ..., ...)
    LIKE '.....'
    IS [NOT] NULL

Logical Expr:
    bool-expr AND|OR bool-expr



---------------------- Examples ------------------------


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id = 60


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id in (30, 60, 90)

select last_name, hire_date, job_id, department_id, salary
from employees
where salary > 10000

select last_name, hire_date, job_id, department_id, salary
from employees
where salary between 5000 and 10000

select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date between '01-JAN-17' and '31-DEC-17'

select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%17'

select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%MAY%'

select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like 'A%'

select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like '%a%'

select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like '_a%'

select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like '____'

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id in ('ST_MAN', 'SA_MAN', 'MK_MAN')

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id like '%MAN'


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id is null

select last_name, hire_date, job_id, department_id, salary, commission_pct
from employees
where commission_pct is not null

select last_name, hire_date, job_id, department_id, salary, commission_pct
from employees
where commission_pct is not null and salary > 12000


select last_name, hire_date, job_id, department_id, salary, commission_pct
from employees
where commission_pct is not null or (salary > 8000 and department_id = 60)

select last_name, hire_date, job_id, department_id, salary, commission_pct
from employees
where salary < 5000 or salary > 12000


select last_name, job_id, salary
from employees
where job_id in ('ST_CLERK', 'SA_REP')
and salary not in (2500, 3500, 7000)

select last_name, job_id, salary
from employees
where (job_id = 'ST_CLERK' or job_id = 'SA_REP' )
and salary not in (2500, 3500, 7000)


Group 1: 18
Group 2: 18




-------------------- Questions ------------------------

* Because of budget issues, the HR department needs 
a report that displays the last name and salary 
of employees who earn more than $12,000.

* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.

