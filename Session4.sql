************ Session 4 ************** 
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

    - General:



---------------------- Examples ------------------------



select city, substr(street_address, 1, instr(street_address, ' ') - 1) as building_number
from locations
where country_id in ('IT', 'JP', 'US', 'CA')


select round(19.4517), round(19.7517)
from dual

select round(19.4517, 2), round(19.7517, 3)
from dual


select trunc(19.4517), trunc(19.7517)
from dual

select last_name, hire_date, salary
    , salary * 0.01334 as raise
    , round(salary * 0.01334) as raise
    , round(salary * 0.01334, -1) as raise
    , trunc(salary * 0.01334, -1) as raise
from employees

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select sysdate
from dual

--select sysdate
--from employees

select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_months
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as service_years
from employees

select last_name, hire_date, round(sysdate - hire_date) as service_days
from employees

select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees


select last_name, hire_date, (hire_date + 7) as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual


select next_day(sysdate, 'Sun')
from dual


select next_day(sysdate, 1)
from dual



Group 1: 18 + 5
Group 2: 18 + 13






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