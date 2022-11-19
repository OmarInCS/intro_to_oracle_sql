************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


SELECT columns|*
FROM table_name
[WHERE bool-expr [AND|OR bool-expr ....]]   -- filter rows
[GROUP BY column1, ....]
[HAVING bool-expr [AND|OR bool-expr ....]]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), length(),
        trim(), replace(), substr(), instr(),
        rpad(), lpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins

    - FROM table1 [INNER] JOIN table2 ON bool-expr [[INNER] JOIN table3 ON bool-expr ....]
    - FROM table1 [INNER] JOIN table2 USING (column1, ....) [[INNER] JOIN table3 USING (column1, ....) ....]
    
    - FROM table1 NATURAL JOIN table2

    - FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 ON bool-expr [[OUTER] LEFT|RIGHT|FULL JOIN table3 ON bool-expr ....]
    - FROM table1 [OUTER] LEFT|RIGHT|FULL JOIN table2 USING (column1, ....) [[OUTER] LEFT|RIGHT|FULL JOIN table3 USING (column1, ....) ....]
     

* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multiple-row Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

    commit
    rollback

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., ..., ...,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming Rules:
            - not more than 30 char
            - may contains A-Z a-z 0-9 _ $ #
            - starts with A-Z a-z
            - not a keyword

        Datatypes:
            char(20), varchar(20), number(4, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Constraints Types:
            - primary key
            - unique
            - not null
            - check(bool-expr)
            - foreign key   --- cascade, set null


    - alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL])
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
    - user_cons_columns, ...

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
        FOR obj_name

    - Views:
        CREATE [OR REPLACE] VIEW view_name [(alias1, alias2, ....)] AS
        select-statement
        [WITH READ ONLY]
        [WITH CHECK OPTION]

        DML Rules:
            delete:
                - no group by
                - no group function
                - no distinct
                - no sodu column

            update:
                - all rules of delete
                - no expression column

            insert:
                - all rules of update
                - all not null columns included

    - Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table(columns)


        - Indexes have different naming space
        - Indexes will be droped automatically with the table

Last_name
Ahmed => 7
...
Belal => 37
...
..
King => 13
King => 123
...
Ziyad => 50


* Controlling User Access:

    CREATE USER username
    IDENTIFIED BY password

    System Priviliges:
        GRANT priv1|role1, ..., ...
        TO role1|user1, ..., ...

        REVOKE priv1|role1, .., ...
        FROM role1|user1, user2, ....

    CREATE ROLE role_name

    Object Priviliges: (select, insert, update(column), delete, alter)

        GRANT priv1|role1|ALL, ..., ...
        ON object_name
        TO role1|user1|PUBLIC, ..., ...
        [WITH GRANT OPTION]

        REVOKE priv1|role1, .., ...
        ON object_name
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

---------------

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

-------------------

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
- create synonym "depts" for the departments table
- create a sequence for the departments table 
- insert a new department using the synonym and sequence

- create a view from jobs table to show the job-title and min and max salaries for jobs 
with min salary less than 7000