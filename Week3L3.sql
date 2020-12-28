************ Week 3, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using Subqueries to Solve Queries

	- Single-row subquery
	- Multible-row subquery
	
* Managing Tables Using DML Statements

	- insert:
		INSERT INTO table_name [(columns)]
		VALUES (values)
		
	- update:
		UPDATE table_name
		SET column1 = value1, column2 = value2, .....
		[WHERE bool-expr]
		
	- delete:
		DELETE [FROM] table_name
		[WHERE bool-expr]
	

---------------------- Examples ------------------------


desc departments

insert into departments
values (300, 'Training', null, null)

insert into departments (DEPARTMENT_ID, DEPARTMENT_NAME)
values (310, 'Applications')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values (210, '&name', '&email', sysdate, '&job', '&salary', 300)

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values (211, '&name', '&email', sysdate, '&&job', (select min_salary
                                                    from jobs
                                                    where job_id = '&job'), 300)
                                                    
select *
from employees

commit

rollback

insert into departments (DEPARTMENT_ID, DEPARTMENT_NAME)
values (300, 'Training')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, DEPARTMENT_ID)
values (211, 'Omar', 'omom', '22-DEC-20', 'SA_MAN', 300)

select *
from employees

commit

update employees
set salary = 8888
where last_name = 'Omar'

savepoint A

update employees
set first_name = 'Karem', phone_number = '0599888921'
where last_name = 'Omar'

rollback to A

commit

select *
from employees

update departments
set manager_id = (select employee_id
                    from employees
                    where last_name = 'Omar')
where department_id = 300

rollback


update departments
set manager_id = null
where department_id = 300

delete from employees
where last_name = 'Omar'

delete from departments
where department_id = 300

commit


-------------------- Questions ------------------------


