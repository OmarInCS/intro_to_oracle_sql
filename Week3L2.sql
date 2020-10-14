************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM table_name [JOIN .....]
[WHERE bool-expr]	-- filter rows
[GROUP BY column, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|alias|number [ASC|DESC]]

* Using the Set Operators:
	
	* union, union all
	* intersect
	* minus

* Managing Tables Using DML Statements:

	- insert:
		INSERT INTO table_Name [(column1, ...)]
		VALUES (value1, ...)
	
	- update:
		UPDATE table_name
		SET column1 = value1, ...
		[WHERE bool-expr]
	
	- delete:
		DELETE [FROM] table_name
		[WHERE bool-expr]



---------------------- Examples ------------------------


select employee_id, hire_date, job_id
from employees
union
select employee_id, start_date, job_id
from job_history

select employee_id, hire_date, null, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history


select employee_id, hire_date, 'until now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history
order by hire_date


select employee_id, hire_date, job_id
from employees
union all
select employee_id, start_date, job_id
from job_history


select employee_id, hire_date, job_id
from employees
intersect
select employee_id, start_date, job_id
from job_history

select department_id
from departments
minus
select department_id
from employees


insert into departments
values (310, 'Web Developing', 103, 2400)

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values (210, 'Walid', 'www', sysdate, 'ST_CLERK', 4000)

commit

update employees
set salary = 10000

rollback

update employees
set salary = 5000
where employee_id = 210

savepoint A

update employees
set commission_pct = 0.12
where employee_id = 210

rollback to A

delete from employees
where last_name = 'Walid'

delete from departments
where department_id > 270

commit




-------------------- Questions ------------------------

