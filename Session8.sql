************ Session 8 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns [AS alias]
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ....]


* Retriving, Restricting and Sorting data

Math Expr: +, -, *, /
Concat Expr: ||
Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND .....
    IN (..., ..., ...)
    LIKE '.....'
    IS [NOT] NULL

Logical Expr:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr()

    - Numbers:
        round(), trunc()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(..., ..., ..., ...)
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr [JOIN table3 ON bool-expr ....]
    * FROM table1 [INNER] JOIN table2 USING(column1, ...) [JOIN table3 USING(column1, ....) ....]
    * FROM table1 NATURAL JOIN table2 [NATURAL JOIN table3 ....]

    * FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON bool-expr [[OUTER] LEFT|RIGHT|FULL table3 ON bool-expr ....]

* Using the Set Operators:

    * union, union all
    * intersect
    * minus



---------------------- Examples ------------------------

Group 1: 18 + 5 + 3 + 10 + 10
Group Moshi Mosh: 18 + 13 + 15 + 8 + 8


select last_name, department_name
from employees e join departments d
    using(department_id)

select department_name, last_name as mgr_name
from departments d join employees m
    on d.manager_id = m.employee_id
    

select last_name, job_title
from employees e join jobs j
    on e.job_id = j.job_id
    

select last_name, job_title
from employees e natural join jobs j

-- Logical Error
--select last_name, department_name
--from employees e natural join departments d


select last_name, department_name
from employees e left join departments d
    using(department_id)


select last_name, department_name
from employees e right join departments d
    using(department_id)

select last_name, department_name
from employees e full join departments d
    using(department_id)


select last_name, department_name
from employees e, departments d
where e.department_id = d.department_id (+)


select last_name, department_name
from employees e, departments d
where e.department_id (+) = d.department_id 

-----------------

select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history


select employee_id, hire_date, job_id
from employees
union all
select employee_id, start_date, job_id
from job_history

select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history
order by hire_date

select employee_id, hire_date, null, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history

select employee_id, hire_date, sysdate as end_date, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history

select employee_id, hire_date, 'untill now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history


select employee_id, hire_date, job_id
from employees
union all
select employee_id, start_date, job_id
from job_history

select employee_id, hire_date, job_id
from employees
intersect
select employee_id, start_date, job_id
from job_history


select department_id
from departments
minus
select department_id
from employees

select employee_id
from employees
minus
select manager_id
from employees




-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.
