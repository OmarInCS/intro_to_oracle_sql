************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Displaying Data from Multiple Tables Using Joins

    - FROM table1 [INNER] JOIN table2 ON bool-expr 
    - FROM table1 [INNER] JOIN table2 USING (common_column, ...) 
    - FROM table1 NATURAL JOIN table2

---------------------- Examples ------------------------


select last_name, hire_date, job_id, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, hire_date, e.job_id, job_title, min_salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select department_name, last_name, job_title
from departments d join employees e
on d.manager_id = e.employee_id
join jobs j
on e.job_id = j.job_id


select department_name, last_name, job_title
from departments d join employees e
on d.manager_id = e.employee_id
join jobs j
on e.job_id = j.job_id
where min_salary > 6000


select e.first_name, m.first_name, e.hire_date, m.hire_date
from employees e join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date


-------------

select last_name, hire_date, job_id, department_name
from employees e join departments d
using (department_id)


select last_name, hire_date, job_id, job_title, min_salary
from employees e join jobs j
using (job_id)


select last_name, hire_date, job_id, job_title, min_salary
from employees e natural join jobs j


-- select last_name, hire_date, job_id, department_name
-- from employees e natural join departments d



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the departments. 
Use the LOCATIONS tables. Show the location ID, street address, city, state or province, 
and country id in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, 
and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID 
for every employee in the Executive department.
