************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ....]]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

* Retriving, Restricting and Sorting data


Math Operators: +, -, *, /
Concat Operator: ||
Bool Expression:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        substr(), instr(), rpad(), lpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:

    - General:

---------------------- Examples ------------------------



select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, 4) as hire_month
                , substr(hire_date, 8, 2) as hire_year
                , substr(hire_date, 8) as hire_year
                , substr(hire_date, -2) as hire_year
                , 20 || substr(hire_date, -2) as hire_year
from employees

select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M')


select last_name, instr(last_name, 'e')
from employees

select last_name, instr(last_name, 'e', 4)
from employees

select last_name, instr(last_name, 'e', 1, 2)
from employees

select *
from hr.locations


select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees


select round(19.475348), round(19.75348), round(19.75348, 2), round(19.75348, 1)
from dual

select trunc(19.475348), trunc(19.75348), trunc(19.75348, 2), trunc(19.75348, 1)
from dual

select last_name, salary, salary * 0.01324, round(salary * 0.01324)
from employees


select last_name, salary, salary * 0.01324, round(salary * 0.01324, -1)
from employees

select last_name, salary, salary * 0.01324, trunc(salary * 0.01324, -1)
from employees

select mod(7, 3)
from dual

select mod(11, 3)
from dual

select sysdate
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_period
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as service_period
from employees


select last_name, hire_date, round(sysdate - hire_date) as service_period
from employees

select last_name, hire_date, hire_date + 3
from employees

select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual


select trunc(19.999), trunc(19.999999, 2)
from dual






-------------------- Questions ------------------------

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.

* from locations table display city and building num. which is the number at the begining 
of street address for all addresses in US and JP. (hint: use substr function)


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