************ Week 4, Lesson 1 ************** 
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

    - TRUNCATE TABLE table_name


* Introduction to Data Dictionary Views:
    
    - user_tables, all_tables
    - user_tab_columns, all_tab_columns
    - user_constraints, ...
    - user_cons_columns, ....

* Creating Sequences, Synonyms, Views and Indexes:

    - Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE | NOCYCLE]
        [CACHE number | NOCACHE]

    - Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR obj_name


---------------------- Examples ------------------------


desc my_depts

desc my_emps

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (104, 'Wael', 7000, 50)

delete from my_depts
where dept_id = 20

alter table my_emps
drop constraint MY_EMPS_MY_DEPTS_DEPT_FK


alter table my_emps
add constraint MY_EMPS_MY_DEPTS_DEPT_FK 
    foreign key(dept_id)
    references my_depts(dept_id)
    on delete set null  -- cascade

delete from my_depts
where dept_id = 20

rollback

-----------------------

select *
from user_tables

select *
from user_tab_columns


select *
from all_tables

select *
from user_constraints


select *
from user_cons_columns

--------------------

create sequence my_depts_seq
start with 30
increment by 10

insert into my_depts 
values (my_depts_seq.nextval, 'Developing')

select my_depts_seq.currval
from dual

alter table my_depts
modify (dept_id default my_depts_seq.nextval)


insert into my_depts (dept_name)
values ( 'Researching')


--------------------

create synonym emp
for employees

select *
from emp



truncate table my_emps
truncate table my_depts

drop table my_depts  cascade constraints purge
drop table my_emps  cascade constraints purge
drop sequence my_depts_seq
drop synonym emp


-------------------- Questions ------------------------
