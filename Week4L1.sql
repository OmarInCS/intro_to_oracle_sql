************ Week 4, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column1, ...
FROM table
[WHERE bool-expr [AND|OR bool-expr]]    -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        length(), lpad(), rpad(), substr(), instr()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc()
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), avg(), sum(), count()

* Displaying Data from Multiple Tables Using Joins:

    - Inner Join:
        FROM table1 [INNER] JOIN table2 ON bool-expr JOIN table3 ON bool-expr ....
        FROM table1 [INNER] JOIN table2 USING (column1, ....) JOIN table3 USING (column1, ....) ....
        FROM table1 NATURAL JOIN table2

    - Outer Join:
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr LEFT|RIGHT|FULL [OUTER] JOIN table3 ON bool-expr ....
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 USING (column1, ....) LEFT|RIGHT|FULL [OUTER] JOIN table3 USING (column1, ....) ....
    
* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multible-row Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table [(column1, column2, ....)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table
        SET column1 = value1, column2 = value2, ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table
        [WHERE bool-expr]

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., .., 
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming rules:
            - not more than 30 char
            - may contain A-Z a-z 0-9 _ $ #
            - starts with A-Z a-z
            - not a keyword

        Data Types:
            char(20), varchar(20), number(5, 2), date, timestamp,
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


desc departments

insert into departments
values (280, 'Developing', null, null)

insert into departments (department_id, department_name)
values (290, 'Training')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values ((select max(employee_id) + 1
         from employees), 'Abbas', 'abab', sysdate, 'AC_MGR', 10000)

commit
--rollback


update employees
set first_name = 'Fernas'
where employee_id = 210

savepoint A

update employees
set salary = 15000

rollback to A

update employees
set salary = 15000
where employee_id = 210

commit

update employees
set salary = 10000
where employee_id = 210

commit

delete from employees
where employee_id > 206

delete from departments
where department_id >= 280

commit


--------------------

create table my_depts
(
    dept_id number(4) primary key,
    dept_name varchar(30) unique not null
)

insert into my_depts
values (30, 'Sales')

create table my_emps
(
    emp_id number(6) constraint my_emps_emp_id_pk primary key,
    emp_name varchar(50) not null,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    hire_date date default sysdate,
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (104, 'Fahad', 6500, 30)




-------------------- Questions ------------------------
* create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120

