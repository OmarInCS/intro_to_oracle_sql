************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical operators:

    bool-expr AND|OR bool-expr 

* Using Single-Row Functions to Customize Output

    * characters:
        lower(), upper(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    * numbers:
        round(), trunc(), mod()

    * dates:
        round(), trunc(), sysdate,
        months_between( , ), add_months( , ),
        last_day(), next_day( , )

    * conversion:

    * general:


---------------------- Examples ------------------------



select last_name, hire_date, job_id
from employees
order by last_name
fetch next 10 rows only

select last_name, hire_date, job_id
from employees
order by last_name
offset 10 rows
fetch next 10 rows only

select last_name, hire_date, substr(hire_date, 4, 3) as hire_month
                            , 20 || substr(hire_date, 8, 2) as hire_year
from employees


select last_name, hire_date, substr(hire_date, 4, 3) as hire_month
                            , 20 || substr(hire_date, 8) as hire_year
from employees


select last_name, hire_date, substr(hire_date, 4, 3) as hire_month
                            , 20 || substr(hire_date, -2) as hire_year
from employees


select last_name, instr(last_name, 'e')
from employees


select last_name
from employees
where last_name like '%e%'

select last_name, instr(last_name, 'e', 4)
from employees

select last_name, instr(last_name, 'e', 1, 2)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select city, street_address, substr(street_address, 1, instr(street_address, ' ') - 1) as building_num
from locations
where country_id in ('CA', 'US', 'IT')

select round(19.63485), round(19.63485, 2), round(19.63485, 3)
from dual

select trunc(19.999), trunc(19.63485, 2), trunc(19.63485, 3)
from dual

select last_name, hire_date, salary, 0.01333 * salary, round(0.01333 * salary)
from employees


select last_name, hire_date, salary, 0.01333 * salary, trunc(0.01333 * salary)
from employees

select last_name, hire_date, salary, 0.01333 * salary, trunc(0.01333 * salary, -1)
from employees


select mod(7, 3), mod(11, 3), mod(10, 2)
from dual

select sysdate
from dual

select *
from dual


select sysdate
from employees

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_period
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12 ) as service_period
from employees

select last_name, hire_date, round(sysdate - hire_date) as service_period
from employees


select last_name, hire_date, hire_date + 6
from employees



select last_name, hire_date, add_months(hire_date, 6)
from employees

select last_name, hire_date, round(add_months(hire_date, 6), 'Month')
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Fri')
from dual

select next_day(sysdate, 6)
from dual


select last_name, round(months_between(sysdate, hire_date)) as months_worked
from employees
order by months_worked




-------------------- Questions ------------------------
* display city and building num. which is the number at the begining of street address
for all addresses in US

* display city and building num. which is the number at the begining of street address
for all addresses in US, CA and IT

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

