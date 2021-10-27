************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, .....)]
        VALUES (value1, value2, ....)

        commit
        rollback

    - update:
        UPDATE table_name
        SET column1 = value1, ..., ...
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]


* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (column_name datatype [DEFAULT expr] [CONSTRAINT cons_name cons_type],
         ..., ...,
         [CONSTRAINT cons_name cons_type])

        Object Naming:
            - length <= 30
            - may contain A-Za-z0-9_$#
            - starts with alpha
            - not a keyword

        Datatypes:
            char(20), varchar2(20), number(8, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Constraints types:
            - primary key
            - unique
            - not null
            - check(bool-expr)
            - foreign key


    - alter:

    - drop:

---------------------- Examples ------------------------


insert into departments
values (280, 'Training', null, null)

select *
from departments


desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values (207, 'Abbas', 'aaa', sysdate, 'SA_REP', 7777, 80)

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values ((select max(employee_id) + 1 from employees), 'Fernas', 'fff', sysdate, 'SA_REP', &sal, 80)


commit


update employees
set salary = 7777

rollback

update employees
set salary = 8888
where employee_id = 208

savepoint A

update employees
set first_name = 'Ali'
where employee_id = 208


rollback to A

commit 



update employees
set salary = (select max(salary)
                from employees)
where employee_id = 208



delete from job_history
where employee_id = 208


delete from employees
where employee_id in (207, 208)

delete from departments
where department_id = 280

commit


--------------

create table my_depts
(
    dept_id number(4) constraint my_depts_dept_id_pk primary key,
    dept_name varchar2(50) not null unique
)


insert into my_depts
values (30, 'IT')

create table my_emps
(
    emp_id number(6) constraint my_emps_emp_id_pk primary key,
    emp_name varchar2(30) constraint my_emps_emp_name_nn not null,
    hire_date date default sysdate,
    salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000)
)

insert into my_emps (EMP_ID, EMP_NAME, SALARY)
values (102, 'Fernas', 3333)





-------------------- Questions ------------------------
