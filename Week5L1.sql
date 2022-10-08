************ Week 5, Lesson 1 ************** 
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


* Introduction to Data Dictionary Views:

    * user_tables, all_tables
    * user_tab_columns, all_tab_columns
    * user_constraints, ....
    * user_cons_columns, ....


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


    Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table_name(column, ...)

        - indexes have separate name space
        - indexes will be deleted with tables

Last_name:
Ahmed => 13
A
B
C
.
.
King => 1
Khocher => 2
Kaaa => 23
.
.
Z

* Controlling User Access:

    CREATE USER username
    IDENTIFIED BY password

    System Priviliges:
        GRANT priv1|role1, priv2, ....
        TO role1|user1, user2, ....

        REVOKE priv1|role1, priv2, ....
        FROM role1|user1, user2, ....

    CREATE ROLE role_name

    Object Priviliges: (select, insert, update(column), delete, alter)

        GRANT priv1|role1|ALL, priv2, ....
        ON table
        TO role1|user1|PUBLIC, user2, ....
        [WITH GRANT OPTION]

        REVOKE priv1|role1, priv2, ....
        ON table
        FROM role1|user1, user2, ....


    

---------------------- Examples ------------------------


select *
from user_tables

select *
from user_tab_columns

select *
from all_tables

select *
from user_sequences

select *
from user_constraints

select *
from employees
where last_name like 'K%'

select *
from user_indexes

create index emp_sal_idx
on employees(salary)

select *
from employees
where salary > 10000

select *
from user_indexes

drop index emp_sal_idx

drop index EMP_PHONE_IX

----------------

create user omar
identified by omar

select *
from session_privs

----------- On SYS_CONN -------------

select *
from session_privs

drop user omar cascade

create user omar
identified by omar

grant create session, create table, create sequence
to omar

grant unlimited tablespace
to omar

revoke create session, create table, create sequence
from omar

create role test_team

grant create session, create table, create sequence
to test_team

grant test_team
to omar

revoke create table
from test_team

grant select, update(first_name)
on hr.employees
to test_team

revoke select, update
on hr.employees
from test_team


-------------------- Questions ------------------------
