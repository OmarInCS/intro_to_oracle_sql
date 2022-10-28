************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


SELECT columns|*
FROM table_name
[WHERE bool-expr [AND|OR bool-expr ....]]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), length(),
        trim(), replace(), substr(), instr(),
        rpad(), lpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:

    - General:



---------------------- Examples ------------------------



select last_name ,hire_date, job_id, salary
from employees
where job_id = upper('&job')   -- Substitution Variable

select *
from dual

select '    Hello World   '
from dual


select trim('    Hello World   ')
from dual


select replace('    Hello World   ', ' ', '-')
from dual


select last_name ,hire_date, job_id, salary
from employees
where job_id = trim(upper('&job'))   -- Substitution Variable


select last_name ,hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees

select last_name , hire_date
                 , substr(hire_date, 4, 3) as hire_month
                 , substr(hire_date, 4) as hire_month
                 , substr(hire_date, 8, 2) as hire_year
                 , substr(hire_date, 8) as hire_year
                 , substr(hire_date, -2) as hire_year
                 , 20 || substr(hire_date, -2) as hire_year
from employees


select last_name, instr(last_name, 'e')
from employees

select last_name, instr(last_name, 'e', 4)
from employees

select last_name, instr(last_name, 'e', 1, 3)
from employees

select upper(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'

select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M')


select city, substr(street_address, 1, 4) as building_number
from locations
where country_id  in ('JP', 'US')


select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees


select round(19.35468), round(19.75468), round(19.75468, 2), round(19.75468, 3)
from dual

select trunc(19.35468), trunc(19.75468), trunc(19.75468, 2), trunc(19.75468, 3), trunc(19.9999)
from dual

select last_name, salary, salary * 0.03143, round(salary * 0.03143)
from employees


select last_name, salary, salary * 0.03143, round(salary * 0.03143, -1)
from employees


select last_name, salary, salary * 0.03143, trunc(salary * 0.03143, -1)
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

select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, round(sysdate - hire_date) as service_days
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_months
from employees 


select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as service_years
from employees 

select last_name, hire_date, hire_date + 7 as start_date
from employees

select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees

select last_day(sysdate)
from dual

select last_name, hire_date, last_day(hire_date)
from employees

select next_day(sysdate, 'Friday')
from dual


select last_name, hire_date, round(months_between(sysdate, hire_date)) as MONTHS_WORKED
from employees
order by MONTHS_WORKED





-------------------- Questions ------------------------

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results descending by the employees’ last names.

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

