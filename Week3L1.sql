************ Week 3, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical Operator:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate
        months_between(), add_months( , )
        last_day(), next_day( , )

    * Conversion:
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, ...)
    * FROM table1 NATURAL JOIN table2

    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr


* Using Subqueries to Solve Queries:

    * Single-row Subquery
    * Multiple-row Subquery


---------------------- Examples ------------------------

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
where job_id = (select job_id
                from employees
                where last_name = 'Fox')
                

select last_name, hire_date, job_id, salary, department_id
from employees
where salary < (select avg(salary)
                from employees)


select last_name, hire_date, job_id, salary, department_id
from employees
where salary = (select min(salary)
                from employees)

-- Sales Representative
select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')


select last_name, hire_date, salary, salary - (select round(avg(salary))
                                                from employees) as avg_diff
from employees


--select last_name, avg(salary)
--from employees

select last_name, hire_date
from employees 
where hire_date > (select hire_date
                    from employees
                    where last_name = 'Davies')

select last_name, employee_id, salary
from employees
where salary > (select avg(salary)
                from employees)
order by salary



select last_name, hire_date, job_id, salary, department_id
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id =any (select department_id
                            from employees
                            where last_name = 'King')

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id in (select department_id
                        from employees
                        where last_name = 'King')

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in (select job_id
                from jobs
                where min_salary = 4000)

select last_name, department_id, job_id
from employees
where department_id =any (select department_id
                            from departments
                            where location_id = 1700)
         

select last_name, hire_date
from employees
where hire_date > (select hire_date
                    from employees
                    where last_name = 'Davies')
                    

-- Sales Representative
select last_name, hire_date, job_id
from employees
where job_id = (select job_id   
                from jobs
                where job_title = 'Sales Representative') --- 20 --- 100

                
select last_name, hire_date, e.job_id
from employees e join jobs j
on e.job_id = j.job_id  --- 2000
where job_title = 'Sales Representative' --- 100


select last_name, hire_date, job_id, salary, department_id
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')
                
select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Fox')
                

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id =any (select job_id
                    from employees
                    where last_name = 'Grant')
                    

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in (select job_id
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')


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