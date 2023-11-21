************ Session 13 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns [AS alias]
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ....]


* Retriving, Restricting and Sorting data

Math Expr: +, -, *, /
Concat Expr: ||
Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND .....
    IN (..., ..., ...)
    LIKE '.....'
    IS [NOT] NULL

Logical Expr:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr()

    - Numbers:
        round(), trunc()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(..., ..., ..., ...)
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr [JOIN table3 ON bool-expr ....]
    * FROM table1 [INNER] JOIN table2 USING(column1, ...) [JOIN table3 USING(column1, ....) ....]
    * FROM table1 NATURAL JOIN table2 [NATURAL JOIN table3 ....]

    * FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON bool-expr [[OUTER] LEFT|RIGHT|FULL table3 ON bool-expr ....]

* Using the Set Operators:

    * union, union all
    * intersect
    * minus

* Using Subqueries to Solve Queries:

    Strong Independent Subquery:
        - Single-row Subquery
        - Multible-row Subquery

    - Correlated Subquery


* Managing Tables Using DML Statements: (commit, rollback)

    - insert:
        INSERT INTO table_name [(col1, col2, ....)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name
        SET column1 = value1, ..., ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name 
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., ..., ...,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Name:
            - max 30 char
            - contains only A-Z a-z 0-9 # $ _
            - starts with A-Z a-z
            - not a keyword

        Datatypes:
            char(20), varchar(20), nvarchar(20), number(10, 2), date, timestamp
            long, CLOB, BLOB, BFile

        Constraint Types:
            - Primary Key
            - Unique
            - Not null
            - Check(bool-expr)
            - Foreign Key

    - alter:
        ALTER TABLE 
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL], ...)
        | DROP (col_name, ...)
        | RENAME COLUMN col_name to new_name

        | ADD [CONSTRAINT cons_name] cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name



    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

    - truncate:
        TRUNCATE TABLE table_name


* Introduction to Data Dictionary Views

    - user_tables, all_tables
    - user_tab_columns, all_tab_columns
    - user_constraints

* Sequence, Synonym, Views, Index

    * Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]

        DROP SEQUENCE seq_name

    * Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR obj_table

    * Views:
        CREATE [OR REPLACE] VIEW view_name [(alias1, alias2, ...)]
        AS query

    * Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table_name(col_name, ....) 

        - indexes have separate naming space
        - indexes to be deleted automatic with table

Last Name
Ahmed => 15
..
Bell => 30
..
..
..
Karem => 3
King => 17
Kat => 22
...


Ziad


* User Control

    CREATE USER username
    IDENTIFIED BY password

    System Priviliges:
        GRANT priv1, priv2, ....
        TO user1, user2, ...

        REVOKE priv1, priv2, ...
        FROM user1, user2, ...

    Object Priviliges:  (select, insert, update, delete, alter)
        GRANT priv1, priv2, ....
        ON obj_name
        TO user1, user2, ...

        REVOKE priv1, priv2, ...
        ON obj_name
        FROM user1, user2, ...



---------------------- Examples ------------------------

Group 1: 65
Group Moshi Mosh: 118


select *
from employees

create synonym emps for employees

select *
from emps

drop synonym emps

select *
from emps


create view vw_emps_2015 as
select last_name, hire_date, job_id, salary
from employees
where to_char(hire_date, 'YYYY') = 2015


select *
from vw_emps_2015



create or replace view vw_emps_2015 (emp_name, start_date, job_id, salary) as
select last_name, hire_date, job_id, salary
from employees
where to_char(hire_date, 'YYYY') = 2015


drop view vw_emps_2015


select *
from employees
where last_name like 'K%'

create index last_name_idx on employees(last_name)

drop index last_name_idx


select *
from user_tables
where num_rows <> 0

select *
from all_tables
where num_rows <> 0

select *
from user_tab_columns


select *
from user_tables
where table_name like '%APPT%'

select *
from user_constraints


create user developer
identified by developer


select *
from session_privs



-------------------- Questions ------------------------
