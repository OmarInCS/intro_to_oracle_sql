************ Week 4, Lesson 1 ************** 
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

create sequence locs_seq
start with 3300
increment by 100

desc locations

insert into locations (location_id, city)
values (locs_seq.nextval, 'Jeddah')

alter table locations
modify (location_id default locs_seq.nextval)

insert into locations (city)
values ('Dammam')

select locs_seq.currval
from dual


delete from locations
where location_id > 3200

alter table locations
modify (location_id default null)

drop sequence locs_seq

select *
from employees

create synonym emps
for employees

select *
from emps


select *
from employees

drop synonym emps

---------

create view basic_data_vi as
select employee_id, last_name, email, hire_date, job_id
from employees

select *
from basic_data_vi

select *
from basic_data_vi
where hire_date > '01-JAN-08'

desc employees

insert into basic_data_vi
values (210, 'Wael', 'waw', sysdate, 'AC_ACCOUNT')

create or replace view basic_data_vi as
select employee_id, last_name, email, hire_date, job_id
from employees
with read only

insert into basic_data_vi
values (211, 'Osama', 'waw', sysdate, 'AC_ACCOUNT')


create or replace view basic_data_vi as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary > 12000
with check option

update basic_data_vi
set salary = 10000
where employee_id = 207

select *
from employees
where last_name like 'K%'

select *
from user_indexes

create index phone_idx
on employees(phone_number)

drop index phone_idx

-------------------- Questions ------------------------
