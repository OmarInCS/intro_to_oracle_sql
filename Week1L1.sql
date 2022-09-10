************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column1, ...
FROM table
[WHERE bool-expr [AND|OR bool-expr]]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        length(), lpad(), rpad()

    - Numbers

    - Dates

    - Conversion

    - General


---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, job_id, salary
from employees

select last_name, hire_date, job_id, salary, salary * 12 as annual_salary
from employees

select last_name, hire_date, job_id, salary, salary * 12 as "annual salary"
from employees

select last_name, hire_date, job_id, salary, salary * 12 "annual salary"
from employees

select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees


select first_name || ' ' || last_name as full_name
from employees

select first_name || ' bin ' || last_name as full_name
from employees


select distinct department_id
from employees

select unique department_id
from employees

select last_name, hire_date, job_id ,department_id, salary, commission_pct
from employees
where salary < 2500

select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where department_id = 30


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where job_id = 'IT_PROG'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where hire_date > '01-JAN-08'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where hire_date between '01-JAN-07' and '31-DEC-07'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where department_id in (30, 60, 90)


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where hire_date like '%07'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where hire_date like '%MAY%'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where job_id like '%MAN'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where last_name like '_a%'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where last_name like '____'


select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where commission_pct is not null

select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where commission_pct is null



select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where job_id like '%MAN' and hire_date like '%07'

select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where job_id like '%MAN' or hire_date like '%07'

select last_name, hire_date, job_id ,department_id, commission_pct
from employees
where job_id like '%MAN' or hire_date like '%07'
order by last_name

select last_name, hire_date, job_id ,department_id, salary, commission_pct
from employees
where job_id like '%MAN' or hire_date like '%07'
order by salary desc

select last_name, hire_date, job_id ,department_id, salary, commission_pct
from employees
where job_id like '%MAN' or hire_date like '%07'
order by 2 desc

select last_name, hire_date, job_id ,department_id, salary * 12 as annual_salary, commission_pct
from employees
where job_id like '%MAN' or hire_date like '%07'
order by salary * 12 desc

select last_name, hire_date, job_id ,department_id, salary, salary * 12 as annual_salary, commission_pct
from employees
where job_id like '%MAN' or hire_date like '%07' and salary * 12 > 100000
order by annual_salary desc

select last_name, hire_date, job_id ,department_id, salary, salary * 12 as annual_salary, commission_pct
from employees
where (job_id like '%MAN' or hire_date like '%07') and salary * 12 > 100000
order by annual_salary desc

select *
from employees
where salary > 12000

select *
from employees
where salary > &sal and last_name like '%&name%'

define sal = 15000

select *
from employees
where salary > &sal

undefine sal

select upper(last_name), lower(hire_date), initcap(job_id)
from employees

select last_name, hire_date, job_id, salary, department_id
from employees
where upper(job_id) = upper('&job')


select trim('    Hello World   ')
from dual

select last_name, hire_date, job_id, salary, department_id
from employees
where upper(job_id) = trim(upper('&job'))

select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary, department_id
from employees

select last_name, length(last_name)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select *
from employees
where department_id = 60 or department_id = 90






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

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.
