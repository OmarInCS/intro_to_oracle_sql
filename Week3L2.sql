************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
#دقت_ساعة_الكود
------------------------------------------

SELECT [DISTINCT|UNIQUE] *|columns
FROM table_name
[WHERE bool-expr [OR|AND bool-expr]]    -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr [OR|AND bool-expr]]   -- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL
    EXISTS sub-query


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr( , , ), instr(), length(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins:

    - Inner Join:
        FROM table1 [INNER] JOIN table2 ON bool-expr [INNER] JOIN table3 ON bool-expr ....
        FROM table1 [INNER] JOIN table2 USING (column1, ..) [INNER] JOIN table3 USING (column1, ..) ....
        FROM table1 NATURAL JOIN table2

    - Outer Join:
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr [INNER] JOIN table3 ON bool-expr ....


* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multible-row Subquery
    - Correlated Subquery


---------------------- Examples ------------------------


select last_name, department_name
from employees, departments

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id


select last_name, e.job_id, job_title, salary, min_salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, last_name as mgr_name
from departments d join employees e
on d.manager_id = e.employee_id

select department_name, last_name as mgr_name, city
from departments d join employees e
on d.manager_id = e.employee_id
join locations l
on d.location_id = l.location_id

select e.last_name as emp_name, m.last_name as mgr_name, e.hire_date as emp_date
from employees e join employees m
on e.manager_id = m.employee_id

select last_name, department_name
from employees e join departments d
using (department_id)

select last_name, job_id, job_title, salary, min_salary
from employees e join jobs j
using (job_id)

select last_name, job_id, job_title, salary, min_salary
from employees e natural join jobs j

--select last_name, department_name
--from employees e natural join departments d


select last_name, department_name
from employees e left join departments d
using (department_id)

select last_name, department_name
from employees e right join departments d
using (department_id)

select last_name, department_name
from employees e full join departments d
using (department_id)


select last_name, department_name
from employees e, departments d
where e.department_id = d.department_id

select last_name, department_name
from employees e, departments d
where e.department_id = d.department_id (+)

select last_name, department_name
from employees e, departments d
where e.department_id (+) = d.department_id

--------------------

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
where salary > (select salary
                from employees
                where last_name = 'Fox')
and job_id = (select job_id
              from employees
              where last_name = 'Fox')
              

-- Sales Representative
select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')

select last_name, hire_date, job_id, department_id, salary
from employees
where salary = (select min(salary)
                from employees)

select last_name, hire_date, job_id, department_id, salary
from employees
where salary < (select avg(salary)
                from employees)

select last_name, salary, hire_date, salary - (select round(avg(salary)) from employees) as avg_diff
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
where job_id =any (select job_id
                  from employees
                  where last_name = 'Grant')


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id =all (select job_id
                  from employees
                  where last_name = 'Grant')

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id in (select job_id
                  from employees
                  where last_name = 'Grant')

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id in (select job_id
                from jobs
                where min_salary = 4000)


select last_name, hire_date, job_id, department_id, salary
from employees mq
where salary = (select min(salary)
                from employees sq
                where department_id = mq.department_id)



select last_name, hire_date, job_id, department_id, salary
from employees mq
where exists (select last_name
                from employees
                where manager_id = mq.employee_id)



-------------------- Questions ------------------------
* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.


* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* Create a report to display employees’ last names and employee numbers along with their
managers’ last names and manager numbers. Label the columns Employee, Emp#,
Manager, and Mgr#, respectively.

* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.
