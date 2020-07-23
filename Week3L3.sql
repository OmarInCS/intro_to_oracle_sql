************ Week 3, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Using the Set Operators:
	
	* union, union all
	* intersect
	* minus

* Managing Tables Using DML Statements:

	* insert:
		INSERT INTO table_name [(column1, ...., ...)]
		VALUES (value1, ..., ...)

	* update:

	* delete:
		DELETE [FROM] table_name
		[WHERE bool-expr]


---------------------- Examples ------------------------


select employee_id, hire_date, 'untill now' as end_date, job_id
from employees
union
select employee_id, start_date, to_char(end_date), job_id
from job_history
order by hire_date desc

select employee_id, hire_date, e.job_id, start_date, j.job_id
from employees e join job_history j
using(employee_id)


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


select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK'

select distinct job_id, department_id
from employees
where department_id = 10
union all
select distinct job_id, department_id
from employees
where department_id = 50
union all
select distinct job_id, department_id
from employees
where department_id = 20


------------ DML ------------

delete from job_history
where employee_id >= 207

delete from employees
where employee_id >= 207

insert into departments
values (290, 'Training', 103, 1500)

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values (207, 'Abbas', 'abb', sysdate, 'SA_REP', 6000)


insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values (208, '&name', '&email', sysdate, 'SA_REP', 6000)


insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values ((select max(employee_id) + 1
         from employees), 'Mehtas', 'mmm', sysdate, 'SA_REP', 6000)
         





-------------------- Questions ------------------------


* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.


* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.

