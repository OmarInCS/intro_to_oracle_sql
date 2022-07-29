************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC]]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), lpad(), rpad(), substr(), instr()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate,
        months_between(), add_months()
        last_day(), next_day()

    * Conversion:
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    min(), max(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, column2, ...)
    * FROM table1 NATURAL JOIN table2
    
    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr

* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Muiltibale-row Subquery
    - Corellated Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus


---------------------- Examples ------------------------



select last_name, e.department_id, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id


select last_name, e.department_id, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id (+)


select last_name, e.department_id, d.department_id, department_name
from employees e, departments d
where e.department_id (+) = d.department_id

---------------------

select last_name, hire_date, job_id, salary, department_id
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)
and salary > (select salary
              from employees
              where employee_id = 141)

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Omar')

select last_name, hire_date, job_id, salary, department_id
from employees
where salary > (select avg(salary)
                from employees)

--select last_name, min(salary)
--from employees


select last_name, hire_date, job_id, salary, department_id
from employees
where salary = (select min(salary)
                from employees)


select last_name, hire_date, job_id, salary, salary - (select round(avg(salary)) from employees) as avg_diff
from employees


-- 'Sales Representative'
select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')

select last_name, hire_date, e.job_id, salary, department_id
from employees e join jobs j
on e.job_id = j.job_id and job_title = 'Sales Representative'


select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in (select job_id
                from employees
                where last_name = 'Grant')
                

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id =any (select job_id
                    from employees
                    where last_name = 'Grant')
                

select last_name, hire_date, job_id, salary, department_id
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where employee_id in (select manager_id
                      from employees)


select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in (select job_id
                from jobs
                where min_salary = 4000)


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)
and salary > (select salary
              from employees
              where employee_id = 141)

-- Common Table Expression
with 
    dept as (
        select department_id
        from employees
        where employee_id = 141
    ),
    sal as (
        select salary
        from employees
        where employee_id = 141
    )
select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = (select * from dept)
and salary > (select * from sal)




with 
    job_lst as (select job_id
                from jobs
                where min_salary = 4000)
select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in (select * from job_lst)


select last_name, hire_date, job_id, salary, department_id
from employees tm
where salary = (select min(salary)
                from employees ts
                where ts.department_id = tm.department_id)

select last_name, hire_date, job_id, salary, department_id
from employees tm
WHERE SALARY > (select avg(salary)
                from employees ts
                where tm.job_id = ts.job_id)
order by job_id


----------------------

select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history


select employee_id, hire_date, job_id
from employees
union all
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
order by  hire_date


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

* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* Create a report for HR that displays the department 
number, last name, and job ID for every employee in 
the Executive department.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.
