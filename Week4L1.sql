************ Week 4, Lesson 1 ************** 
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




---------------------- Examples ------------------------


alter table my_depts
read only

insert into my_depts
values (40, 'Quality')

alter table my_depts
read write

insert into my_depts
values (40, 'Quality')

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
drop (city)

desc my_depts

alter table my_depts
rename column dept_id to dept_num

desc my_depts


alter table my_depts
add (city varchar(30) default 'Riyadh')

desc my_depts

alter table my_depts
set unused (city)


desc my_depts

select *
from my_depts

alter table my_depts
drop unused columns


update my_emps
set dept_id = 15
where emp_id = 101

delete from my_depts
where dept_num = 20

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

update my_emps
set dept_id = 15
where emp_id = 101

rollback

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK
    foreign key (dept_id)
    references my_depts(dept_num)
    on delete set null

delete from my_depts
where dept_num = 20

update my_emps
set salary = 2000
where emp_id = 101

alter table my_emps
disable constraint MY_EMPS_SALARY_CK

update my_emps
set salary = 2000
where emp_id = 101

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

update my_emps
set salary = 15000
where emp_id = 101

alter table my_emps
enable constraint MY_EMPS_SALARY_CK


create table it_emp_copy as
select *
from employees
where job_id = 'IT_PROG'

drop table it_emp_copy cascade constraint purge

truncate table my_emps

-------------------

select *
from user_tables

select *
from user_tab_columns

select *
from user_constraints



-------------------- Questions ------------------------

* modify course_title to be varchar(70)

* add column trainer_name 