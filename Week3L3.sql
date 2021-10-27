************ Week 3, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


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
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (column_name datatype [DEFAULT expr] [CONSTRAINT cons_name cons_type], ...)
        | MODIFY (column_name [datatype] [DEFAULT expr] [NULL | NOT NULL])
        | DROP (column_name, ...)
        | RENAME COLUMN column_name TO new_name

        | ADD CONSTRAINT cons_name cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name

    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

---------------------- Examples ------------------------


alter table my_depts
read only

select *
from my_depts

insert into my_depts
values (40, 'Training')

alter table my_depts
read write

alter table my_depts
rename to new_depts

select *
from new_depts

alter table new_depts
rename to my_depts


desc my_emps

alter table my_emps
add (dept_id number(4) constraint my_emps_my_depts_fk references my_depts(dept_id))

update my_emps
set dept_id = 70
where emp_id = 101

update my_emps
set dept_id = 30
where emp_id = 102

desc my_emps

alter table my_emps
modify (emp_name varchar2(50))


desc my_emps

alter table my_emps
drop (dept_id)


alter table my_emps
rename column hire_date to start_date

desc my_emps


alter table my_emps
add (dept_id number(4))

alter table my_emps
add constraint my_emps_my_depts_fk foreign key(dept_id) references my_depts(dept_id)

update my_emps
set dept_id = 10
where emp_id = 101

delete from my_depts
where dept_id = 10


alter table my_emps
drop constraint my_emps_my_depts_fk

alter table my_emps
add constraint my_emps_my_depts_fk 
    foreign key(dept_id) 
    references my_depts(dept_id)
    on delete set null


delete from my_depts
where dept_id = 10

update my_emps
set salary = 2500
where emp_id = 101

alter table my_emps
disable constraint MY_EMPS_SALARY_CK

rollback


alter table my_emps
enable constraint MY_EMPS_SALARY_CK


drop table my_emps cascade constraints purge

drop table my_depts cascade constraints purge



-------------------- Questions ------------------------
