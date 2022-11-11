************ Week 4, Lesson 1 ************** 
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

---------------------- Examples ------------------------

create table my_depts
(
    dept_id number(4) primary key,
    dept_name varchar(30) not null unique
)

insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(6) constraint my_emps_emp_id_pk primary key,
    emp_name varchar(50) constraint my_emps_emp_name_nn not null,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    hire_date date default sysdate,
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (104, 'Zaid', 4444, 30)

delete from my_depts
where dept_id = 10

alter table my_depts
read only


insert into my_depts
values (40, 'Sales')

alter table my_depts
read write

insert into my_depts
values (40, 'Sales')

alter table my_depts
rename to new_depts

alter table new_depts
rename to my_depts

alter table my_depts
add (city varchar(30) default 'Riyadh')

desc my_depts

alter table my_depts
modify (city varchar(50))

alter table my_depts
drop (city)

alter table my_depts
rename column dept_id to dept_num

delete from my_depts
where dept_num = 10

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK
    foreign key(dept_id)
    references my_depts(dept_num)
    on delete set null
    

delete from my_depts
where dept_num = 10


insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (105, 'Obaid', 2222, 30)

alter table my_emps
disable constraint MY_EMPS_SALARY_CK

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (105, 'Obaid', 2222, 30)

alter table my_emps
enable constraint MY_EMPS_SALARY_CK

delete from my_emps
where emp_id = 105

alter table my_emps
enable constraint MY_EMPS_SALARY_CK


create table it_emps as 
select *
from employees
where job_id = 'IT_PROG'


truncate table it_emps

rollback

drop table it_emps cascade constraint purge






-------------------- Questions ------------------------
* create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120




