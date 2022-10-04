************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column1, ...
FROM table
[WHERE bool-expr [AND|OR bool-expr]]    -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        length(), lpad(), rpad(), substr(), instr()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc()
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), avg(), sum(), count()

* Displaying Data from Multiple Tables Using Joins:

    - Inner Join:
        FROM table1 [INNER] JOIN table2 ON bool-expr JOIN table3 ON bool-expr ....
        FROM table1 [INNER] JOIN table2 USING (column1, ....) JOIN table3 USING (column1, ....) ....
        FROM table1 NATURAL JOIN table2

    - Outer Join:
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr LEFT|RIGHT|FULL [OUTER] JOIN table3 ON bool-expr ....
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 USING (column1, ....) LEFT|RIGHT|FULL [OUTER] JOIN table3 USING (column1, ....) ....
    
* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multible-row Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table [(column1, column2, ....)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table
        SET column1 = value1, column2 = value2, ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table
        [WHERE bool-expr]

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., .., 
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming rules:
            - not more than 30 char
            - may contain A-Z a-z 0-9 _ $ #
            - starts with A-Z a-z
            - not a keyword

        Data Types:
            char(20), varchar(20), number(5, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Constraints Types:
            - primary key
            - unique
            - not null
            - check(bool-expr)
            - foreign key


    - alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
        | MODIFY (col_name [datatype] [DEFAULT expr] [NOT NULL])
        | DROP (column1, ...)
        | SET UNUSED (column1, ...)
        | RENAME COLUMN col_name TO new_name

        | ADD [CONSTRAINT cons_name] cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name

    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

    - turncate:
        TRUNCATE TABLE table_name


* Creating Sequences, Synonyms, Views and Indexes:

    - Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE | NO CYCLE]

    - Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR table_name

    - Views:
        CREATE [OR REPLACE] VIEW view_name [(alias1, alias2, .....)] AS
        select-stat
        [WITH CHECK OPTION]
        [WITH READ ONLY]

        View DML Rules:
            delete:
                 - no group by
                 - no group function
                 - no distinct
                 - no sudo columns

            update:
                - all rules of delete
                - no expression

            insert:
                - all rules of update
                - all not null columns included


---------------------- Examples ------------------------


alter table my_depts
read only

insert into my_depts
values (40, 'Sales')

alter table my_depts
read write

insert into my_depts
values (40, 'Sales')

alter table my_depts
rename to new_depts

alter table new_depts
rename to my_depts


alter table my_depts
add (city varchar(30) default 'Riyadh')

desc my_depts

alter table my_depts
modify (dept_name varchar(50))

desc my_depts

alter table my_depts
set unused (city)

select *
from my_depts

alter table my_depts
drop unused columns

alter table my_depts
add (city varchar(30) default 'Riyadh')

select *
from my_depts

alter table my_depts
drop (city)

select *
from my_depts

alter table my_depts
rename column dept_name to dept_title

select *
from my_depts

update my_emps
set dept_id = 70
where emp_id = 103

delete from my_depts
where dept_id = 30

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

delete from my_depts
where dept_id = 30

rollback

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK
    foreign key (dept_id)
    references my_depts(dept_id)
    on delete set null
    

delete from my_depts
where dept_id = 30

update my_emps
set salary = 2500
where emp_id = 103

alter table my_emps
disable  constraint MY_EMPS_SALARY_CK

update my_emps
set salary = 2500
where emp_id = 103

alter table my_emps
enable  constraint MY_EMPS_SALARY_CK

--rollback
update my_emps
set salary = 7000
where emp_id = 103

alter table my_emps
enable  constraint MY_EMPS_SALARY_CK


create table emps_copy as
select *
from my_emps

truncate table emps_copy

drop table emps_copy cascade constraint purge

create sequence seq_my_depts
start with 50
increment by 10

insert into my_depts
values (seq_my_depts.nextval, 'mmmmm')

alter table my_depts
modify (dept_id default seq_my_depts.nextval)

insert into my_depts (dept_title)
values ('ssss')

select seq_my_depts.currval
from dual

drop sequence seq_my_depts

insert into my_depts 
values (100, 'llllll')

create synonym emps
for employees

select *
from emps

select *
from employees

drop synonym emps

--select *
--from emps

create or replace view low_sal_emps_vi (emp_id, emp_name, HIRE_DATE, EMAIL, JOB_ID, SALARY) as
select employee_id, last_name, hire_date, email, job_id, salary
from employees
where salary < 2500

select *
from low_sal_emps_vi

select emp_name, hire_date, salary
from low_sal_emps_vi

update low_sal_emps_vi
set salary = 2300
where emp_name = 'Olson'

desc employees

insert into low_sal_emps_vi (emp_id, emp_name, HIRE_DATE, EMAIL, JOB_ID, SALARY)
values (301, 'Khalid', sysdate, 'kkkk', 'SA_REP', 8888)


create or replace view low_sal_emps_vi (emp_id, emp_name, HIRE_DATE, EMAIL, JOB_ID, SALARY) as
select employee_id, last_name, hire_date, email, job_id, salary
from employees
where salary < 2500
with check option

insert into low_sal_emps_vi (emp_id, emp_name, HIRE_DATE, EMAIL, JOB_ID, SALARY)
values (302, 'Wael', sysdate, 'www', 'SA_REP', 2222)

create or replace view low_sal_emps_vi (emp_id, emp_name, HIRE_DATE, EMAIL, JOB_ID, SALARY) as
select employee_id, last_name, hire_date, email, job_id, salary
from employees
where salary < 2500
with read only

insert into low_sal_emps_vi (emp_id, emp_name, HIRE_DATE, EMAIL, JOB_ID, SALARY)
values (303, 'Samer', sysdate, 'sss', 'SA_REP', 2222)



-------------------- Questions ------------------------
* modify course_title to be varchar(70)
* modify price constraint to be 1000 and 4000
* add column trainer_name 

* create synonym "depts" for the departments table

* create sequence for the departments table starts with 300 and increment 10
add 3 departments to test the sequence

* create a view for employees with job IT_PROG
and insert an employee using this view
