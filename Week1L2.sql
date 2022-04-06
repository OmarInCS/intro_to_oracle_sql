************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical Operator:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    * Numbers:
        round(), trunc(), mod()

    * Dates:

    * Conversion:

    * General:



---------------------- Examples ------------------------

select last_name, hire_date, job_id, salary
from employees
order by last_name
fetch next 10 rows only

select last_name, hire_date, job_id, salary
from employees
order by last_name
offset 10 rows
fetch next 10 rows only

select last_name, hire_date, job_id, salary
from employees
where job_id like '%&job%'


select last_name, hire_date, job_id, salary
from employees
where salary > &sal

define sal = 15000

select last_name, hire_date, job_id, salary
from employees
where salary > &&sal

undefine sal


select last_name, hire_date, job_id, salary &more_cols
from employees

select upper(last_name), lower(hire_date), initcap(job_id), salary
from employees


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = upper('&job')

select trim('   Hello World   ')
from dual

select replace('   Hello World   ', ' ', '-')
from dual


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))

select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, 8, 2) as hire_year
from employees


select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , 20 || substr(hire_date, -2) as hire_year
from employees

select last_name, instr(last_name, 'e')
from employees


select last_name, instr(last_name, 'e', 4)
from employees

select last_name, instr(last_name, 'e', 1, 2)
from employees

select last_name, length(last_name)
from employees

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select city, substr(street_address, 1, 4) as building_num
from locations
where country_id = 'US'


select round(19.6548484), round(19.6548484, 2), round(19.6548484, 3)
from dual


select trunc(19.6548484), trunc(19.6548484, 2), trunc(19.6548484, 3)
from dual

select last_name, salary, salary * 0.01332, round(salary * 0.01332)
from employees

select last_name, salary, salary * 0.01332, trunc(salary * 0.01332)
from employees

select last_name, salary, salary * 0.01332, trunc(salary * 0.01332, -1)
from employees

select mod(7, 3), mod(11, 3)
from dual

select employee_id, last_name, salary, round(salary + salary * 0.155 ) as new_salary
from employees



-------------------- Questions ------------------------

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.

* from locations table display city and building num. which is the number at the begining 
of street address for all addresses in US. (hint: use substr function)

* The HR department needs a report to display the employee number, last name, 
salary, and salary increased by 15.5% (expressed as a whole number) for each 
employee. Label the column New Salary.
