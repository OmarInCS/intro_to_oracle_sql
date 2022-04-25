************ Week 4, Lesson 2 ************** 
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
        UPDATE table_name
        SET column1 = value1, column2 = value2
        [WHERE bool-expr]


    * delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

* Introduction to Data Definition Language (DDL):

    * create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., ....,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming Rules:
            * max 30 char
            * may contain A-Z a-z 0-9 _ $ #
            * starts with A-Z a-z
            * not a keyword

        Datatypes:
            char(25), varchar2(25), number(8, 2), date, timestamp
            long, CLOB, BLOB, BFile

        Constraints Types:
            * primary key
            * unique
            * not null
            * check(bool-expr)
            * foreign key

         

    * alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ..., ...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL])
        | DROP (col_name, ..., ..)
        | RENAME COLUMN col_name TO new_name

        | ADD [CONSTRAINT cons_name] cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name


    * drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

    * truncate:
        TRUNCATE TABLE table_name


* Introduction to Data Dictionary Views

    * user_tables, all_tables
    * user_tab_columns, all_tab_columns
    * user_constraints, .....
    * user_cons_columns, ...



*  Creating Sequences, Synonyms, Views and Indexes

    * Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE | NO CYCLE]

    * Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR table_name

    * Views:
        CREATE [OR REPLACE] VIEW view_name [(alias1, ..., ....)] AS
        select-stat.
        [WITH READ ONLY]
        [WITH CHECK OPTION]

        View DML Rules:

            delete:
                * no group by
                * no group function
                * no distinct
                * no sudocolumns

            update:
                * all rules of delete
                * no expression

            insert:
                * all rules of update
                * include all not null columns

    * Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table_name(column, ....)

        * indexes have different naming space
        * indexes will be deleted auto. with the table


* Controlling User Access:

    CREATE USER username
    IDENTIFIED BY password

    System Priviliges:
        GRANT priv1|role1, ..., ...
        TO role1|user1, ....

        REVOKE priv1, ..., ...
        FROM user1, user2, ....

    CREATE ROLE role_name

    Object Priviliges: (select, insert, update(columns), delete, alter)
        
        GRANT priv1|role1|ALL, ..., ...
        ON obj_name
        TO role1|user1|PUBLIC, ....
        [WITH GRANT OPTION]

        REVOKE priv1, ..., ...
        ON obj_name
        FROM user1, user2, ....


---------------------- Examples ------------------------



create user omar
identified by omar

select *
from session_privs

grant create session, create table, create sequence
to omar

grant unlimited tablespace
to omar

revoke create session, create table, create sequence
from omar

drop role dev_role
create role dev_role

grant create session, create table, create sequence
to dev_role

grant dev_role
to omar

revoke create table
from dev_role

grant select, update(first_name)
on hr.employees
to dev_role

revoke select, update
on hr.employees
from dev_role

create user mohamed
identified by mohamed

grant create session
to mohamed

grant select
on hr.employees
to mohamed
with grant option


-------------------- Questions ------------------------
