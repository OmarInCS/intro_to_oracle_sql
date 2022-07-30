************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC]]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), lpad(), rpad(), substr(), instr()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate,
        months_between(), add_months()
        last_day(), next_day()

    * Conversion:
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    min(), max(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, column2, ...)
    * FROM table1 NATURAL JOIN table2
    
    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr

* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Muiltibale-row Subquery
    - Corellated Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus

* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, .....)

    - update:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr] 

    - merge:


    COMMIT, ROLLBACK [TO savepoint_name], SAVEPOINT name

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..., ...,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming:
            * not more than 30 char
            * may contain A-Z a-z 0-9 _ $ #
            * starts with A-Z a-Z
            * not a keyword

        Datatypes:
            char(20), varchar(20), number(8, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Constraint Types:
            * Primary Key
            * Unique
            * Not NULL
            * Check (bool-expr)
            * foreign key --- cascade, set null

    - alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL])
        | DROP (col_name, ...)
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


desc departments

insert into departments
values (300, 'Applications', null, null)

insert into departments (department_id, department_name)
values (310, 'Public Relations')

savepoint A

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values ((select max(employee_id) + 1
         from employees), 'Fulan', 'fff', sysdate, 'PU_CLERK', &sal, 30 )

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values ((select max(employee_id) + 1
         from employees), '3elan', '333', '28-Jul-22', 'PU_CLERK', &sal, 30 )

rollback to A
commit

update employees
set salary = 10000
where last_name = 'Wael'

rollback
commit


update employees tm
set salary = (select round(avg(salary))
                from employees ts
                where ts.job_id = tm.job_id)
where last_name = 'Wael'

update employees
set first_name = last_name, last_name = first_name

rollback

delete from employees
where employee_id in (207, 210)

delete from departments
where department_id >= 280

commit

desc departments

------------

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

insert into my_emps (EMP_ID, EMP_NAME, SALARY, HIRE_DATE)
select employee_id, last_name, salary, hire_date
from employees
where department_id = 100


insert into my_emps (EMP_ID, EMP_NAME, SALARY, HIRE_DATE)
select employee_id, last_name, salary, hire_date
from employees
where department_id in (90, 60)


merge into my_emps me using 
(select employee_id, last_name, salary, hire_date
    from employees
    where department_id in (90, 60)) e
on (me.emp_id = e.employee_id)
when matched then
update 
    set emp_name = last_name, me.salary = e.salary, me.hire_date = e.hire_date
when not matched then
insert (EMP_ID, EMP_NAME, SALARY, HIRE_DATE)
values (e.employee_id, e.last_name, e.salary, e.hire_date)

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

* modify course_title to be varchar(70)
* modify price constraint to be 500 and 2000
* add column trainer_name 
