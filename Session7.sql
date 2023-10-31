************ Session 7 ************** 
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


---------------------- Examples ------------------------

Group 1: 18 + 5 + 3 + 10 + 10
Group Moshi Mosh: 18 + 13 + 15 + 8 + 8


select max(salary), round(avg(commission_pct), 2)
from employees


--select last_name, max(salary)
--from employees

select last_name, department_name
from employees join departments
on employees.department_id = departments.department_id

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, salary, e.job_id, job_title, min_salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, last_name as manager_name
from departments d join employees e
on d.manager_id = e.employee_id

select department_name, last_name as manager_name, city
from departments d join employees e
    on d.manager_id = e.employee_id
join locations l
    on d.location_id = l.location_id

select department_name, last_name as manager_name, city
from departments d join employees e
    on d.manager_id = e.employee_id
join locations l
    on d.location_id = l.location_id
where salary > 10000

select department_name, last_name as manager_name, city
from departments d join employees e
    on d.manager_id = e.employee_id and salary > 10000
join locations l
    on d.location_id = l.location_id


select e.last_name as emp_name, m.last_name as mgr_name, e.hire_date as emp_hire_date
from employees e join employees m
    on e.manager_id = m.employee_id
order by emp_name


select department_name, last_name as manager_name, city
from departments d, employees e, locations l
where d.manager_id = e.employee_id
    and d.location_id = l.location_id
    and salary > 10000




-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* Create a report to display employees’ last names and employee numbers along with their
managers’ last names and manager numbers. Label the columns Employee, Emp#,
Manager, and Mgr#, respectively.
