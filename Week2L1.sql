************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column1, ...
FROM table
[WHERE bool-expr [AND|OR bool-expr]]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        length(), lpad(), rpad(), substr(), instr()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc()
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General


---------------------- Examples ------------------------



select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, 8, 2) as hire_year
                , substr(hire_date, -2, 2) as hire_year
                , substr(hire_date, -2) as hire_year
                , 20 || substr(hire_date, -2) as hire_year
from employees


select last_name, instr(last_name, 'e')
from employees
where instr(last_name, 'e') <> 0

select last_name
                , instr(last_name, 'e')
                , instr(last_name, 'e', 5)
                , instr(last_name, 'e', 1, 2)
from employees


select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('A', 'J', 'M')
order by last_name

--------------------

select round(19.23735), round(19.23735, 2), round(19.23735, 3), round(19.23765, 3)
from dual

select trunc(19.23735), trunc(19.23735, 2), trunc(19.23735, 3), trunc(19.23765, 3), trunc(19.999)
from dual


select last_name, salary, salary * 0.0322343, round(salary * 0.0322343)
from employees

select last_name, salary, salary * 0.0322343, trunc(salary * 0.0322343)
from employees

select last_name, salary, salary * 0.0322343, trunc(salary * 0.0322343, -1)
from employees

select last_name, salary, salary * 0.0322343, round(salary * 0.0322343, -1)
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

select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees


select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_months
from employees

select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as service_years
from employees

select last_name, hire_date, round(sysdate - hire_date) as service_days
from employees

select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees

select last_name, hire_date, hire_date + 7 as start_date
from employees

select last_day(sysdate)
from dual


select last_day(sysdate)
from dual

select next_day(sysdate, 'Friday')
from dual

select next_day(sysdate, 'Fri')
from dual

select next_day(sysdate - 14, 'Fri')
from dual

------------------

select last_name, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year YYYY')
from employees


select last_name, to_char(hire_date, 'fmDay(Dy)DD/Month(Mon)MM/Year YYYY')
from employees

select last_name, to_char(hire_date, 'YYYY, Ddspth "of" Month')
from employees

select to_char(sysdate, 'Month dd, HH24:MI:SS')
from dual

select last_name, to_char(salary, '$00,000.00')
from employees

select last_name, to_char(salary, '$99,999.99')
from employees

select last_name, 'SAR' || to_char(salary, '99,999.99')
from employees


select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')

select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan 01, 2008', 'Mon DD, YYYY')



--select last_name, hire_date, salary
--from employees
--where hire_date > 'Jan 01, 2008'

select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan 01, 08', 'Mon DD, YY')

-- YY => 2000 - 2099
-- RR => 1950 - 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan 01, 97', 'Mon DD, RR')


select last_name, hire_date, salary
from employees
where salary > to_number('$12,000', '$99,999')




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

* Display each employee’s last name, hire date, and salary review date, 
which is the first Monday after six months of service.

* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”
