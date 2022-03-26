************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical operators:

    bool-expr AND|OR bool-expr 

* Using Single-Row Functions to Customize Output

    * characters:
        lower(), upper(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    * numbers:
        round(), trunc(), mod()

    * dates:
        round(), trunc(), sysdate,
        months_between( , ), add_months( , ),
        last_day(), next_day( , )

    * conversion:
        to_char(), to_date(), to_number()

    * general:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    max(), min(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, ...)
    
    * FROM table1 NATURAL JOIN table2

    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON|USING


---------------------- Examples ------------------------


select first_name, last_name, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id

select department_name, first_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select first_name, last_name, e.job_id, job_title, min_salary
from employees e join jobs j
on e.job_id = j.job_id
where min_salary > 7000
order by min_salary desc

select first_name, last_name, e.job_id, job_title, min_salary
from employees e join jobs j
on e.job_id = j.job_id and min_salary > 7000
order by min_salary desc


select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e join employees m
on e.manager_id = m.employee_id


select first_name, last_name, department_name
from employees e join departments d
using(department_id)


select first_name, last_name, job_id, job_title, min_salary
from employees e join jobs j
using(job_id)
where min_salary > 7000
order by min_salary desc


select first_name, last_name, job_id, job_title, min_salary
from employees e natural join jobs j
where min_salary > 7000
order by min_salary desc


select first_name, last_name, department_name
from employees e natural join departments d


select first_name, last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id

select first_name, last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id

select first_name, last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id



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
