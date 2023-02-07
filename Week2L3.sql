************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ...]]
[GROUP BY column|expr, ...]
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
        nvl(), nvl2(), coalesce()
        case, decode()


* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr [[INNER] JOIN table3 ON bool-expr ...]


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
where salary < 3000

select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select d.department_id, department_name, last_name, job_title
from departments d join employees e
on d.manager_id = e.employee_id
join jobs j
on e.job_id = j.job_id


select e.last_name, m.last_name, e.hire_date, m.hire_date
from employees e join employees m
on e.manager_id = m.employee_id






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
