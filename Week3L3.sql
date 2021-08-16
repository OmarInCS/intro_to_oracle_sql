************ Week 3, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name 
        (
            column_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., ..,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming:
            - at most 30 char
            - may contain a-z, A-Z, 0-9, _, $, #
            - starts with letter
            - not keyword

        DataType:
            char(20), varchar2(20), number(8, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Constraint types:
            - Primary Key
            - Unique
            - not null
            - check(bool-expr)
            - foreign key


    - alter:
        ALTER TABLE table_name
        READ ONLY
        || READ WRITE
        || RENAME TO new_name

        || ADD (column_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type])
        || MODIFY (column_name datatype [DEFAULT expr] [NOT NULL])
        || DROP (column_name, ...)
        || RENAME COLUMN old_name TO new_name

        || ADD [CONSTRAINT cons_name] cons_type
        || DROP CONSTRAINT cons_name
        || DISABLE CONSTRAINT cons_name
        || ENABLE CONSTRAINT cons_name
        || RENAME CONSTRAINT old_name TO new_name



    - drop

---------------------- Examples ------------------------


create table my_depts
(
    dept_id number(4) constraint my_depts_dept_id_pk primary key,
    dept_name varchar2(30) not null unique
)

insert into my_depts
values (30, 'Accounting')

create table my_emps
(
    emp_id number(4) constraint my_emps_emp_id_pk primary key,
    emp_name varchar2(30) not null,
    hire_date date default sysdate,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    dept_id number(4) constraint my_emps_my_depts_dept_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (102, 'Fernas', 5000, 20)


create table copy_depts as 
select *
from departments

alter table copy_depts
rename to old_depts

alter table my_emps
read only

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Mehtas', 5000, 20)


alter table my_emps
read write

alter table my_emps
add (job varchar2(30) )

desc my_emps

alter table my_emps
modify (job varchar2(20) )

alter table my_emps
drop (job)

alter table my_emps
rename column hire_date to start_date


alter table my_emps
drop constraint my_emps_salary_ck

alter table my_emps
add constraint my_emps_salary_ck check(salary > 4000)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Mehtas', 3500, 20)




-------------------- Questions ------------------------

create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120
