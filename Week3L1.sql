************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM table_name [JOIN .....]
[WHERE bool-expr]	-- filter rows
[GROUP BY column, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|alias|number [ASC|DESC]]

* Using Subqueries to Solve Queries:
	- Single-row Subquery
	- Multibale-row Subquery (all, any, in)
	- Corelated Subquery


---------------------- Examples ------------------------


select *
from employees
where salary > (select salary
                from employees
                where last_name = 'Fripp')
                
select *
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Fripp')
                
select *
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)
                        
select *
from employees
where salary > (select avg(salary)
                from employees)
                
select last_name, salary
from employees
where salary = (select min(salary)
                from employees)
                
select last_name, salary
from employees
where salary > (select avg(salary)
                from employees
                where department_id = 80)

select *
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Accountant')
                
select last_name, salary, salary - (select round(avg(salary)) from employees)
from employees


select *
from employees
where job_id =any (select job_id
                    from employees
                    where last_name = 'Grant')


select *
from employees
where job_id in (select job_id
                from employees
                where last_name = 'Grant')
                
select *
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700)
                        
select last_name as manager_name
from employees
where employee_id in (select manager_id
                        from employees)
                        
                        
select last_name, job_id, salary
from employees
where salary >any (select salary
                from employees
                where job_id = 'IT_PROG')
                
       
select last_name, job_id, salary
from employees
where salary >all (select salary
                from employees
                where job_id = 'IT_PROG')
                
select last_name, salary, department_id
from employees o
where salary > (select avg(salary)
                from employees
                where department_id = o.department_id)
                
select last_name, salary
from employees o
where salary = (select min(salary)
                from employees
                where job_id = o.job_id)
           





-------------------- Questions ------------------------

* Create a report that displays the employee number, 
last name, and salary of all employees who earn more 
than the average salary. Sort the results in ascending 
order by salary.


* The HR department wants to determine the names of all employees who were hired after Davies. Create a query to display the name and hire date of any employee hired after employee Davies.

* Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.

* Create a report that displays a list of all 
employees whose salary is more than the salary of
any employee from department 60.
