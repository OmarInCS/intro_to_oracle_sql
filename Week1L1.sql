************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical operators:

    bool-expr AND|OR bool-expr 

* Using Single-Row Functions to Customize Output

    * characters:
        lower(), upper(), initcap(), trim(), replace()
        length()

    * numbers:

    * dates:

    * conversion:

    * general:


---------------------- Examples ------------------------



select *
from employees


select last_name, hire_date, salary, job_id, department_id
from employees

select last_name, salary, salary * 12 as annual_salary
from employees


select last_name, salary, salary * 12 annual_salary
from employees


select last_name, salary, salary * 12 "annual salary"
from employees

select first_name || ' bin ' || last_name as full_name, salary
from employees

select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees

select distinct department_id
from employees

select unique department_id
from employees


select last_name, hire_date, salary, job_id, department_id
from employees
where salary > 12000

select last_name, hire_date, salary, job_id, department_id
from employees
where department_id = 60

select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date > '01-JAN-07'

select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date between '01-JAN-07' and '31-DEC-07'

select last_name, hire_date, salary, job_id, department_id
from employees
where job_id in ('ST_MAN', 'SA_MAN', 'PU_MAN')

select last_name, hire_date, salary, job_id, department_id
from employees
where job_id like '%MAN'

select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date like '%07'

select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date like '%MAY%'

select last_name, hire_date, salary, job_id, department_id
from employees
where last_name like '%a%'

select last_name, hire_date, salary, job_id, department_id
from employees
where last_name like '_a%'


select last_name, hire_date, salary, job_id, department_id
from employees
where last_name like '____'


select last_name, hire_date, salary, job_id, department_id, commission_pct
from employees
where commission_pct is null

select last_name, hire_date, salary, job_id, department_id, commission_pct
from employees
where commission_pct is not null


select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date > '01-JAN-07' and salary > 10000



select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date > '01-JAN-07' or salary > 10000
order by last_name

select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date > '01-JAN-07' or salary > 10000
order by salary desc


select last_name, hire_date, salary, job_id, department_id
from employees
where hire_date > '01-JAN-07' or salary > 10000
order by 3 desc



select last_name, hire_date, job_id, salary * 12 as annual_salary
from employees
order by salary * 12 desc


select last_name, hire_date, job_id, salary * 12 as annual_salary
from employees
where salary * 12 > 150000
order by annual_salary desc


select *
from employees
where salary > 12000


select last_name, hire_date, salary, job_id, department_id
from employees
order by last_name
offset 5 rows
fetch next 5 rows only


select last_name, hire_date, salary, job_id, department_id
from employees
order by last_name
offset 10 rows
fetch next 7 rows only



select last_name, hire_date, salary &more_col
from employees
where salary > &sal
order by last_name


select last_name, hire_date, salary &more_col
from employees
where salary > &&sal
order by last_name

undefine sal

define job = 'SA_REP'


select last_name, hire_date, salary, job_id, department_id
from employees
where job_id = '&job'


select upper(last_name), lower(hire_date), initcap(job_id)
from employees


undefine job

select last_name, hire_date, salary, job_id, department_id
from employees
where upper(job_id) = upper('&job')

select trim('  Hello World!   ')
from dual


select replace('  Hello World!   ', ' ', '-')
from dual

select replace('  Hello World!   ', ' ', '')
from dual


select last_name, hire_date, salary, job_id, department_id
from employees
where upper(job_id) = trim(upper('&job'))


select last_name, hire_date, salary, replace(job_id, 'MAN', 'MGR'), department_id
from employees

select last_name, length(last_name)
from employees







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

* Create a report to display the last name, salary, and commission of all 
employees who earn commissions. Sort the data in descending order of salary 
and commissions. Use the column’s numeric position in the ORDER BY clause.

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.
