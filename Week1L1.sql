************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT [DISTINCT|UNIQUE] *|columns
FROM table_name
[WHERE bool-expr [OR|AND bool-expr]]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr( , , ), instr(), length(), lpad(), rpad()

    - Numbers:

    - Dates:

    - Conversion:

    - General:


---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, job_id, salary, department_id
from employees


select last_name, hire_date, job_id, salary, salary * 12 as annual_salary, department_id
from employees

select last_name, hire_date, job_id, salary, salary * 12 as "annual salary", department_id
from employees


select last_name, hire_date, job_id, salary, salary * 12 "annual salary", department_id
from employees

select last_name, hire_date, job_id, salary, salary * 12 annual_salary, department_id
from employees

-- Math operators: *, /, +, -
-- Concat Operator:  ||

select first_name || ' ' || last_name as full_name
from employees


select first_name || ' bin ' || last_name as full_name
from employees

select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees


select distinct department_id
from employees

select unique department_id
from employees


select last_name, hire_date, job_id, salary, department_id
from employees
where salary < 3000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date < '01-JAN-03'

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 30

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date between '01-JAN-03' and '31-DEC-03'

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id in (30, 60, 90)

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%03'

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%MAY%'

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
where commission_pct is null

select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where commission_pct is not null


select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%05' and salary > 12000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%05' or salary > 12000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%05' and salary > &sal

define sal = 10000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%05' and salary > &&sal

undefine sal


select last_name, hire_date, job_id, salary, department_id
from employees
order by last_name

select last_name, hire_date, job_id, salary, department_id
from employees
where salary < 3000
order by hire_date desc

select last_name, hire_date, job_id, salary * 12, department_id
from employees
where salary < 3000
order by 2 desc


select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
where salary < 3000
order by salary * 12 desc



select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
where salary * 12 < 31000
order by annual_salary desc


select last_name, hire_date, job_id, salary * 12 as annual_salary, department_id
from employees
order by department_id, hire_date


select upper(last_name), lower(hire_date), initcap(job_id)
from employees


select last_name, hire_date, job_id, salary, department_id
from employees
where upper(job_id) = upper('&job')

select trim('   Hello World   ')
from dual



select last_name, hire_date, job_id, salary, department_id
from employees
where upper(job_id) = trim(upper('&job'))

select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary, department_id
from employees


select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, 8, 2) as hire_year
from employees



select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, -2, 2) as hire_year
from employees


select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, -2) as hire_year
from employees

select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , 20 || substr(hire_date, -2) as hire_year
from employees


select last_name, instr(last_name, 'e')
from employees

select last_name, instr(last_name, 'e', 4)
from employees


select last_name, instr(last_name, 'e', 1, 3)
from employees


select last_name, length(last_name)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('A', 'J', 'M')


select city, substr(street_address, 1, instr(street_address, ' ')) as building_num, street_address
from locations
where country_id in ('US', 'JP', 'IT', 'CA')


select street_address, instr(street_address, ' ')
from locations






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

* from locations table display city and building num. which is the number at the begining 
of street address for all addresses in US and JP. (hint: use substr function)

* from locations table display city and building num. which is the number at the begining 
of street address for all addresses in US, JP, IT and CA. (hint: use substr and instr functions)
