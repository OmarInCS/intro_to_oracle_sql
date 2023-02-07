************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ...]]
[GROUP BY column|expr, ...]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool Expression:
    >, >=, <, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ....)
    LIKE '.....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months( , 3),
        last_day(), next_day( , )

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()


* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()

* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr [[INNER] JOIN table3 ON bool-expr ...]
    * FROM table1 [INNER] JOIN table2 USING (column1, ...) [[INNER] JOIN table3 USING (column1, ...) ...]
    * FROM table1 NATURAL JOIN table2
    * FROM table1 CROSS JOIN table2
    * FROM table1, table2
    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr [ LEFT|RIGHT|FULL [OUTER] JOIN table3 ON bool-expr ...]

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
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]


    commit, rollback, savepoint

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            .., ...,
            [CONSTRAINT cons_name] cons_type
        )

        Naming Rules:
            - not more than 30 char
            - may contain A-Z a-z 0-9 _ $ #
            - start with A-Z a-z
            - not a keyword

        Datatypes:
            char(25), varchar(25), number(5, 2), date, timestamp,
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

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ....)
        | MODIFY (col_name [datatype] [DEFAULT expr] [NOT NULL])
        | DROP (col_name, ....)
        | SET UNUSED (col_name, ....)
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
    - user_tab_columns, ....
    - user_constraints, ....
    - user_cons_columns, ......

* Creating Sequences, Synonyms, Views and Indexes:

    - Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMNET BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE | NO CYCLE]

        DROP SEQUENCE seq_name

    - Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR obj_name

        DROP SYNONYM syn_name

    - Views:
        CREATE [OR REPLACE] VIEW [(alias1, alias2, ....)] AS
        select-stat
        [WITH READ ONLY]
        [WITH CHECK OPTION]

        View DML Rules:
            - delete:
                - no group by
                - no group function
                - no distinct
                - no sudo column

            - update:
                - all rules of delete
                - no expression column

            - insert:
                - all rules of update
                - include all not null columns

    - Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON obj_name(col_name, ...)

        - indexes have separate naming space
        - indexes will be droped automaticaly with the table

2000 => 15
3000 => 25
..
...
10000 => 13
17000 => 3
24000 => 33


---------------------- Examples ------------------------

create table departments AS
select * from hr.departments


create sequence my_depts_seq
start with 50
increment by 10

insert into my_depts (dept_num, dept_name)
values (my_depts_seq.nextval, 'Biomedical')

alter table my_depts
modify (dept_num default my_depts_seq.nextval)


insert into my_depts (dept_name)
values ('Surgery')

select my_depts_seq.currval
from dual

drop sequence my_depts_seq

-----------------------

create synonym emps
for employees

select *
from emps

select *
from employees

drop synonym emps

select *
from user_sequences

-------------------------

create view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500

select last_name, salary
from low_sal_emps

insert into low_sal_emps
values (210, 'Omar', 'oooo', sysdate, 'IT_PROG', 2222)

create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary, rownum as "Row#"
from employees
where salary < 2500

delete from low_sal_emps
where employee_id = 210

create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary, salary * 12 as annual_salary
from employees
where salary < 2500

delete from low_sal_emps
where employee_id = 210

rollback

update low_sal_emps
-- set email = 'omom'
set annual_salary = 25555
where employee_id = 210


create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500
with read only

update low_sal_emps
set email = 'xxx'
where employee_id = 210


create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500


insert into low_sal_emps
values (211, 'Omar', 'oooo', sysdate, 'IT_PROG', 8888)

rollback

create or replace view low_sal_emps as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where salary < 2500
with check option

insert into low_sal_emps
values (211, 'Omar', 'oooo', sysdate, 'IT_PROG', 8888)

--------------------

select *
from employees
where salary > 10000

select *
from employees
where employee_id > 200

create index emp_sal_idx
on employees(salary)

select *
from employees
where salary > 10000

select *
from user_indexes

drop index emp_sal_idx
drop view low_sal_emps

delete from employees
where employee_id in (210, 211)

commit


-------------------- Questions ------------------------

* create a synonym "depts" for the table hr departments

* create sequence named "depts_seq" that generates values 280, 285, 290, ....

* insert three departments with department id generated from the sequence "depts_seq"

* create a view for employees with job IT_PROG
and insert an employee using this view
