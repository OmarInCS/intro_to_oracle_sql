************ Week 3, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM table_name [JOIN .....]
[WHERE bool-expr]	-- filter rows
[GROUP BY column, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|alias|number [ASC|DESC]]


* Introduction to Data Definition Language (DDL):
	
	- create:
		CREATE TABLE table_name 
		(col_name datatype [DEFAULT expr] [CONSTRAINT cons_name cons_type], ..., ...,
		[CONSTRAINT cons_name cons_type])
		
		Naming:
			* less than 30 char
			* a-z A-Z 0-9 _ $ #
			* starts with letter
			* not a keyword
			
		Datatype:
			char(20), varchar2(20), number(8, 2), date, timestamp,
			long, CLOB, BLOB, BFile
			
		Constraints:
			- Primary KEY
			- UNIQUE
			- Not NULL
			- Check(bool-expr)
			- foreign key
			
	- alter:
		ALTER TABLE table_name
		READ ONLY
		| READ WRITE
		| RENAME TO new_name
		
		| ADD (col_name datatype [DEFAULT expr] [CONSTRAINT cons_name cons_type])
		| MODIFY (col_name datatype [DEFAULT expr] [NOT NULL])
		| DROP (col_name, ...)
		| RENAME COLUMN old_name TO new_name
		
		| ADD CONSTRAINT cons_name cons_type
		| DROP CONSTRAINT cons_name
		| DISABLE CONSTRAINT cons_name
		| ENABLE CONSTRAINT cons_name
		| RENAME CONSTRAINT old_name TO new_name
	
	- drop:
		DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]
		
	- truncate:
		TRUNCATE TABLE table_name

---------------------- Examples ------------------------


create table my_depts
(dept_id number(4) primary key,
 dept_name varchar(30) unique not null)
 
 insert into my_depts
 values (30, 'IT')
 
 create table my_emps
 (emp_id number(4) constraint my_emps_emp_id_pk primary key,
  emp_name varchar2(30) constraint my_emps_emp_name_uk unique,
  hire_date date default sysdate,
  salary number(8, 2) constraint my_emps_salary_ck check(salary > 3000),
  dept_id number(4) constraint my_emps_dept_id_fk references my_depts(dept_id))
  
insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (102, 'Walid', 4000, 30)

alter table my_emps
read only

alter table my_emps
read write

alter table my_emps
rename to new_emps


alter table new_emps
rename to my_emps

alter table my_depts
add (mgr_id number(4) references my_emps(emp_id))

desc my_depts

alter table my_depts
modify (dept_name varchar2(50))

desc my_depts

alter table my_depts
drop (mgr_id)

alter table my_emps
rename column hire_date to start_date

alter table my_emps
drop constraint my_emps_salary_ck


insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Mai', 2000, 10)

delete from my_emps
where emp_id = 103


alter table my_emps
add constraint my_emps_salary_ck check(salary > 3000)

alter table my_emps
disable constraint my_emps_salary_ck


alter table my_emps
enable constraint my_emps_salary_ck

delete from my_depts
where dept_id = 30

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK 
    foreign key (dept_id) 
    references my_depts(dept_id)
    on delete set null


drop table my_depts cascade constraint purge
drop table my_emps cascade constraint purge






-------------------- Questions ------------------------

