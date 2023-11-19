************ Session 11 ************** 
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

    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]


---------------------- Examples ------------------------

Group 1: 57
Group Moshi Mosh: 90


create table my_depts
(
    dept_id number(4) primary key,
    dept_name varchar(30) unique not null
)

insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(5) constraint my_emps_emp_id_pk primary key,
    emp_name varchar(50) constraint my_emps_emp_name_nn not null,
    salary number(12, 2) constraint my_emps_salary_ck check(salary > 3000),
    hire_date date default sysdate,
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (102, 'Fernas', 7000, 30)

commit

delete from my_depts
where dept_id = 10


drop table my_depts cascade constraint purge
drop table my_emps cascade constraint purge


-------------------- Questions ------------------------
* create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120