************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


SELECT columns|*
FROM table_name
[WHERE bool-expr [AND|OR bool-expr ....]]   -- filter rows
[GROUP BY column1, ....]
[HAVING bool-expr [AND|OR bool-expr ....]]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), length(),
        trim(), replace(), substr(), instr(),
        rpad(), lpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins

    - FROM table1 [INNER] JOIN table2 ON bool-expr [[INNER] JOIN table3 ON bool-expr ....]
    - FROM table1 [INNER] JOIN table2 USING (column1, ....) [[INNER] JOIN table3 USING (column1, ....) ....]
    
    - FROM table1 NATURAL JOIN table2

    - FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON bool-expr [[OUTER] LEFT|RIGHT|FULL JOIN table3 ON bool-expr ....]
    - FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 USING (column1, ....) [[OUTER] LEFT|RIGHT|FULL JOIN table3 USING (column1, ....) ....]
     

---------------------- Examples ------------------------


select last_name, department_name
from employees join departments 
on employees.department_id = departments.department_id
order by last_name

select last_name, department_name
from employees, departments     -- cross join
order by last_name

select last_name, department_name
from employees e join departments d 
on e.department_id = d.department_id
order by last_name

select last_name, job_title, salary, min_salary, e.job_id
from employees e join jobs j
on e.job_id = j.job_id
order by last_name


select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id


select last_name, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where last_name like 'A%'

select last_name, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id and last_name like 'A%'


select department_name, d.location_id, street_address, city, state_province, country_id
from departments d join locations l
on d.location_id = l.location_id


select e.last_name, m.last_name, e.hire_date, m.hire_date
from employees e join employees m
on e.manager_id = m.employee_id


select e.last_name as employee, e.employee_id as Emp#, m.last_name as manager, m.employee_id as Mgr#
from employees e join employees m
on e.manager_id = m.employee_id

-------------------------

select last_name, department_name
from employees e join departments d
using (department_id)


select last_name, job_title, salary, min_salary, job_id
from employees e join jobs j
using(job_id)
order by last_name


select last_name, job_title, salary, min_salary, job_id
from employees e natural join jobs j
order by last_name


--select last_name, department_name
--from employees e natural join departments d


select last_name, department_name
from employees e left join departments d
using (department_id)

select last_name, department_name
from employees e right join departments d
using (department_id)

select last_name, department_name
from employees e full join departments d
using (department_id)




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


