************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical operators:

    bool-expr AND|OR bool-expr 

* Using Single-Row Functions to Customize Output

    * characters:
        lower(), upper(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    * numbers:
        round(), trunc(), mod()

    * dates:
        round(), trunc(), sysdate,
        months_between( , ), add_months( , ),
        last_day(), next_day( , )

    * conversion:
        to_char(), to_date(), to_number()

    * general:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    max(), min(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, ...)
    
    * FROM table1 NATURAL JOIN table2

    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON|USING


* Using Subqueries to Solve Queries:

    * Single-row Subquery
    * Multipale-row Subquery

* Using the Set Operators:

    * union, union all
    * intersect
    * minus


* Managing Tables Using DML Statements:

    * insert:
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, ....)


    * update:
        UPDATE table_name
        SET column1 = value1, .....
        [WHERE bool-expr]

    * delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]


* Introduction to Data Definition Language (DDL):

    * create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cos_type],
            ..., ....,
            [[CONSTRAINT cons_name] cos_type]
        )

        Object Naming Rules:
            * max 30 char
            * contains A-Z a-z 0-9 _ $ #
            * starts with A-Z a-z
            * not a keyword

        Datatype:
            char(20), varchar(20), number(8, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Contraints types:
            * primary key
            * unique
            * not null
            * check (bool-expr)
            * foreign key


    * alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cos_type],...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL])
        | DROP (col_name, ...)
        | RENAME COLUMN col_name TO new_name

        | ADD [CONSTRAINT cons_name] cos_type
        | DROP CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name

    * drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

    * truncate:
        TRUNCATE TABLE table_name


*  Introduction to Data Dictionary Views

    * user_tables, all_tables
    * user_tab_columns, all_tab_columns
    * user_constraints, ....
    * user_cons_columns, ...

*  Creating Sequences, Synonyms, Views and Indexes

    Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE | NO CYCLE]

        DROP SEQUENCE seq_name

    Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR obj_name

    Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON obj_name(col_name)

        * index has separate naming space
        * indexes are dropped with the tables

    Views:
        CREATE [OR REPLACE] VIEW vi_name [(aliases)] AS
        select-statement
        [WITH READ ONLY]
        [WITH CHECK OPTION]

        View DML rules:
            delete:
                * no group by
                * no group function
                * no distinct
                * no sudo columns

            update:
                * all rules of delete
                * no expression

            insert:
                * all rules of update
                * include all not null columns

* Controlling User Access

    CREATE USER username
    IDENTIFIED BY password

    System Priviliges:
        GRANT priv1|role1, priv2, ....
        TO role1|user1, user2, ....

        REVOKE priv1|role1, priv2, ...
        FROM role1|user1, user2, ....

    CREATE ROLE role_name

    Object Priviliges: (select, insert, update(columns), delete, alter)
        
        GRANT priv1|role1|ALL, priv2, ....
        ON obj_name
        TO role1|user1|PUBLIC, user2, ....
        [WITH GRANT OPTION]

        REVOKE priv1|role1, priv2, ...
        ON obj_name
        FROM role1|user1, user2, ....
    


---------------------- Examples ------------------------


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

--------------

create sequence my_depts_seq
start with 50
increment by 10

insert into my_depts
values (my_depts_seq.nextval, 'Application')

select my_depts_seq.currval
from dual

alter table my_depts
modify (dept_num default my_depts_seq.nextval)

insert into my_depts (dept_name)
values ('Database')

drop sequence my_depts_seq

create synonym emps
for employees

select *
from emps

drop synonym emps

select *
from user_sequences

select *
from user_synonyms

select *
from user_indexes

drop index EMP_PHONE_IX

select *
from user_indexes

create index EMP_PHONE_IX
on employees(phone_number)

---------------------

create view high_sal_view as
select employee_id, last_name, email, hire_date, job_id, salary, department_id
from employees
where salary > 12000

select *
from high_sal_view

select last_name, salary
from high_sal_view

insert into high_sal_view
values (210, 'Fulan', 'fuf', sysdate, 'IT_PROG', 13000, 60)

select *
from high_sal_view


create or replace view high_sal_view as
select employee_id, last_name, email, hire_date, job_id, salary, department_id
from employees
where salary > 12000
with read only

insert into high_sal_view
values (211, 'Aelan', 'aea', sysdate, 'IT_PROG', 13000, 60)


create or replace view high_sal_view as
select employee_id, last_name, email, hire_date, job_id, salary, department_id
from employees
where salary > 12000
with check option

update high_sal_view
set salary = 10000
where last_name = 'Fulan'


drop table my_depts cascade constraints purge
drop table my_emps cascade constraints purge
drop index emp_phone_ix
drop view emps_hr_vi
drop view high_sal_view
drop view high_salary_vi
drop view it_emps_vi
drop view top_emps_vi

------------

create user omar
identified by omar

select *
from session_privs



---------- On SSYS_CONN

select *
from session_privs

create user omar
identified by omar

drop user omar cascade

grant create session, create table, create sequence
to omar

grant unlimited tablespace
to omar

revoke create session, create table, create sequence
from omar

--grant sysdba
--to omar

create role admin_team

grant create session, create table, create sequence
to admin_team

grant admin_team
to omar

revoke create table
from admin_team

grant select, update(first_name)
on hr.employees
to admin_team

revoke select, update
on hr.employees
from admin_team




-------------------- Questions ------------------------
* create a user with your name, grant create session and create table priviliges to it

* create connection and create any table

* grant select privilige on hr employees table to your user, and confirm it by a select statement

* drop your user