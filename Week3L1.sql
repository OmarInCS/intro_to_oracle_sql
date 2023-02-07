************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ...]]
[GROUP BY column|expr, ...]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool Expression:
    >, >=, <, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ....)
    LIKE '.....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months( , 3),
        last_day(), next_day( , )

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()


* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr [[INNER] JOIN table3 ON bool-expr ...]
    * FROM table1 [INNER] JOIN table2 USING (column1, ...) [[INNER] JOIN table3 USING (column1, ...) ...]
    * FROM table1 NATURAL JOIN table2
    * FROM table1 CROSS JOIN table2
    * FROM table1, table2
    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr [ LEFT|RIGHT|FULL [OUTER] JOIN table3 ON bool-expr ...]

* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multible-row Subquery
    - Correlated Subquery



---------------------- Examples ------------------------


select *
from employees
where salary > 12000

select *
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')

select *
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Abel')

select *
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)

select *
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)
and job_id = (select job_id
                from employees
                where employee_id = 141)

select *
from employees
where salary < (select avg(salary)
                from employees)

--select last_name, min(salary)
--from employees

select *
from employees
where salary = (select min(salary)
                from employees)

-- Sales Representative
select *
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')

select last_name, salary, salary - (select round(avg(salary)) from employees) as avg_diff
from employees

------------------

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
where job_id =any (select job_id
                    from jobs
                    where max_salary = 9000)

select *
from employees
where job_id in (select job_id
                from jobs
                where max_salary = 9000)

select *
from employees e
where salary = (select min(salary)
                from employees
                where department_id = e.department_id)

select last_name, department_id, job_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700)
                        



-------------------- Questions ------------------------

* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.
