************ Week 2, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]


* Displaying Data from Multiple Tables Using Joins

	FROM table1 JOIN table2 ON bool-expr

---------------------- Examples ------------------------

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, job_title, min_salary, salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, last_name as manager_name, street_address
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id

select e.last_name as emp_name, m.last_name as mgr_name
from employees e join employees m
on e.manager_id = m.employee_id





-------------------- Questions ------------------------
* Write a query to display the number of people with the same job. Generalize the query so that the user in the HR department is prompted for a job id.


* Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.

* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country id in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.
