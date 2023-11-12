************ Session 9 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns [AS alias]
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ....]


* Retriving, Restricting and Sorting data

Math Expr: +, -, *, /
Concat Expr: ||
Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND .....
    IN (..., ..., ...)
    LIKE '.....'
    IS [NOT] NULL

Logical Expr:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr()

    - Numbers:
        round(), trunc()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(..., ..., ..., ...)
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr [JOIN table3 ON bool-expr ....]
    * FROM table1 [INNER] JOIN table2 USING(column1, ...) [JOIN table3 USING(column1, ....) ....]
    * FROM table1 NATURAL JOIN table2 [NATURAL JOIN table3 ....]

    * FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON bool-expr [[OUTER] LEFT|RIGHT|FULL table3 ON bool-expr ....]

* Using the Set Operators:

    * union, union all
    * intersect
    * minus

* Using Subqueries to Solve Queries:

    Strong Independent Subquery:
        - Single-row Subquery
        - Multible-row Subquery

    - Correlated Subquery



---------------------- Examples ------------------------

Group 1: 18 + 5 + 3 + 10 + 10 + 8
Group Moshi Mosh: 18 + 13 + 15 + 8 + 8 + 13


select *
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')


select *
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')


select *
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and salary > (select salary
              from employees
              where last_name = 'Abel')
              



select *
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and job_id = (select job_id
              from employees
              where last_name = 'Abel')


select *
from employees
where (department_id, job_id) = (select department_id, job_id
                                    from employees
                                    where last_name = 'Abel')

select *
from employees
where manager_id = (select manager_id
                    from employees
                    where employee_id = 141)
and employee_id <> 141


select *
from employees
where salary < (select avg(salary)
                from employees)


select last_name, salary
from employees
where salary = (select max(salary)
                from employees)


select last_name, salary, salary - (select round(avg(salary)) from employees) as avg_diff
from employees

-- Sales Representative
select *
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')


-----------

select *
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')
                

select *
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')


select *
from employees
where department_id =any (select department_id
                            from employees
                            where last_name = 'King')

select *
from employees
where department_id in (select department_id
                        from employees
                        where last_name = 'King')


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


select last_name, department_id, (select department_name
                                    from departments
                                    where department_id = e.department_id) as department
from employees e




-------------------- Questions ------------------------
* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department is Sales.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.
