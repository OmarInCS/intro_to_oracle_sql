************ Week 3, Lesson 2 ************** 
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

select employee_id, hire_date, 'until now', job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history

select employee_id, hire_date, 'until now', job_id
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

----------------------

insert into departments
values (300, 'Applications', null, null)

insert into departments (department_id, department_name)
values (310, 'Quality')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values ((select max(employee_id) + 1
        from employees), 'Abass', 'aaa', sysdate, '&job', 7777)

create table departments as
select *
from hr.departments

update employees
set first_name = 'Fernas'
where employee_id = 207

update employees
set salary = (select max(salary)
                from employees)
where employee_id = 207

delete from employees
where employee_id = 207

delete from departments
where department_id > 270



-------------------- Questions ------------------------

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.

