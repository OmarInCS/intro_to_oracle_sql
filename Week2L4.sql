************ Week 2, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM table_name [JOIN .....]
[WHERE bool-expr]	-- filter rows
[GROUP BY column, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|alias|number [ASC|DESC]]

* Displaying Data from Multiple Tables Using Joins:

	* table1 [INNER] JOIN table2 ON bool-expr
	* table1 [INNER] JOIN table2 USING (column1, ...)
	* table1 NATURAL JOIN table2
	
	* table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ....

---------------------- Examples ------------------------

select last_name, salary, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, job_title, salary, max_salary
from employees e join jobs j
on e.job_id = j.job_id
where max_salary - salary >= 1000

select last_name, department_name, d.department_id
from departments d join employees e
on d.manager_id = e.employee_id

select last_name, department_name, d.department_id, street_address
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id

select e.last_name, e.job_id, m.last_name, m.job_id
from employees e join employees m
on e.manager_id = m.employee_id
order by e.last_name


select e.last_name, e.employee_id, m.last_name, m.employee_id
from employees e join employees m
on m.employee_id = e.manager_id


select last_name, salary, department_name
from employees  join departments 
using (department_id)



select last_name, job_title, salary, max_salary
from employees e join jobs j
using (job_id)
where max_salary - salary >= 1000

-- Can't use USING
--select last_name, department_name, d.department_id
--from departments d join employees e
--on d.manager_id = e.employee_id



select last_name, job_title, salary, max_salary
from employees e natural join jobs j
-- on e.job_id = j.job_id
where max_salary - salary >= 1000



select last_name, salary, department_name
from employees e natural join departments d
--on e.department_id = d.department_id


select last_name, salary, department_name
from employees e left join departments d
on e.department_id = d.department_id


select last_name, salary, department_name
from employees e right join departments d
on e.department_id = d.department_id


select last_name, salary, department_name
from employees e full join departments d
on e.department_id = d.department_id



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.

* Create a report to display employees’ last names and employee numbers along with their managers’ last names and manager numbers. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.

