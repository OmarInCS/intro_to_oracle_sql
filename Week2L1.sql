************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ...]
[OFFSET offset ROWS]
[FETCH NEXT row_count ROWS ONLY]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Comparison Operators:
    >, >=, <, <=, =, <>
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE '....'
    IS [NOT] NULL

Logical Operators:
    bool-expr AND bool-expr
    bool-expr OR bool-expr  
    NOT bool-expr


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round( , ), trunc( , ), sysdate
        months_between( , ), add_months( , )
        last_day( ), next_day( , )

    - Conversion:
        to_char(), to_date(), to_number()

        YY => 2000 - 2099
        RR => 1950 - 2049

    - General:

---------------------- Examples ------------------------


select sysdate
from dual

select *
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees


select last_name, hire_date, round(months_between(sysdate,hire_date)) as months_of_service
                            , round(months_between(sysdate,hire_date) / 12) as years_of_service
from employees

select last_name, hire_date, round(sysdate - hire_date) as days_of_service
from employees


select last_name, hire_date, add_months(hire_date, 3) as start_date
from employees


select last_name, hire_date, hire_date + 7 as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Friday')
from dual


select next_day(sysdate, 'Fri')
from dual


select next_day(sysdate + 14, 'Fri')
from dual


-------------------

select last_name, hire_date, salary
from employees

select last_name, hire_date, salary
from employees
where hire_date > '01-JAN-08'

--select last_name, hire_date, salary
--from employees
--where hire_date > '01/01/2008'

select last_name, hire_date, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year YYYY')
from employees


select last_name, to_char(hire_date, 'fmDD Month, YYYY')
from employees


select last_name, to_char(hire_date, 'ddth Month, YYYY')
from employees


select last_name, to_char(hire_date, 'fmDdspth "of" Month, YYYY')
from employees

select last_name, hire_date, to_char(salary, '$00,000.00')
from employees


select last_name, hire_date, to_char(salary, '000.00')
from employees


select last_name, hire_date, to_char(salary, '$99,999.99')
from employees


select last_name, hire_date, 'SAR' || to_char(salary, '99,999.99')
from employees


select last_name, hire_date, 'SAR' || to_char(salary, '99G999D99')
from employees

select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')


select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 2008', 'Mon, DD YYYY')



select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 98', 'Mon, DD RR')


select last_name, hire_date, salary
from employees
where salary >= to_number('$12,000.00', '$99,999.99')


select last_name, hire_date, salary
from employees
where hire_date > to_date('01, 01, 2008', 'MM, DD, YYYY')




-------------------- Questions ------------------------
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
which  is the first Monday after six months of service.


* Display each employee’s last name, hire date, and salary review date, 
which  is the first Monday after six months of service. 
Label the column REVIEW. Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”

* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)
