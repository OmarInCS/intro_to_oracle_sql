************ Week 4, Lesson 1 ************** 
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

* Using the Set Operators:

    - union, union all
    - intersect
    - minus


* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, ...)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ...
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

    commit, rollback

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..,...,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming:
            * not more than 30 char
            * may contain A-Z a-z 0-9 _ $ #
            * starts with A-Z a-z
            * not a keyword

        Datatypes:
            char(20), varchar(20), number(6, 2), date, timestamp,
            long, CLOB, BLOB, BFile
        
        Constraints Types:
            * primary key
            * unique
            * not null
            * check(bool-expr)
            * foreign key

    - alter:

    - drop:
        DROP TABLE table_name


---------------------- Examples ------------------------


select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history

select employee_id, hire_date, job_id
from employees
intersect
select employee_id, start_date, job_id
from job_history

select employee_id, hire_date, job_id, null
from employees
union
select employee_id, start_date, job_id, end_date
from job_history

select employee_id, hire_date, job_id, sysdate
from employees
union
select employee_id, start_date, job_id, end_date
from job_history

select employee_id, hire_date, job_id, 'until now' as end_date
from employees
union
select employee_id, start_date, job_id, to_char(end_date)
from job_history


select employee_id, hire_date, job_id, 'until now' as end_date
from employees
union
select employee_id, start_date, job_id, to_char(end_date)
from job_history
order by hire_date

select employee_id, hire_date, job_id
from employees
union all
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

-----------------

desc departments

insert into departments
values (280, 'Training', null, null)

insert into departments (DEPARTMENT_ID, DEPARTMENT_NAME)
values (290, 'Developing')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values ((select max(employee_id) + 1
            from employees), 'Wael', 'wwww', sysdate, '&job', 8888, 30)

commit


update employees
set salary = 10000

rollback

update employees
set salary = 10000
where employee_id = 208

savepoint A

update employees
set first_name = 'Fahad'
where employee_id = 208

rollback
rollback to A

commit

delete from departments
where department_id in (280, 290)

delete from employees
where last_name = 'Wael'

commit

--------------

create table my_depts
(
    dept_id number(4) constraint my_depts_dept_id_pk primary key,
    dept_name varchar(30) unique not null
)

insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(6) constraint my_emps_emp_id_pk primary key,
    emp_name varchar(50) constraint my_emps_emp_name_nn not null,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    hire_date date default sysdate,
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Hamza', 4222, 30)




-------------------- Questions ------------------------

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.

* create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120

