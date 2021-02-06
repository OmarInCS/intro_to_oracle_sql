************ Week 2, Lesson 3 ************** 
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

	- FROM table1 [INNER] JOIN table2 ON bool-expr
	- FROM table1 [INNER] JOIN table2 USING (column1, ...)
	- FROM table1 NATURAL JOIN table2
	
	- FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON|USING
	- FROM table1 CROSS JOIN table2

---------------------- Examples ------------------------

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, salary, job_title, min_salary
from employees e join jobs j
on e.job_id = j.job_id

select e.last_name as emp_name, m.last_name as mgr_name
from employees e join employees m
on e.manager_id = m.employee_id
order by e.last_name

select last_name, department_name
from employees e join departments d
using(department_id)


select last_name, salary, job_title, min_salary
from employees e join jobs j
using(job_id)


select last_name, salary, job_title, min_salary
from employees e natural join jobs j

-- Logic Error
--select last_name, department_name
--from employees e natural join departments d

select last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id

select department_name, street_address, city
from departments d cross join locations l
where d.location_id = l.location_id


select department_name, street_address, city
from departments d, locations l
where d.location_id = l.location_id



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID, department name for every employee in the Executive department.

* Create a report to display employees’ last names and employee numbers along with their managers’ last names and manager numbers. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
