************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]
[ORDER BY column|number|expr|alias [ASC|DESC]]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), lpad(), rpad(), substr(), instr()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate,
        months_between(), add_months()
        last_day(), next_day()

    * Conversion:
        to_char(), to_date(), to_number()

    * General



---------------------- Examples ------------------------


select *
from dual

select round(19.354574), round(19.754574)
from dual

select round(19.354574, 2), round(19.754574, 3)
from dual

select trunc(19.354574), trunc(19.9999)
from dual

select trunc(19.354574, 2), trunc(19.754574, 3)
from dual

select last_name, salary, salary * 0.0132212, round(salary * 0.0132212)
from employees

select last_name, salary, salary * 0.0132212, trunc(salary * 0.0132212)
from employees

select last_name, salary, salary * 0.0132212, trunc(salary * 0.0132212, -1)
from employees

select last_name, salary, salary * 0.0132212, round(salary * 0.0132212, -1)
from employees

select mod(7, 3)
from dual

select mod(11, 3)
from dual


select last_name, employee_id, salary, round(salary + salary * 15.5 / 100) as "New Salary"
from employees


select last_name , hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name , hire_date, trunc(hire_date, 'Month') as start_date
from employees


select last_name , hire_date, round(hire_date, 'Year') as start_date
from employees

select sysdate
from dual

select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_period
from employees


select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as service_period
from employees

select last_name, hire_date, round(sysdate - hire_date) as service_period
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

select next_day(sysdate, 6)
from dual

select last_name, round(months_between(sysdate, hire_date)) as months_worked
from employees
order by months_worked desc


select last_name, hire_date, salary + '500'
from employees
where hire_date > '01-Jan-08'

select last_name, to_char(hire_date, 'Day Dy dd/Month Mon mm/Year yyyy')
from employees

select to_char(sysdate, 'fmMonth, dd yyyy, HH:MI:SS')
from dual


select to_char(sysdate, 'fmMonth, dd yyyy, HH24:MI:SS')
from dual

select last_name, to_char(hire_date, 'Ddsp "of" Month')
from employees


select last_name, to_char(hire_date, 'Ddspth "of" Month')
from employees

select last_name, to_char(salary, '$00,000.00')
from employees


select last_name, to_char(salary, '$99,999.99')
from employees

select last_name, to_char(salary, '$999.99')
from employees


select last_name, 'SAR' || to_char(salary, '999,999.99')
from employees

select last_name, 'SAR' || to_char(salary, '999G999D99')
from employees


select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')

select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 2008', 'Mon, DD YYYY')

-- YY => 2000 -> 2099
-- RR => 1950 -> 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 97', 'Mon, DD RR')

select last_name, hire_date, salary
from employees
where salary > to_number('$12,000.00', '$00,000.00')


select last_name, hire_date, salary
from employees
where salary > to_number('$9,000.00', '$99,999.00')




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

* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”


* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)
