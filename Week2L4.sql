************ Week 2, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Using Subqueries to Solve Queries
    
    - Single-row Subquery
    - Multiple-row Subquery


---------------------- Examples ------------------------


select last_name, hire_date, department_id, job_id, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Fripp')

select last_name, hire_date, department_id, job_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Fripp')
and last_name <> 'Fripp' 


select last_name, hire_date, department_id, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)


select last_name, hire_date, department_id, job_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Fripp')
and job_id = (select job_id
                from employees
                where last_name = 'Fripp')
and last_name <> 'Fripp'


select last_name, hire_date, department_id, job_id, salary
from employees
where (department_id, job_id) = (select department_id, job_id
                                    from employees
                                    where last_name = 'Fripp')
and last_name <> 'Fripp'



select last_name, hire_date, department_id, job_id, salary
from employees
where salary > (select avg(salary)
                from employees)

select last_name, hire_date, department_id, job_id, salary
from employees
where salary = (select min(salary)
                from employees)

--select last_name, min(salary)
--from employees

select last_name, hire_date, department_id, job_id, salary, salary - (select round(avg(salary))
                                                                        from employees) as avg_diff
from employees


select last_name, hire_date, department_id, job_id, salary
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Manager')


select last_name, hire_date, department_id, job_id, salary
from employees
where department_id = (select department_id
                        from departments
                        where department_name = 'Executive')
                        
                        
select last_name, hire_date, e.department_id, job_id, salary
from employees e join departments d
on e.department_id = d.department_id
where d.department_name = 'Executive'


select last_name, hire_date, department_id, job_id, salary
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')


select last_name, hire_date, department_id, job_id, salary
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')


select last_name, hire_date, department_id, job_id, salary
from employees
where department_id =any (select department_id
                            from employees
                            where last_name = 'King')
and last_name <> 'King'


select last_name, hire_date, department_id, job_id, salary
from employees
where department_id in (select department_id
                            from employees
                            where last_name = 'King')
and last_name <> 'King'


select last_name, hire_date, department_id, job_id, salary
from employees
where salary > (select max(salary)
                    from employees
                    where last_name = 'Grant')


select last_name, hire_date, department_id, job_id, salary
from employees
where employee_id in (select manager_id
                        from employees)



-------------------- Questions ------------------------
* Create a report that displays the employee number, last name, and salary of all employees 
who earn more than the average salary. Sort the results in ascending order by salary.

* The HR department wants to determine the names of all employees who were hired after Davies. 
Create a query to display the name and hire date of any employee hired after employee Davies.

* Create a report for HR that displays the department number, last name, and job ID for every employee 
in the Executive department.