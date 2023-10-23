************ Session 5 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns [AS alias]
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ....]


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

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr()

    - Numbers:
        round(), trunc()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(..., ..., ..., ...)



---------------------- Examples ------------------------

Group 1: 18 + 5 + 3
Group Moshi Mosh: 18 + 13 + 15


select first_name || ' ' || last_name as full_name
from employees


select last_name, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year YYYY')
from employees

select last_name, to_char(hire_date, 'Mon, DD YYYY') as hire_year
from employees

select to_char(sysdate, 'Mon, DD YYYY HH24:MI:SS')
from dual


select last_name, to_char(hire_date, 'Ddspth "of" Month YYYY') as hire_year
from employees


select last_name, to_char(hire_date, 'Day Mon, DD YYYY', 'NLS_CALENDAR=''arabic hijrah''') as hire_year
from employees

--
--select last_name, to_char(hire_date, 'Ddspth "of" Month YYYY', 'NLS_CALENDAR=''arabic hijrah''') as hire_year
--from employees


select last_name, to_char(salary, '$00,000.00')
from employees


select last_name, to_char(salary, '$99,999.00')
from employees

select last_name, hire_date
from employees
where hire_date > '01-Jan-18'

select last_name, to_char(hire_date, 'YYYY-MM-DD') as hire_date
from employees
where hire_date > to_date('2018-01-01', 'YYYY-MM-DD')

select last_name, salary
from employees
where salary > to_number('12,000', '99,999')


select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees

select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, nvl(to_char(department_id), 'No Dept.') as dept
from employees

select last_name, coalesce(to_char(department_id), 'No Dept.') as dept
from employees



select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees





-------------------- Questions ------------------------
* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”


* Write a query to get the first name and hire date from employees table 
where hire date between '2016-06-01' and '2017-07-30' (use the same format)

* Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” 
Label the column COMM.