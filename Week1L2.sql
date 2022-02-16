************ Week 1, Lesson 2 ************** 
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

    * Dates:

    * Conversion:

    * General:



---------------------- Examples ------------------------



select last_name, hire_date, job_id, salary
from employees
order by last_name

select last_name, hire_date, job_id, salary
from employees
order by 1

select last_name, hire_date, job_id, salary
from employees
order by 4 desc


select last_name, hire_date, job_id, salary
from employees
order by salary desc, hire_date

select last_name, hire_date, job_id, salary * 12 as annual_salary
from employees
order by salary * 12 desc

select last_name, hire_date, job_id, salary * 12 as annual_salary
from employees
where salary * 12 > 130000
order by annual_salary desc


select last_name, hire_date, job_id, salary
from employees
order by last_name
offset 5 rows
fetch next 5 rows only


select last_name, hire_date, job_id, salary
from employees
order by last_name
offset &start rows
fetch next &num rows only


select last_name, hire_date, job_id, salary &more_columns
from employees
where salary > &&sal

undefine sal


define sal = 12000

select last_name, hire_date, job_id, salary &more_columns
from employees
where salary > &sal


select upper(last_name), lower(hire_date), initcap(job_id), salary
from employees


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = upper('&job')

select trim('   Hello World   ')
from dual

select replace('   Hello World   ', ' ', '-')
from dual

select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees


select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , 20 || substr(hire_date, -2) as hire_year
from employees


select last_name, instr(last_name, 'e')
from employees

select last_name, instr(last_name, 'e', 4)
from employees
where instr(last_name, 'e', 4) <> 0

select last_name, instr(last_name, 'e', 1, 2)
from employees

select last_name, length(last_name)
from employees


select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select upper(last_name) as name, length(last_name) as length
from employees
where last_name like 'A%' or last_name like 'J%' or last_name like 'M%'
order by last_name

select upper(last_name) as name, length(last_name) as length
from employees
where substr(last_name, 1, 1) in ('A', 'J', 'M')
order by last_name


--select upper(last_name) as name, length(last_name) as length
--from employees
--where last_name like '[AJM]%'
--order by last_name






-------------------- Questions ------------------------

* Create a report to display the last name, salary, and commission of all 
employees who earn commissions. Sort the data in descending order of salary 
and commissions. Use the column’s numeric position in the ORDER BY clause.


* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.
