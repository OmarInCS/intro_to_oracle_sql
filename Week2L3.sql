************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


 * Displaying Data from Multiple Tables Using Joins

    * table1 [INNER] JOIN table2 ON bool-expr

---------------------- Examples ------------------------


select last_name, salary, department_name
from employees e join departments d  
on e.department_id = d.department_id

select department_name, city
from departments d join locations l
on d.location_id = l.location_id


select employee_id, last_name, job_title, min_salary, salary
from employees e join jobs j
on e.job_id = j.job_id


select department_name, last_name,street_address
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id


select department_name, d.location_id, street_address, city, state_province, country_id
from departments d join locations l
on d.location_id = l.location_id


select last_name, job_id, e.department_id, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where city = 'Toronto'


select e.first_name, e.last_name, m.first_name, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id


select e.employee_id, e.last_name, m.employee_id, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id




-------------------- Questions ------------------------

* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. 
Display the last name, job, department number, and the department name for 
all employees who work in Toronto.

* Create a report to display employees’ last names and employee numbers along 
with their managers’ last names and manager numbers. 
Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
