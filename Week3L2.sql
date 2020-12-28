************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using Subqueries to Solve Queries

	- Single-row subquery
	- Multible-row subquery
	

	

---------------------- Examples ------------------------
select last_name, hire_date, job_id, department_id, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')
                
select last_name, hire_date, job_id, department_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Fox')
                        

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Fox')
and salary > (select salary
                from employees
                where last_name = 'Fox')
                
select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)

select last_name, hire_date, job_id, department_id, salary
from employees
where salary > (select avg(salary)
                from employees)
                

select last_name, hire_date, job_id, department_id, salary
from employees join jobs using(job_id)
where job_title = 'Sales Manager'

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Manager')
                
select last_name, salary
		, salary - (select round(avg(salary)) 
					from employees) salary_diff
from employees



select last_name ,salary
from employees
where salary = (select min(salary)
                from employees)

                
select last_name, hire_date
from employees
where hire_date > (select hire_date
                    from employees
                    where last_name = 'Davies')
                    

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id in (select department_id
                        from employees
                        where last_name = 'King')
                        

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id =any (select department_id
                        from employees
                        where last_name = 'King')
                        
                        

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id in (select job_id
                from jobs
                where max_salary > 10000)
                
select last_name, hire_date, job_id, department_id, salary
from employees
where salary >all (select salary
                from employees
                where last_name = 'Grant')


select last_name, hire_date, salary
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, salary
from employees
where salary > (select max(salary)
				from employees
				where last_name = 'Grant')


-------------------- Questions ------------------------
* Create a report that displays the employee number, last name, and salary of all employees who earn more than the average salary. Sort the results in ascending order by salary.

* Create a report for HR that displays the department 
number, last name, and job ID for every employee in 
the Executive department.

* The HR department wants to determine the names of all employees who were hired after Davies. Create a query to display the name and hire date of any employee hired after employee Davies.

-- 2000 kahoot points
* The HR department needs a query that prompts the 
user for an employee’s last name. The query then 
displays the last name and hire date of any employee 
in the same department as the employee whose name 
the user supplies (excluding that employee).

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.


