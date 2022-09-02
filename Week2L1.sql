************ Week 2, Lesson 1 ************** 
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
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:


---------------------- Examples ------------------------


select round(19.35753), round(19.75753)
from dual

select round(19.35753, 2), round(19.75753, 1)
from dual


select round(179.35753, -2), round(179.75753, -1)
from dual


select trunc(19.35753), trunc(19.9999)
from dual

select trunc(19.35753, 2), trunc(19.75753, 1)
from dual

select trunc(179.35753, -2), trunc(179.75753, -1)
from dual


select last_name, salary, salary * 0.01321, round(salary * 0.01321)
from employees

select last_name, salary, salary * 0.01321, round(salary * 0.01321, -1)
from employees

select last_name, salary, salary * 0.01321, trunc(salary * 0.01321, -1)
from employees

select mod(11, 3), mod(7, 3)
from dual

select sysdate
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees


select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date))
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12)
from employees

select last_name, hire_date, round(sysdate - hire_date)
from employees

select last_name, hire_date, hire_date + 7 as start_date
from employees


select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Friday')
from dual


select next_day(sysdate, 'Fri')
from dual


--select last_name, hire_date, salary
--from employees
--where hire_date > '01/01/2008'

select last_name, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year YYYY')
from employees

select last_name, to_char(hire_date, 'fmMonth, DD YYYY')
from employees


select last_name, to_char(hire_date, 'fmMonth, YYYY')
from employees


select last_name, to_char(hire_date, 'Ddspth "of" Month')
from employees

select to_char(sysdate, 'fmMonth, DD HH:MI:SS')
from dual


select to_char(sysdate, 'fmMonth, DD HH24:MI:SS')
from dual

select last_name, hire_date, to_char(salary, '$00,000.00') as salary
from employees

select last_name, hire_date, to_char(salary, '$99,999.99') as salary
from employees


select last_name, hire_date, 'SAR' || to_char(salary, '99,999.99') as salary
from employees

select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')

select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 08', 'Mon, DD YY')

-- YY => 2000 - 2099
-- RR => 1950 - 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 97', 'Mon, DD RR')

select last_name, hire_date, salary
from employees
where salary > to_number('12,000', '00,000')


select last_name, hire_date, salary
from employees
where salary > to_number('09,000', '00,000')


select last_name, hire_date, salary
from employees
where salary > to_number('7,000', '99G999')



select last_name, hire_date, to_char(salary, '$99G999D99') as salary
from employees


select last_name, hire_date, to_char(salary, '$9999') as salary
from employees


select first_name, hire_date
from employees
where hire_date between to_date('2006-06-01', 'YYYY-MM-DD') and to_date('2007-07-30', 'YYYY-MM-DD')




-------------------- Questions ------------------------

* The HR department needs a report to display the employee number, last name, 
salary, and salary increased by 15.5% (expressed as a whole number) for each 
employee. Label the column New Salary.

* The HR department wants to find the duration of employment for each employee. 
For each employee, display the last name and calculate the number of months 
between today and the date on which the employee was hired. 
Label the column as MONTHS_WORKED. Order your results by the number of months 
employed.

* Create a query to display the last name and the number of weeks employed 
for all employees in department 90. Label the number of weeks column as TENURE. 
Truncate the number of weeks value to 0 decimal places. Show the records in 
descending order of the employee’s tenure.

* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”


* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)
