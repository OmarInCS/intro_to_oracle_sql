************ Week 4, Lesson 2 ************** 
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
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL], ...)
        | DROP (col_name, ...)
        | SET UNUSED (col_name, ...)
        | DROP UNUSED COLUMNS
        | RENAME COLUMN col_name TO new_name

        | ADD [CONSTRAINT cons_name] cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name

    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

    - truncate:
        TRUNCATE TABLE table_name


* Introduction to Data Dictionary Views:

    - user_tables, all_tables
    - user_tab_columns, all_tab_columns
    - user_constraints, ....
    - user_cons_columns, .....


* Creating Sequences, Synonyms, Views and Indexes:

    - Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE| NO CYCLE]

        DROP SEQUENCE seq_name

    - Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR table_name

        DROP SYNONYM syn_name

    - Views:
        CREATE [OR REPLACE] VIEW [(alias1, alias2, ....)] AS
        select-statment
        [WITH READ ONLY]
        [WITH CHECK OPTION]

        View DML Rules:
            delete:
                - no group by
                - no group function
                - no distinct|unique
                - no sudo columns

            update:
                - all rules of delete
                - no expressions

            insert:
                - all rules of update
                - all not null columns included

        DROP VIEW vi_name

    - Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table_name(col_name, ....)

        * indexes have a different naming space 
        * indexes will be deleted with the table

        DROP INDEX idx_name

---------------------- Examples ------------------------



alter table my_depts
read only

insert into my_depts
values (40, 'Marketing')

alter table my_depts
read write

insert into my_depts
values (40, 'Marketing')

alter table my_depts
rename to new_depts

rollback

alter table new_depts
rename to my_depts


alter table my_depts
add (city varchar(30) default 'Riyadh')

desc my_depts

alter table my_depts
modify (city varchar(50))

desc my_depts

alter table my_depts
rename column city to location

desc my_depts

alter table my_depts
drop (location)

desc my_depts


alter table my_depts
add (city varchar(30) default 'Riyadh')


alter table my_depts
set unused (city)

desc my_depts

select *
from my_depts

alter table my_depts
drop unused columns

delete from my_depts
where dept_id = 20

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

delete from my_depts
where dept_id = 20

rollback

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK
    foreign key (dept_id)
    references my_depts(dept_id)
    on delete set null

delete from my_depts
where dept_id = 20

update my_emps
set salary = 2500
where emp_id = 103

alter table my_emps
disable constraint MY_EMPS_SALARY_CK

update my_emps
set salary = 2500
where emp_id = 103

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

update my_emps
set salary = 4500
where emp_id = 103

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

insert into my_depts
values (20, 'IT')

alter table my_depts
rename constraint SYS_C0022563 to my_depts_dept_name_uq

insert into my_depts
values (20, 'IT')

create table it_emps_copy as
select employee_id, last_name, job_id, department_id, salary
from employees
where job_id = 'IT_PROG'

insert into my_emps (EMP_ID, EMP_NAME, SALARY, HIRE_DATE)
select employee_id, last_name, salary, hire_date
from employees
where department_id = 100

drop table it_emps_copy purge

truncate table my_emps

-----------------

select *
from user_tables

select *
from all_tables

select *
from user_tab_columns

select *
from user_constraints

select *
from user_cons_columns

----------------

create sequence my_depts_seq
start with 50
increment by 10

insert into my_depts 
values (my_depts_seq.nextval, 'Testing')

select my_depts_seq.currval
from dual

alter table my_depts
modify (dept_id default my_depts_seq.nextval)


insert into my_depts (dept_name)
values ('Sales')

drop sequence my_depts_seq


create synonym emps
for employees

select *
from emps

drop synonym emps

select *
from employees

create view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500

select *
from low_sal_emps

select last_name, salary
from low_sal_emps

update low_sal_emps
set salary = 2600
where last_name = 'Olson'

select *
from low_sal_emps

rollback

desc employees

insert into low_sal_emps
values (209, 'Ahmed', 'aaa', sysdate, 'ST_CLERK', 8888)

create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500
with read only

insert into low_sal_emps
values (210, 'Ahmed', 'ahah', sysdate, 'ST_CLERK', 8888)


create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500
with check option


insert into low_sal_emps
values (210, 'Ahmed', 'ahah', sysdate, 'ST_CLERK', 8888)

drop view low_sal_emps

select *
from employees
where last_name like 'K%'

select *
from user_indexes

create index salary_idx
on employees(salary)

select *
from user_indexes
order by table_name

drop index salary_idx


-------------------- Questions ------------------------
* modify course_title to be varchar(70)
* modify price constraint to be 1000 and 4000
* add column trainer_name 

* create a view for employees with job IT_PROG
and insert an employee using this view


