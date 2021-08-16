************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Creating Sequences, Synonyms, Views and Indexes:

    - Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE | NOCYCLE]
        [CACHE number | NOCACHE]

    - Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR obj_name

    - Views:
        CREATE VIEW vi_name [(aliases)] AS
        query
        [WITH CHECK OPTION]
        [WITH READ ONLY]

        conditions for DML:
            * delete:
                + no group by
                + no group function
                + no distinct|unique
                + no rownum

            * update:
                + all for delete
                + no expression

            * insert:
                + all for update
                + include all not null

        
        DROP VIEW vi_name

    
    - Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table_name(column_name)





---------------------- Examples ------------------------


create view vi_dept_stats as
select department_name, sum(salary) as total_salaries
from employees e join departments d
using(department_id)
group by d.department_name



create or replace view vi_dept_stats as
select department_name, sum(salary) as total_salaries, round(avg(salary)) as salaries_avg
from employees e join departments d
using(department_id)
group by d.department_name


select *
from vi_dept_stats


select total_salaries
from vi_dept_stats

select department_name
from vi_dept_stats
where salaries_avg = (select max(salaries_avg)
                      from vi_dept_stats)

select last_name, rownum
from employees

create view vi_it_emps as
select last_name, email, job_id, hire_date, salary
from employees
where job_id = 'IT_PROG'


desc employees

update vi_it_emps
set salary = 5000
where last_name = 'Pataballa'

create or replace view vi_it_emps as
select last_name, email, job_id, hire_date, salary
from employees
where job_id = 'IT_PROG'
with read only

update vi_it_emps
set salary = 4800
where last_name = 'Pataballa'

--create or replace view vi_it_emps as
--select last_name, email, job_id, hire_date, salary
--from employees
--where job_id = 'IT_PROG'
--with grant option

drop view vi_dept_stats


select *
from user_indexes

create index phone_ix
on employees(phone_number)

select *
from employees
where phone_number like '590%'

drop index phone_ix

desc employees

create or replace view dept_90_vi as
select EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID
from employees
where department_id = 90
with check option

select *
from dept_90_vi

update dept_90_vi
set department_id = 80
where employee_id = 102


update dept_90_vi
set salary = 15000
where employee_id = 102



-------------------- Questions ------------------------

* create a view for department 90 employees, 
make sure that you can execute insert on the view