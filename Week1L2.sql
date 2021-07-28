************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC]]

* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, >=, <, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL

Logical Operators:

    bool-expr AND bool-expr
    bool-expr OR bool-expr
    NOT bool-expr

* Using Single-Row Functions to Customize Output

    - CHARACTERS:
        upper(), lower(), initcap(), trim(), replace()

    - NUMBERS:
    - DATES:
    - CONVERSION:
    - GENERAL:



---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary
from employees
where hire_date like '%08' and salary > 6000 


select last_name, hire_date, job_id, salary
from employees
where job_id in ('ST_MAN', 'SA_MAN')


select last_name, hire_date, job_id, salary
from employees
where job_id = 'ST_MAN' or job_id = 'SA_MAN'

select last_name, hire_date, job_id, salary
from employees
where salary between 5000 and 10000


select last_name, hire_date, job_id, salary
from employees
where salary >= 5000 and salary <= 10000


select last_name, hire_date, job_id, salary
from employees
where salary >= &l_salary and salary <= &h_salary

define l_salary = 4000

select last_name, hire_date, job_id, salary
from employees
where salary >= &&l_salary and salary <= &&h_salary

undefine l_salary


select last_name, hire_date, job_id, salary
from employees
order by last_name


select last_name, hire_date, job_id, salary
from employees
order by 1


select last_name, hire_date, job_id, salary
from employees
order by 4 desc


select last_name, hire_date, job_id, salary * 12 as annual_salary
from employees
order by salary * 12 desc


select last_name, hire_date, job_id, salary * 12 as annual_salary
from employees
where salary * 12 > 150000
order by annual_salary desc


select last_name, hire_date, job_id, salary
from employees
order by job_id, hire_date

select last_name, hire_date, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000)


select last_name, hire_date, job_id, salary &more_columns
from employees


select last_name, hire_date, job_id, salary
from employees
where &cond

select last_name, hire_date, job_id, salary, department_id
from employees
where manager_id = &mgr
order by &col


select upper(last_name), lower(hire_date), initcap(job_id)
from employees

select last_name, hire_date, job_id, salary
from employees
where job_id = upper('&job')


select last_name, hire_date, job_id, salary
from employees
where job_id like upper('&job%')


select last_name, hire_date, job_id, salary
from employees
where job_id = trim(upper('&job'))


select trim('   Hello World  ')
from dual


select replace('   Hello World  ', ' ', '-')
from dual


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees



-------------------- Questions ------------------------
* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, 
and generates the employee ID, last name, salary, and department 
for that manager’s employees. 
The HR department wants the ability to sort the report on a selected column.


* Create a report to display the last name, salary, and commission of all 
employees who earn commissions. Sort the data in descending order of salary 
and commissions. Use the column’s numeric position in the ORDER BY clause.
