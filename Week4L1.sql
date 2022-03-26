************ Week 4, Lesson 1 ************** 
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




---------------------- Examples ------------------------


create table my_depts
(
    dept_id number(4) constraint my_depts_dept_id_pk primary key,
    dept_name varchar(30) unique not null
)

insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(4) constraint my_emps_emp_id_pk primary key,
    emp_name varchar(30) constraint my_emps_emp_name_nn not null,
    hire_date date default sysdate,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

desc my_emps

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (104, 'Obaid', 3777, 10)

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
add (city varchar(30) default 'Riyadh')

alter table my_depts
modify (city varchar(50))

desc my_depts

alter table my_depts
drop (city)

alter table my_depts
rename column dept_id to dept_num

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (105, 'Fulan', 2777, 10)

alter table my_emps
drop constraint MY_EMPS_SALARY_CK

alter table my_emps
add constraint MY_EMPS_SALARY_CK check(salary > 2000)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (106, 'Aelan', 1777, 10)

alter table my_emps
disable constraint MY_EMPS_SALARY_CK

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (106, 'Aelan', 1777, 10)

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

delete from my_emps
where emp_id = 106

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

alter table my_emps
add constraint my_emps_emp_name_uq unique(emp_name)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (106, 'Fulan', 3777, 10)



-------------------- Questions ------------------------
create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120

* modify course_title to be varchar(70)
* modify price constraint to be 500 and 2000 
