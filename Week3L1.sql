************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column1, ...
FROM table
[WHERE bool-expr [AND|OR bool-expr]]    -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        length(), lpad(), rpad(), substr(), instr()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc()
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), avg(), sum(), count()

* Displaying Data from Multiple Tables Using Joins:

    - Inner Join:
        FROM table1 [INNER] JOIN table2 ON bool-expr JOIN table3 ON bool-expr ....
        FROM table1 [INNER] JOIN table2 USING (column1, ....) JOIN table3 USING (column1, ....) ....
        FROM table1 NATURAL JOIN table2

    - Outer Join:
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr LEFT|RIGHT|FULL [OUTER] JOIN table3 ON bool-expr ....
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 USING (column1, ....) LEFT|RIGHT|FULL [OUTER] JOIN table3 USING (column1, ....) ....
    
* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multible-row Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

---------------------- Examples ------------------------



select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, job_title
from employees e join jobs j
on e.job_id = j.job_id
order by last_name

select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select last_name, department_name
from employees e join departments d
using (department_id)

select last_name, job_title
from employees e join jobs j
using (job_id)
order by last_name

select last_name, job_title
from employees e natural join jobs j
order by last_name

-- Logic Error
--select last_name, department_name
--from employees e natural join departments d

select last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id

-------------

select last_name, hire_date, job_id, department_id, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)
and job_id = (select job_id
                from employees
                where employee_id = 141)
                

select last_name, hire_date, job_id, department_id, salary, manager_id
from employees
where manager_id = (select manager_id
                    from employees
                    where last_name = 'Patel')

'Sales Representative'
select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')
                
select last_name, hire_date, job_id, department_id, salary
from employees
where salary < (select avg(salary)
                from employees)

select last_name, hire_date, job_id, department_id, salary, salary - (select round(avg(salary)) from employees) as avg_diff
from employees

select last_name, hire_date, job_id, department_id, salary, round(salary - (avg(salary) over())) as avg_diff
from employees


select last_name, hire_date, job_id, department_id, salary
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, department_id, salary
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, department_id, salary
from employees
where employee_id =any (select distinct manager_id
                        from employees)
                      

select last_name, hire_date, job_id, department_id, salary
from employees
where employee_id in (select distinct manager_id
                        from employees)


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id =any (select department_id
                            from employees
                            where last_name = 'King')


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id in (select department_id
                            from employees
                            where last_name = 'King')

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id =any (select job_id
                    from jobs
                    where min_salary = 4000)
                
                
select last_name, department_id, job_id
from employees
where department_id =any (select department_id
                            from departments
                            where location_id = 1700)

------------------

select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history


select employee_id, hire_date, null, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history

select employee_id, hire_date, sysdate, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history

select employee_id, hire_date, 'until now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history

select employee_id, hire_date, 'until now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history
order by hire_date



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

select employee_id
from employees
minus
select manager_id
from employees

select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK'





-------------------- Questions ------------------------

* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.
