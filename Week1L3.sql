************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], .., ...]


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


* Using Single-Row Functions to Customize Output:

    * Characters:
        lower(), upper(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    * Conversion:

    * General:



---------------------- Examples ------------------------


select round(19.6732), round(19.5732), round(19.3732)
from dual


select round(19.6732, 2), round(19.5732, 1), round(19.3732, -1)
from dual

select trunc(19.9999, 2), trunc(19.5732), trunc(19.3732)
from dual

select last_name, salary, salary * 0.0133, round(salary * 0.0133)
from employees

select last_name, salary, salary * 0.0133, trunc(salary * 0.0133)
from employees

select last_name, salary, salary * 0.0133, trunc(salary * 0.0133, -1)
from employees

select last_name, salary, salary * 0.0133, round(salary * 0.0133, -1)
from employees

select mod(7, 3), mod(11, 3)
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select sysdate
from dual

select last_name, hire_date, round(sysdate - hire_date) as day_worked
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date)) as months_worked
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as years_worked
from employees

select last_name, hire_date, hire_date + 7 as start_date
from employees

select last_name, hire_date, round(add_months(hire_date, 3), 'Month') as start_date
from employees

select last_day(sysdate)
from dual


select next_day(sysdate, 'Sunday')
from dual


select next_day(sysdate, 'Sun')
from dual


select next_day(sysdate, 1)
from dual


select last_name, round(salary * 1.155) as new_salary
from employees


select last_name, trunc((sysdate - hire_date) / 7) as tenure
from employees
where department_id = 90
order by tenure

select last_name, hire_date, next_day(add_months(hire_date, 6), 'Monday') as review_date
from employees






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

* Display each employee’s last name, hire date, and salary review date, 
which is the first Monday after six months of service.

