************ Week 2, Lesson 4 ************** 
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
    * FROM table1 [INNER] JOIN table2 USING (column1, ...)
    * FROM table1 NATURAL JOIN table2

    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr

---------------------- Examples ------------------------



select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, job_title
from employees e join jobs j
on e.job_id = j.job_id

select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select e.first_name, m.first_name
from employees e join employees m
on e.manager_id = m.employee_id
order by e.first_name


select last_name, department_name
from employees e join departments d
using (department_id)

select last_name, job_title
from employees e join jobs j
using (job_id)

--select last_name, job_title
--from employees e natural join jobs j

select last_name, department_name
from employees e natural join departments d

select department_name, location_id, street_address, city, state_province, country_id
from departments natural join locations

select *
from employees

select last_name, job_id, department_id, department_name, city
from employees join departments using (department_id)
join locations using (location_id)
where city = 'Toronto'

select last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.


* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* Create a report for HR that displays the department 
number, last name, and job ID for every employee in 
the Executive department.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.