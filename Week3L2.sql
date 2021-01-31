************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

* Managing Tables Using DML Statements

	* insert:
		INSERT INTO table_name [(column1, column2, ...)]
		VALUES (value1, value2, ...)
	
	* update:
		UPDATE table_name 
		SET column1 = value1, ...
		[WHERE bool-expr]
		
	* delete:
		DELETE [FROM] table_name
		[WHERE bool-expr]
	
	commit
	rollback
	

* Introduction to Data Definition Language (DDL)

	* create:
		CREATE TABLE table_name 
		(col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name]cons_type], 
		.., 
		...,
		[[CONSTRAINT cons_name]cons_type])
		
		Object Naming:
			- less than 30 char
			- contain only a-zA-Z0-9$_#
			- starts with letter
			- not a keyword
			
		Datatypes:
			char(20), varchar2(20), number(8, 2), date, timestamp,
			long, CLOB, BLOB, BFile
			
		Constraints Type:
			- Primary KEY
			- UNIQUE
			- Not NULL
			- check(bool-expr)
			- Foreign KEY
		
	* alter:
		ALTER TABLE table_name
		READ ONLY
		| READ WRITE
		| RENAME TO new_name
		
		| ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name]cons_type])
		| MODIFY (col_name datatype [DEFAULT expr] [NOT NULL])
		| DROP (column1, ...)
		| RENAME COLUMN col_name TO new_name
		
		| ADD [CONSTRAINT cons_name]cons_type
		| DROP CONSTRAINT cons_name
		| DISABLE CONSTRAINT cons_name
		| ENABLE CONSTRAINT cons_name
		| RENAME CONSTRAINT cons_name TO new_name
		
		
	* drop:
		DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

---------------------- Examples ------------------------


insert into departments
values (300, 'Applications', 103, 1500)

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
values (210, 'Walid', 'wawa', sysdate, 'IT_PROG', &sal)

savepoint A

update employees
set first_name = 'Ali'
where employee_id = 210

update employees
set salary = (select max(salary)
                from employees
                where job_id = 'IT_PROG')
where employee_id = 210

--update employees
--set salary = 10000

select *
from employees

rollback
rollback to A

commit

delete from employees
where employee_id = 210

commit

delete from employees
where employee_id > 206

delete from departments
where department_id > 270

insert into hr.departments (department_id, department_name)
values(271,'Databases')

insert into hr.employees (employee_id,first_name,last_name,email,hire_date,job_id,salary, department_id)
values (350,'norah','alharbi','www',sysdate,'AD_ASST',3000, 271)


-------------- DDL ---------------
create table my_depts
(dept_id number(4) constraint my_depts_dept_id_pk primary key,
 dept_name varchar2(50) not null unique)
 
insert into my_depts 
values (30, 'IT')

create table my_emps 
(emp_id number(4) constraint my_emps_emp_id_pk primary key,
 emp_name varchar2(30) constraint my_emps_emp_name_nn not null,
 hire_date date default sysdate,
 salary number(8, 2) constraint my_emps_salary_ck check(salary > 4000),
 dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id))
 
insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Azaam', 5000, 20)

alter table my_emps
read only

alter table my_emps
read write

alter table my_emps
rename to new_emps


alter table new_emps
rename to my_emps

alter table my_depts
add (city varchar2(30))

desc my_depts


alter table my_depts
modify (city varchar2(50) default 'Riyadh')


insert into my_depts (DEPT_ID, DEPT_NAME)
values (30, 'IT')

alter table my_depts
drop (city)

alter table my_emps
drop constraint my_emps_salary_ck


insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (104, 'Amr', 3000, 20)

alter table my_emps
add constraint my_emps_salary_ck check(salary > 4000)

delete from my_emps
where emp_id = 104

delete from my_depts
where dept_id = 20

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK 
    foreign key (dept_id)
    references my_depts(dept_id)
    on delete set null
    
delete from my_depts
where dept_id = 20

DROP TABLE my_depts CASCADE CONSTRAINT PURGE

DROP TABLE my_emps CASCADE CONSTRAINT PURGE


-------------------- Questions ------------------------
