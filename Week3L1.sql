************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Using Subqueries to Solve Queries:
    
    - Single-row Subquery
    - Multiple-row Subquery
    - Correlated Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

---------------------- Examples ------------------------


select last_name, hire_date, department_id, job_id
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Fripp')
                        

select last_name, hire_date, department_id, job_id
from employees
where department_id in (select department_id
                            from employees
                            where last_name = 'King')
                            

select last_name, hire_date, department_id, job_id, salary
from employees outter
where salary > (select avg(salary)
                from employees
                where department_id = outter.department_id)



select last_name, hire_date, department_id, job_id, salary
from employees outter
where hire_date = (select max(hire_date)
                    from employees
                    where job_id = outter.job_id)


select last_name, hire_date, department_id, job_id, salary
from employees outter
where (select count(last_name)
        from employees
        where manager_id = outter.employee_id) > 0
        

select last_name, hire_date, department_id, job_id, salary
from employees outter
where exists (select last_name
                from employees
                where manager_id = outter.employee_id)


--select last_name
--from employees
--where manager_id = 117


select last_name, hire_date, department_id, job_id, salary
from employees outter
where not exists (select last_name
                    from employees
                    where manager_id = outter.employee_id)



select last_name, hire_date, department_id, job_id, salary
from employees outter
where salary = (select min(salary)
                from employees
                where department_id = outter.department_id)
                

select employee_id, job_id, hire_date
from employees
union
select employee_id, job_id, start_date
from job_history


select employee_id, job_id, hire_date
from employees
union all
select employee_id, job_id, start_date
from job_history


select employee_id, job_id, hire_date, null
from employees
union
select employee_id, job_id, start_date, end_date
from job_history


select employee_id, job_id, hire_date, 'until now'
from employees
union
select employee_id, job_id, start_date, to_char(end_date)
from job_history



select employee_id, job_id, hire_date, 'until now'
from employees
union
select employee_id, job_id, start_date, to_char(end_date)
from job_history
order by hire_date



select employee_id, job_id, hire_date
from employees
union all
select employee_id, job_id, start_date
from job_history



select employee_id, job_id, hire_date
from employees
intersect
select employee_id, job_id, start_date
from job_history


select department_id
from departments
minus
select department_id
from employees


select employee_id
from employees
minus
select manager_id
from employees




-------------------- Questions ------------------------

* write a query to display the last names, department id and salary of the employees 
who earn the lowest in their department.

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.

* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.