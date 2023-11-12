************ Session 10 ************** 
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



---------------------- Examples ------------------------

Group 1: 18 + 5 + 3 + 10 + 10 + 8 + 3
Group Moshi Mosh: 18 + 13 + 15 + 8 + 8 + 13 + 15



desc departments

insert into departments
values (280, 'Training', null, null)

insert into  departments (DEPARTMENT_ID, DEPARTMENT_NAME)
values (290, 'Development')

desc employees

insert into employees (EMPLOYEE_ID, EMAIL, HIRE_DATE, SALARY, JOB_ID, LAST_NAME)
values ((select max(employee_id) + 1 from employees),
        'ab@gmail.com', sysdate, 10000, 'IT_PROG', 'Abbas')

update employees
set first_name = 'Fernas'
where employee_id = 207


update employees
set salary = 20000

rollback

update employees
set salary = (select max(salary)
                from employees)
where employee_id = 207

commit

delete from employees
where employee_id in (207, 208)

delete from departments
where department_id = 290

commit

show autocommit



-------------------- Questions ------------------------
