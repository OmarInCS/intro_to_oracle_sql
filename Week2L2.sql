************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

* Displaying Data from Multiple Tables Using Joins

	- FROM table1 [INNER] JOIN table2 ON bool-expr [INNER] JOIN table3 ON bool-expr ....
	- FROM table1 [INNER] JOIN table2 USING(column1, ...)
	- FROM table1 NATURAL JOIN table2
	
	- FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON|USING ...
	
	- FROM table1 CROSS JOIN table2

---------------------- Examples ------------------------


select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select d.department_id, department_name, last_name as mgr_name, city
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id


select d.department_id, department_name, last_name as mgr_name
from departments d join employees e
on d.manager_id = e.employee_id

select d.department_id, department_name, last_name as mgr_name, city
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id


select last_name, job_title, min_salary, salary, max_salary
from employees e join jobs j
on e.job_id = j.job_id
where max_salary - salary > 2000

select e.last_name, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id


select last_name, job_id, e.department_id, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where city = 'Toronto'


select e.employee_id, e.last_name, m.employee_id, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id



select last_name, department_name
from employees e join departments d
using(department_id)


select d.department_id, department_name, last_name as mgr_name, city
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
using(location_id)


select last_name, job_title, min_salary, salary, max_salary
from employees e join jobs j
using(job_id)
where max_salary - salary > 2000


select last_name, job_title, min_salary, salary, max_salary
from employees e natural join jobs j
where max_salary - salary > 2000

-- Logic Error
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



select department_name, city
from departments d  join locations l
on d.location_id = l.location_id


select department_name, city
from departments d cross join locations l
where d.location_id = l.location_id

select department_name, city
from departments d, locations l
where d.location_id = l.location_id



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.

* Create a report to display employees’ last names and employee numbers along with their managers’ last names and manager numbers. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
