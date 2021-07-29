************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC]]

* Retriving, Restricting and Sorting data

* Using Single-Row Functions to Customize Output

    - CHARACTERS:
        upper(), lower(), initcap(), trim(), replace(),
        substr(), instr(), lenght(), lpad(), rpad()

    - NUMBERS:
        round(), trunc(), mod()

    - DATES:
        round(), trunc(), sysdate
        months_between(), add_months()
        last_day(), next_day()

    - CONVERSION:
    - GENERAL:



---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary
from employees

select last_name, substr(hire_date, 4, 3) as hire_month
                , 20 || substr(hire_date, -2) as hire_year
from employees

select last_name, instr(last_name, 'e')
from employees

select last_name, instr(last_name, 'e', 3)
from employees


select last_name, instr(last_name, 'e', 1, 2)
from employees


select last_name, length(last_name)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees


select round(19.6254), round(19.254)
from dual


select round(19.6254, 3), round(19.254, 1)
from dual

select trunc(19.6254), trunc(19.9999)
from dual


select trunc(19.6254, 3), trunc(19.254, 1)
from dual

select last_name, salary, salary * .0133, trunc(salary * .0133, -1)
from employees


select last_name, salary, salary * .0133, round(salary * .0133, -1)
from employees

select mod(7, 3), mod(11, 3)
from dual

select upper(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'


select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M')


select sysdate
from dual

select last_name, hire_date, round(hire_date, 'Month') start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Month') start_date
from employees

select last_name, hire_date, round(hire_date, 'Year') start_date
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date))
from employees


select last_name, hire_date, round(months_between(sysdate, hire_date) / 12)
from employees

select last_name, hire_date, round(sysdate - hire_date)
from employees

select last_name, hire_date, hire_date + 3
from employees


select last_name, hire_date, add_months( hire_date, 3) as start_date
from employees


select last_name, hire_date, round(add_months( hire_date, 3), 'Month') as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual

select next_day(sysdate, 'Sun')
from dual


select next_day(sysdate, 1)
from dual


select last_name, round(months_between(sysdate, hire_date)) as months_worked
from employees
order by months_worked


-------------------- Questions ------------------------

* Write a query that displays the last name (with all letters in uppercase) and the length of the last name 
for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.


* The HR department needs a report to display the employee number, last name, salary, 
and salary increased by 15.5% (expressed as a whole number) for each employee. 
Label the column New Salary.

* The HR department wants to find the duration of employment for each employee. 
For each employee, display the last name and calculate the number of months between today 
and the date on which the employee was hired. Label the column as MONTHS_WORKED. 
Order your results by the number of months employed.
