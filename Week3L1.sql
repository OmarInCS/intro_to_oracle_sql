************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

* Using Subqueries to Solve Queries
	- Single-row Subquery
	- Multiple-row Subquery
	- Corelated Subquery
	
* Using the Set Operators

	- union, union all
	- intersect
	- minus


---------------------- Examples ------------------------


select last_name, department_id, job_id, salary
from employees
where salary > 12000

select first_name, department_id, job_id, salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Ismael')
                
select first_name, department_id, job_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where first_name = 'Ismael')
and first_name <> 'Ismael'


select first_name, department_id, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where employee_id = 121)
                

select first_name, department_id, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where employee_id = 148)
and salary > (select salary
                from employees
                where employee_id = 148)
                

select first_name, department_id, job_id, salary
from employees
where (department_id, manager_id) = (select department_id, manager_id
                                        from employees
                                        where employee_id = 128)
                                        
select first_name, department_id, job_id, salary
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Stock Manager')
                


select last_name, salary
from employees
where salary = (select min(salary)
                from employees)
                
select first_name, department_id, job_id, salary
from employees
where hire_date = (select max(hire_date)
                    from employees)
                    
select last_name, salary, salary - (select round(avg(salary))
                                    from employees) as salary_diff
from employees




select department_id, count(last_name)
from employees
group by department_id
having count(last_name) > (select avg(count(last_name))
                            from employees
                            group by department_id)
                            

select first_name, department_id, job_id, salary
from employees
where job_id in (select job_id
                from employees
                where last_name = 'Grant')
                

select first_name, department_id, job_id, salary
from employees
where job_id = any (select job_id
                    from employees
                    where last_name = 'Grant')
                    

select first_name, department_id, job_id, salary
from employees
where employee_id in (select distinct manager_id
                        from employees)
                        

select first_name, department_id, job_id, salary
from employees
where salary > all (select salary
                    from employees
                    where last_name = 'Grant')
                    

select last_name, department_id, salary
from employees e1
where salary = (select min(salary)
                from employees
                where department_id = e1.department_id)

select last_name, department_id, salary
from employees e1
where salary > (select avg(salary)
                from employees
                where job_id = e1.job_id)
                
-------------- Set Operators -------------

select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history


select employee_id, hire_date, 'present' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history
order by employee_id, hire_date

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
select distinct department_id
from employees

select employee_id
from employees
minus
select manager_id
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
* The HR department wants to determine the names of all employees who were hired after Davies. Create a query to display the name and hire date of any employee hired after employee Davies.


* Create a report that displays the employee number, last name, and salary of all employees who earn more than the average salary. Sort the results in ascending order by salary.

* Create a report for HR that displays the department 
number, last name, and job ID for every employee in 
the Executive department.


* The HR department needs a query that prompts the 
user for an employee’s last name. The query then 
displays the last name and hire date of any employee 
in the same department as the employee whose name 
the user supplies (excluding that employee).

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.


* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.


* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.
