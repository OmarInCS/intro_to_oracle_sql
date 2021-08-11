************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, ...)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name 
        SET column1 = value1, .....
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

---------------------- Examples ------------------------


insert into departments 
values (280, 'Training', null, null)

select *
from departments


--insert into departments 
--values (290, null, null, null)

desc departments

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values (207, 'Abbas', 'aaa', sysdate, 'IT_PROG', &sal)

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values ((select max(employee_id) + 1
         from employees), 'Fernas', 'fff', sysdate, 'SA_REP', 5000)

savepoint A

update employees
set department_id = 280
where last_name = 'Abbas'

select *
from employees

update employees
set salary = 10000

rollback to A

commit

update employees
set department_id = 280
where last_name = 'Fernas'

commit

update employees e
set salary = (select max_salary
              from jobs
              where job_id = e.job_id)
where last_name = 'Fernas'


delete from job_history
where employee_id in  (207, 208)

delete from employees
where last_name in ('Abbas', 'Fernas')

select last_name, to_char(hire_date, 'DD-Mon-YY HH:MI')
from employees



-------------------- Questions ------------------------

