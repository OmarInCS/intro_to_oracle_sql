************ Week 2, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Reporting Aggregated Data Using the Group Functions
	
	sum(), avg(), max(), min(), count()
	
* Displaying Data from Multiple Tables Using Joins
	
	FROM table1 [INNER] JOIN table2 ON bool-expr

---------------------- Examples ------------------------


select department_id, count(last_name)
from employees
where department_id is not null
group by department_id
having count(last_name) > 4


select department_id, manager_id, count(last_name)
from employees
where department_id in (50, 80)
group by department_id, manager_id
order by department_id, manager_id


select max(count(last_name))
from employees
where department_id is not null
group by department_id

-------------- Joins --------------

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees natural join departments


select last_name, salary, job_title, max_salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, first_name, last_name
from departments d join employees m
on d.manager_id = m.employee_id


select department_name, first_name, last_name, street_address
from departments d join employees m
on d.manager_id = m.employee_id
join locations l
on d.location_id = l.location_id


select last_name, salary, job_title, max_salary
from employees e join jobs j
on e.job_id = j.job_id 
where max_salary > 10000

select e.first_name as emp, m.first_name as mgr
from employees e join employees m
on e.manager_id = m.employee_id




-------------------- Questions ------------------------

* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.



