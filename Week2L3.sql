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

		
* Reporting Aggregated Data Using the Group Functions

	min(), max(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins

	- FROM table1 [INNER] JOIN table2 ON bool-expr

---------------------- Examples ------------------------


select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, salary, job_title, min_salary
from employees e join jobs j
on e.job_id = j.job_id
where min_salary < 6000

select department_name, last_name as mgr_name
from departments d join employees e
on d.manager_id = e.employee_id

select last_name, department_name, street_address
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id

select department_name, d.location_id, street_address, city, country_id
from departments d join locations l
on d.location_id = l.location_id


select last_name, job_id, d.department_id, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID, department name for every employee in the Executive department.
