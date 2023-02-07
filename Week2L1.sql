************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ...]]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool Expression:
    >, >=, <, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ....)
    LIKE '.....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months( , 3),
        last_day(), next_day( , )

    - Conversion:
        to_char(), to_date(), to_number()

    - General:



---------------------- Examples ------------------------


select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual


select next_day(sysdate, 'Thur')
from dual

select last_name, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/YYYY Year')
from employees

select last_name, to_char(hire_date, 'fmDay(Dy)DD/Month(Mon)MM/YYYY Year')
from employees

select last_name, to_char(hire_date, 'YYYY, DD Month')
from employees

select last_name, to_char(hire_date, 'YYYY, Ddsp Month')
from employees

select last_name, to_char(hire_date, 'YYYY, Ddspth Month')
from employees

select to_char(sysdate, 'Mon DD, HH:MI:SS')
from dual

select to_char(sysdate, 'Mon DD, HH24:MI:SS')
from dual

select last_name, to_char(salary, '$00,000.00')
from employees


select last_name, to_char(salary, '$99,999.99')
from employees

select last_name, to_char(salary, '$999.99')
from employees

select last_name, 'SAR' || to_char(salary, '99,999.99')
from employees


select last_name, to_char(hire_date, 'YYYY, Ddspth "of" Month')
from employees


select *
from employees
where hire_date > '01-JAN-07'

select *
from employees
where hire_date > to_date('Jan, 01 2007', 'Mon, DD YYYY')

select *
from employees
where hire_date < to_date('2003, January 01', 'YYYY, Month DD')

-- YY => 2000 - 2099
-- RR => 1950 - 2049
select *
from employees
where hire_date > to_date('Jan, 01 97', 'Mon, DD RR')

select *
from employees
where salary > to_number('12,000', '00,000')

select *
from employees
where salary < to_number('3,000', '99,999')


select *
from employees
where salary < to_number('03,000', '00,000')

select *
from employees
where salary < to_number('03,000', '00G000')




-------------------- Questions ------------------------
* Display each employee’s last name, hire date, and salary review date 
which is the first monday after three months from hiring.


* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”


* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)
