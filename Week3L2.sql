************ Week 3, Lesson 2 ************** 
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

* Using the Set Operators:

    * union, union all
    * intersect
    * minus

* Managing Tables Using DML Statements:

    * insert:
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, ...)

    * update:

    * delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]




---------------------- Examples ------------------------



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

select employee_id, hire_date, 'until now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history
order by hire_date

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

------------------

delete from departments
where department_id in (280, 290)

delete from employees
where employee_id in (208, 209, 210)

insert into departments
values (280, 'Training', null, null)

insert into departments (department_id, department_name)
values (290, 'Testing')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values ((select max(employee_id) + 1
         from employees), 'Omar', 'ooo', sysdate, 'SA_REP', &sal, 80)


-------------------- Questions ------------------------
* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.

* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.