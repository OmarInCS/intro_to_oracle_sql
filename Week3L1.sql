************ Week 3, Lesson 1 ************** 
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

	FROM table1 [INNER] JOIN table2 ON bool-expr
	FROM table1 [INNER] JOIN table2 USING(column1,...)
	FROM table1 NATURAL JOIN table2
	
	FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 USING(column1,...)

* Using Subqueries to Solve Queries
	

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

select last_name, department_name
from employees e join departments d
using(department_id)

select department_name, city
from departments join locations
using(location_id)

select last_name, job_title, min_salary, salary
from employees natural join jobs
--on job_id = job_id

select last_name, department_name
from employees e natural join departments d
--on e.department_id = d.department_id and manager_id = manager_id

select last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id


------------------- Subqueries ---------------

select *
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')
                
select *
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Baida')
and last_name <> 'Baida'


select *
from employees
where salary > (select avg(salary)
                from employees)
                
--select last_name, min(salary)
--from employees

select last_name, salary
from employees
where salary = (select min(salary)
                from employees)
                
select last_name, salary, salary - (select avg(salary) from employees) as sal_avg_diff
from employees




-------------------- Questions ------------------------

* Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS tables. Show the location ID, street address, city, state or province, and country id in the output.

* The HR department needs a report of employees in Toronto. Display the last name, job, department number, and the department name for all employees who work in Toronto.

* Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.
