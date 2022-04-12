************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...., ...]
[HAVING bool-expr]  -- filter groups
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
        round(), trunc(), sysdate
        months_between(), add_months( , )
        last_day(), next_day( , )

    * Conversion:
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins

    * FROM table1 [INNER] JOIN table2 ON bool-expr

---------------------- Examples ------------------------



select last_name, department_name
from employees join departments
on employees.department_id = departments.department_id

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, job_title, salary, min_salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, first_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select department_name, first_name, last_name, city
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id

select last_name, job_title, salary, min_salary
from employees e join jobs j
on e.job_id = j.job_id
where min_salary > 7000

select last_name, job_title, salary, min_salary
from employees e join jobs j
on e.job_id = j.job_id and min_salary > 7000

select last_name, job_title, salary, min_salary
from employees e, jobs j
where e.job_id = j.job_id


select last_name, job_title, salary, min_salary, e.job_id
from employees e join jobs j
on e.job_id = j.job_id

select department_name, d.location_id, street_address, city, state_province, country_id
from departments d join locations l
on d.location_id = l.location_id





-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.


* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.