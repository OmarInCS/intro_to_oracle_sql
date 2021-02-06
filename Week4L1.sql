************ Week 4, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

* Introduction to Data Dictionary Views

	- user_tables, all_tables
	- user_tab_columns, ....
	- user_constraints, ....

* Creating Sequences, Synonyms, Views and Indexes

	- Sequences:
		CREATE SEQUENCE seq_name
		[START WITH number]
		[INCREMENT BY number]
		[MAXVALUE number]
		[MINVALUE number]
		[CYCLE | NO CYCLE]
		[CACHE number | NOCACHE]
		
		DROP SEQUENCE seq_name
		
	- Synonyms:
		CREATE [PUBLIC] SYNONYM syn_name
		FOR obj_name
		
		DROP SYNONYM syn_name
		
	- Views:
		CREATE VIEW vi_name [(columns)] AS
		query
		[WITH CHECK OPTION]
		[WITH READ ONLY]
		
		delete:
			+ no group function
			+ no group by
			+ no DISTINCT
			+ no ROWNUM
			
		update:
			+ no expression
			
		insert:
			+ all not null included

	- Indexes:
		CREATE [UNIQUE] INDEX idx_name
		ON table_name(column,...)
		
		DROP INDEX idx_name

* Controlling User Access:
	
	CREATE USER username
	IDENTIFIED BY password
	
	System Privileges:
		GRANT priv1|role1, .., ...
		TO role1|user1, ...
		
		REVOKE priv1|role1, .., ..
		FROM role1|user1, ...
	
	CREATE ROLE role_name
	
	Object Privileges: (select, insert, update(columns), delete, alter)
		
		GRANT priv1|role1|ALL, .., ...
		ON table_name
		TO role1|user1|PUBLIC, ...
		[WITH GRANT OPTION]
		
		REVOKE priv1|role1, .., ..
		ON table_name
		FROM role1|user1, ...

---------------------- Examples ------------------------


select *
from user_tables


select *
from user_tab_columns


select *
from all_tables

select *
from user_constraints

select *
from user_cons_columns

create sequence my_depts_seq
start with 40
increment by 10

DROP SEQUENCE my_depts_seq

insert into my_depts
values (my_depts_seq.nextval, 'Marketing')

select my_depts_seq.currval
from dual

alter table my_depts
modify (dept_id default my_depts_seq.nextval)


insert into my_depts (dept_name)
values ('Sales')


create synonym emps
for employees

select *
from emps

drop synonym emps

create view it_dept_emps as
select EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID
from employees
where job_id = 'IT_PROG'

select *
from it_dept_emps

update it_dept_emps
set salary = 9999
where employee_id = 207


update it_dept_emps
set job_id = 'SA_REP'
where employee_id = 207


select *
from employees

select last_name, rownum
from employees

desc employees

select *
from user_indexes

-------------- User Control


create user dev_1
identified by dev_1

select *
from session_privs

grant create session, create table, create sequence
to dev_1

grant unlimited tablespace
to dev_1

revoke create session, create table, create sequence
from dev_1

create role dev_emp
drop role dev_emp

grant create session, create table, create sequence
to dev_emp

grant dev_emp
to dev_1

revoke create table
from dev_emp


select *
from hr.employees

grant select
on hr.employees
to dev_emp

grant update(salary)
on hr.employees
to dev_emp

revoke select, update
on hr.employees
from dev_emp



-------------------- Questions ------------------------
