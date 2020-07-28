************ Week 4, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Managing Tables Using DML Statements:

	* insert:
		INSERT INTO table_name [(column1, ...., ...)]
		VALUES (value1, ..., ...)

	* update:
		UPDATE table_name
		SET column1 = value1, ....
		[WHERE bool-expr]

	* delete:
		DELETE [FROM] table_name
		[WHERE bool-expr]


* Introduction to Data Definition Language (DDL):

	* create:
		CREATE TABLE table_name
		(column_name datatype [DEFAULT expr] [[CONSTRAINT cons_name]cons_type], ..., ..,
		[[CONSTRAINT cons_name]cons_type])
		
		Object Naming:
			* at most 30 char
			* may contain a-z A-Z 0-9 _ $ #
			* start with letter
			* not a keyword
			
		Datatypes:
			char(20), varchar2(20), number(8, 2), date, timestamp
			long, CLOB, BLOB, BFile
		
		Contraint Types:
			* Primary KEY
			* Unique
			* Not null
			* check(bool-expr)
			* foreign key
	
	* alter:
		ALTER TABLE table_name
		READ ONLY
		| READ WRITE
		| RENAME TO new_table_name
		
		| ADD (column_name datatype [DEFAULT expr] [[CONSTRAINT cons_name]cons_type], ...)
		| MODIFY (column_name datatype [DEFAULT expr] [NOT NULL])
		| DROP (column_name, ...)
		| RENAME COLUMN old_name TO new_name
		
		| ADD CONSTRAINT cons_name cons_type
		| DROP CONSTRAINT cons_name
		| DISABLE CONSTRAINT cons_name
		| ENABLE CONSTRAINT cons_name
		| RENAME CONSTRAINT old_name TO new_name
		
	
	* drop:
		DROP TABLE table_name


* Introduction to Data Dictionary Views


---------------------- Examples ------------------------


insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (102, 'Ahmed', 7000, 20)

alter table my_emps read only

alter table my_emps read write

alter table my_emps
rename to cmp_emps

select *
from cmp_emps


alter table cmp_emps
rename to my_emps

alter table my_emps
add (mobile varchar2(10) 
    constraint my_emps_mobile_ck 
    check(length(mobile) = 10))
    
desc my_emps

alter table my_emps
modify (emp_name varchar2(50))

alter table my_emps
drop (mobile)

select *
from my_emps

alter table my_emps
rename column hire_date to start_date


insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Mohamed', 3000, 20)


alter table my_emps
drop constraint my_emps_salary_ck

alter table my_emps
add constraint my_emps_salary_ck check(salary > 4000)

delete from my_depts
where dept_id = 10

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK

alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK foreign key(dept_id)
    references my_depts(dept_id)
    on delete set null
    
rollback

select last_name, salary
from employees

select *
from user_tables

select *
from user_tab_columns

select *
from user_constraints
where table_name = 'MY_EMPS'


select *
from user_cons_columns




-------------------- Questions ------------------------

