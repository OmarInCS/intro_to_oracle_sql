************ Week 3, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Introduction to Data Definition Language (DDL)

	- create:
		CREATE TABLE table_name
		(col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
		..., ...,
		[[CONSTRAINT cons_name] cons_type])
		
		Object Naming:
			- length 1-30
			- allowed a-z A-Z 0-9 _ $ #
			- starts with letter
			- not a keyword
		
		Datatype:
			char(20), varchar2(20), number(8, 2),
			date, timestamp, long, CLOB, BLOB, BFile
			
		CONSTRAINT Types:
			- Primary Key
			- Unique
			- NOT NULL
			- Check(bool-expr)
			- Foreign Key
		
	- alter:
		ALTER TABLE table_name
		READ ONLY 
		| READ WRITE
		| RENAME TO new_name
		
		| ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
		| MODIFY (col_name [datatype] [DEFAULT expr] [NOT NULL])
		| DROP (col_name)
		| RENAME COLUMN old_name TO new_name
		
		| ADD CONSTRAINT cons_name cons_type
		| DROP CONSTRAINT cons_name
		| DISABLE CONSTRAINT cons_name
		| ENABLE CONSTRAINT cons_name
		| RENAME CONSTRAINT cons_name TO new_name 
		
	- drop:
		DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]
		
	- truncate:
		truncate table table_name
	

---------------------- Examples ------------------------


create table my_depts
(dept_id number(4) primary key,
 dept_name varchar2(50) unique not null)
 
 desc my_depts
 
 insert into my_depts
 values (20, 'Accounting')
 
 create table my_emps
 (emp_id number(4) constraint my_emps_emp_id_pk primary key,
  emp_name varchar2(30) constraint my_emps_emp_name_nn not null,
  hire_date date default sysdate,
  salary number(8, 2) constraint my_emps_salary_ck check(salary > 4000),
  dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id))
  
insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (101, 'Ahmed', 7777, 10)


insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (101, 'Walid', 4333, 20)


drop table my_depts cascade constraint purge

truncate table my_emps

drop table my_emps cascade constraint purge


alter table my_depts
read only


alter table my_depts
read write

insert into my_depts
values (10, 'Administration')
 
 alter table my_depts
 rename to new_depts
 
 select *
 from new_depts
 
 alter table my_emps
 add (comm number(2, 2))
 
 desc my_emps
 
 alter table my_emps
 modify (hire_date date not null)
 
 alter table my_emps
 drop (comm)
 
 alter table my_emps
 rename column hire_date to start_date
 
 
insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (102, 'Fahad', 3333, 20)

 alter table my_emps
 drop constraint MY_EMPS_SALARY_CK 

update my_emps
set salary = 5555

 alter table my_emps
 add constraint MY_EMPS_SALARY_CK check (salary > 4000) 
 
 
 alter table my_emps
 DISABLE constraint MY_EMPS_SALARY_CK
 
 
 alter table my_emps
 ENABLE constraint MY_EMPS_SALARY_CK


-------------------- Questions ------------------------


