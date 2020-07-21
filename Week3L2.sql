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

* Using Subqueries to Solve Queries
	- Single-row Subquery
	- Multipale-row Subquery
	- Corelated Subquery
	

---------------------- Examples ------------------------



select *
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Accountant')
                
select department_id, round(avg(salary))
from employees
group by department_id
having round(avg(salary)) = (select max(round(avg(salary)))
                             from employees
                             group by department_id)
                             
select *
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')

select *
from employees
where salary > (select max(salary)
                    from employees
                    where last_name = 'Grant')
                    

select *
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')
                    
select *
from employees
where job_id =any (select job_id
                from jobs
                where min_salary = 4000)
                
   
select *
from employees
where job_id in (select job_id
                from jobs
                where min_salary = 4000)
                
select employee_id, last_name
from employees
where employee_id in (select manager_id
                        from employees)


select employee_id, last_name
from employees
where employee_id not in (select distinct manager_id
                            from employees
                            where manager_id is not null)
                        
select last_name, salary
from employees o
where salary > (select avg(salary)
                from employees
                where department_id = o.department_id)
                
select last_name, salary, job_id
from employees o
where salary = (select min(salary)
                from employees
                where job_id = o.job_id)




-------------------- Questions ------------------------


* Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.

* Create a report that displays the employee number, last name, and salary of all employees who earn more than the average salary. Sort the results in ascending order by salary.

* The HR department wants to determine the names of all employees who were hired after Davies. Create a query to display the name and hire date of any employee hired after employee Davies.


* The HR department needs a query that prompts the 
user for an employee’s last name. The query then 
displays the last name and hire date of any employee 
in the same department as the employee whose name 
the user supplies (excluding that employee).


* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.

* Create a report that displays a list of all 
employees whose salary is more than the salary of
any employee from department 60.

* Create a query to display the employees who earn a salary that is higher than the salary of all the sales managers (JOB_ID = 'SA_MAN'). Sort the results from the highest to the lowest.

