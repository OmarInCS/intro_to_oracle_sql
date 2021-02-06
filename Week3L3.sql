************ Week 3, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using the Set Operators

	- union, union all
	- intersect
	- minus

* Managing Tables Using DML Statements:

	- insert:
		INSERT INTO table_name [(column1, column2, ...)]
		VALUES (value1, value2, ...)
	
	- update:
		UPDATE table_name
		SET column1 = value1, ....
		[WHERE bool-expr]
	
	- delete:
		DELETE [FROM] table_name
		[WHERE bool-expr]
	
	
	commit
	rollback

---------------------- Examples ------------------------

select employee_id, hire_date, null, job_id
from employees
union
select employee_id, start_date, end_date, job_id
from job_history

select employee_id, hire_date, 'present', job_id
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

select employee_id
from employees
minus
select manager_id
from employees

----------- DML -----------

insert into departments
values (280, 'Training', 103, 2400)

desc employees

insert into employees 
(EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values (207, 'Walid', 'WaW', sysdate, 'IT_PROG', &sal, 60)

savepoint A

update employees
set first_name = 'Ahmed'
where employee_id = 207

update employees
set salary = (select max(salary)
                from employees
                where job_id = 'IT_PROG')
where employee_id = 207

update employees
set salary = 10000

rollback to A

commit

delete from departments
where department_id = 271

commit
			

-------------------- Questions ------------------------
* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.


* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.
