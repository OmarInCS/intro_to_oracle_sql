************ Week 3, Lesson 4 ************** 
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



---------------------- Examples ------------------------


alter table my_depts
read only

insert into my_depts
values (40, 'Testing')

alter table my_depts
read write

insert into my_depts
values (40, 'Testing')

alter table my_depts
rename to new_depts

alter table new_depts
rename to my_depts

alter table my_depts
add (city varchar2(30) default 'Riyadh')

desc my_depts

alter table my_depts
modify (dept_name varchar2(30))

desc my_depts

alter table my_depts
drop (city)

alter table my_depts
rename column dept_id to dept_no

delete from my_depts
where dept_no = 30

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK
    foreign key(dept_id)
    references my_depts(dept_no)
    on delete set null

delete from my_depts
where dept_no = 30

insert into my_emps
values (104, 'Aelan', sysdate, 2000, 20)

alter table my_emps
disable constraint MY_EMPS_SALARY_CK

insert into my_emps
values (104, 'Aelan', sysdate, 2000, 20)

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

delete from my_emps
where emp_id = 104

truncate table my_emps

drop table my_emps cascade constraint purge
drop table my_depts cascade constraint purge

-------------------- Questions ------------------------
