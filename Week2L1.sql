************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical Operator:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate
        months_between(), add_months( , )
        last_day(), next_day( , )

    * Conversion:
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce()
        case, decode()



---------------------- Examples ------------------------


select last_name, hire_date, salary
from employees
where hire_date > '01-JAN-08'

select last_name, hire_date, salary
from employees
where hire_date > '01/01/2008'


select last_name, hire_date, salary
from employees
where salary > '12000'


select last_name, to_char(hire_date, 'Day(Dy)dd/Month(Mon)mm/Year yyyy')
from employees


select last_name, to_char(hire_date, 'fmDay(Dy)dd/Month(Mon)mm/Year yyyy')
from employees


select last_name, to_char(hire_date, 'Ddspth "of" Month')
from employees

select to_char(sysdate, 'Mon, dd yyyy, HH:MI:SS')
from dual


select to_char(sysdate, 'Mon, dd yyyy, HH24:MI:SS')
from dual

select *
from dual

select last_name, to_char(salary, '00,000.00')
from employees

select last_name, to_char(salary, '$99,999.99')
from employees


select last_name, 'SAR' || to_char(salary, '99,999.99')
from employees

select last_name, 'SAR' || to_char(salary, '99G999D99')
from employees

select last_name, 'SAR' || to_char(salary, '999')
from employees

select last_name, to_char(hire_date, 'Day, "the" Ddspth "of" Month, yyyy') as hire_date, salary
from employees

select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'dd/mm/yyyy')

select last_name, hire_date, salary
from employees
where hire_date < to_date('Mar, 01 2003', 'Mon, dd yyyy')

-- yy => 2000 - 2099
-- rr => 1950 - 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/97', 'dd/mm/rr')

select last_name, hire_date, salary
from employees
where hire_date < to_date('March, 01 2003', 'Month, dd yyyy')

select last_name, hire_date, salary
from employees
where salary > to_number('$12,000', '$00,000')

select last_name, hire_date, salary
from employees
where salary > to_number('&sal', '$00,000')

select last_name, hire_date, salary
from employees
where salary > to_number('&sal', '$99,999')

select first_name, to_char(hire_date, 'YYYY-MM-DD')
from employees
where hire_date between to_date('2006-06-01', 'YYYY-MM-DD') and to_date('2007-07-30', 'YYYY-MM-DD')

select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees

select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, nvl(to_char(manager_id), 'No Mgr.')
from employees

select last_name, salary, commission_pct, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees

select last_name, nvl(to_char(salary * commission_pct), 'No Commission') as comm
from employees


-------------------- Questions ------------------------

* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”

* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)

* Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” 
Label the column COMM.
