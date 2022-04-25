************ Week 3, Lesson 3 ************** 
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

    * drop:



---------------------- Examples ------------------------


update employees
set first_name = 'Hamza'
where employee_id = 207

savepoint A

update employees
set salary = 10000

rollback
rollback to A
commit

update employees
set commission_pct = 0.2
where employee_id = 207

commit

update employees e
set salary = (select max(salary)
                from employees
                where department_id = e.department_id)
where employee_id = 207


----------------

create table my_depts
(
    dept_id number(4) constraint my_depts_dept_id_pk primary key,
    dept_name varchar2(50) unique not null
)

insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(4) constraint my_emps_emp_id_pk primary key,
    emp_name varchar2(50) constraint my_emps_emp_name_nn not null,
    hire_date date default sysdate,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
    dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Fulan', 7555, 30)



-------------------- Questions ------------------------
create courses table as follow:
course_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => btw 12 and 120