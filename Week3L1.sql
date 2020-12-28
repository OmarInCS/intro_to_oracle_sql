************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Displaying Data from Multiple Tables Using Joins
	
	FROM table1 [INNER] JOIN table2 ON bool-expr
	FROM table1 [INNER] JOIN table2 USING(column,...)
	FROM table1 NATURAL JOIN table2
	
	FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2
	
* Using the Set Operators
	
	* union, union all
	* intersect
	* minus
	

---------------------- Examples ------------------------


select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees e join departments d
using(department_id)

select last_name, job_title
from employees e join jobs j
on e.job_id = j.job_id

select last_name, job_title
from employees e join jobs j
using(job_id)


select last_name, job_title
from employees e natural join jobs j

select last_name, department_name
from employees e natural join departments d

select last_name, department_name
from employees e, departments d
where e.department_id = d.department_id


select last_name, department_name
from employees e CROSS JOIN departments d
where e.department_id = d.department_id


select last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id


select department_name, location_id, street_address, STATE_PROVINCE, country_id
from departments natural join locations

select last_name, job_id, department_id, department_name
from employees 
join departments using(department_id)
join locations using(location_id)
where city = 'Toronto'

------------- Set Operators ---------------

select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history


select employee_id, hire_date, null as end_date, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history


select employee_id, hire_date, 'Until Now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history
order by employee_id, hire_date desc


select employee_id, hire_date, job_id
from employees
union all
select employee_id, start_date, job_id
from job_history

select employee_id, hire_date, job_id
from employees
intersect
select employee_id, start_date, job_id
from job_history

select department_id
from departments
minus
select department_id
from employees

select distinct job_id, department_id
from employees
where department_id = 10
union all
select distinct job_id, department_id
from employees
where department_id = 50
union all
select distinct job_id, department_id
from employees
where department_id = 20




-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.


* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.


