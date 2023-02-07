************ Week 3, Lesson 3 ************** 
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

    - drop:

---------------------- Examples ------------------------


insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values (207, 'Abass', 'aaa', sysdate, 'IT_PROG', 7777)

update employees
set salary = 10000
where employee_id = 207

commit

update employees
set salary = 10000

rollback

update employees
set salary = 12000
where employee_id = 207

savepoint A

update employees
set first_name = 'Zaid'
where employee_id = 207

rollback to A

commit


update employees
set first_name = 'Zaid'
where employee_id = 207

commit

-------------------

create table My_depts
(
    dept_id number(4) primary key,
    dept_name varchar(30) unique not null
)

insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(4) constraint my_emps_emp_id_pk primary key,
    emp_name varchar(30) not null,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    hire_date date default sysdate,
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Hussain', 20000, 30)



-------------------- Questions ------------------------
* create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120


* create a projects table 
project_id => pk
project_name => not null
client_name => 
hour_rate => positive greater than 1


* create a tasks table
task_id => pk
description => max char 255
start_date => date
end_date => greater than start_date
project_id => foreign key