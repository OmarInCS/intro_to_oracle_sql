************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]

* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, <>, !=, ^=
    BETWEEN ... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical Operators:

    bool-expr AND|OR  bool-expr



---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, job_id, salary, department_id
from employees

select last_name, salary, salary * 12 as annual_salary
from employees


select last_name, salary, salary * 12 as "annual salary"
from employees


select last_name, salary, salary * 12 annual_salary
from employees

select first_name || ' ' || last_name as full_name, salary
from employees


select first_name || ' bin ' || last_name as full_name, salary
from employees

select last_name, salary, commission_pct, salary + commission_pct * salary as total_salary
from employees

select distinct department_id
from employees

select unique department_id
from employees


select distinct department_id, job_id
from employees


select last_name, hire_date, job_id, salary, department_id
from employees
where salary > 12000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date < '01-JAN-03'

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date between '01-JAN-03' AND '31-DEC-04'


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id in (10, 30, 60)


select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in ('ST_MAN', 'PU_MAN', 'SA_MAN')


select last_name, hire_date, job_id, salary, department_id
from employees
where job_id like '%MAN'


select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%MAY%'

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like 'MAY'


select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like 'A%'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '_a%'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '____'


select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where commission_pct is not null


--select last_name, hire_date, job_id, salary, department_id, commission_pct
--from employees
--where commission_pct not null


select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where hire_date like '%02' or hire_date like '%06'

select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where commission_pct is not null and salary > 10000


select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where (job_id = 'ST_CLERK' OR job_id = 'SA_REP') and salary not in (2500, 3500, 7000)

select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where job_id in ('ST_CLERK', 'SA_REP') and salary not in (2500, 3500, 7000)








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


* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.
