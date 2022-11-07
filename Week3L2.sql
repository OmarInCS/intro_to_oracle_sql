************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


SELECT columns|*
FROM table_name
[WHERE bool-expr [AND|OR bool-expr ....]]   -- filter rows
[GROUP BY column1, ....]
[HAVING bool-expr [AND|OR bool-expr ....]]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), length(),
        trim(), replace(), substr(), instr(),
        rpad(), lpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins

    - FROM table1 [INNER] JOIN table2 ON bool-expr [[INNER] JOIN table3 ON bool-expr ....]
    - FROM table1 [INNER] JOIN table2 USING (column1, ....) [[INNER] JOIN table3 USING (column1, ....) ....]
    
    - FROM table1 NATURAL JOIN table2

    - FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON bool-expr [[OUTER] LEFT|RIGHT|FULL JOIN table3 ON bool-expr ....]
    - FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 USING (column1, ....) [[OUTER] LEFT|RIGHT|FULL JOIN table3 USING (column1, ....) ....]
     

* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multiple-row Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

    commit
    rollback

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
                        where last_name = 'Abel')
     
     
select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)
 
select last_name, hire_date, job_id, salary, department_id
from employees
where salary < (select avg(salary)
                from employees)


--select last_name, min(salary)
--from employees


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

select last_name, hire_date, e.job_id, salary, department_id
from employees e join jobs j
on e.job_id = j.job_id
where job_title = 'Sales Representative'


select last_name, hire_date, job_id, salary, department_id
                , salary - (select round(avg(salary)) from employees) as avg_diff
from employees

---------------


--select last_name, hire_date, job_id, salary, department_id
--from employees
--where salary > (select salary
--                from employees
--                where last_name = 'Grant')

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

-----------------

select employee_id, job_id, hire_date
from employees
union
select employee_id, job_id, start_date
from job_history

select employee_id, job_id, hire_date, null
from employees
union
select employee_id, job_id, start_date, end_date
from job_history

select employee_id, job_id, hire_date, sysdate
from employees
union
select employee_id, job_id, start_date, end_date
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


select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK'

-------------

insert into departments
values (280, 'Developing', null, null)

insert into departments (department_id, department_name)
values (290, 'Quality')

desc departments

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values ((select max(employee_id) + 1 from employees), 'Abass', 'aaa', sysdate, 'IT_PROG', 7777)

savepoint A

update employees
set first_name = 'Fernas'
where employee_id = 207

update employees
set commission_pct = 0.4

rollback to A

update employees
set commission_pct = 0.4
where employee_id = 207

commit

delete from departments
where department_Id in (280, 290)

delete from employees
where employee_id = 207

commit



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

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.




