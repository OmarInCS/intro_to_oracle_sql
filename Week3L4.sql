************ Week 3, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Introduction to Data Definition Language (DDL)

* create:
	CREATE TABLE table_name
	(col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type]
	 ,..., ...,
	 [[CONSTRAINT cons_name] cons_type])

	Object Naming :
		- less than 30 char
		- contain only a-zA-Z0-9$#_
		- start with letter
		- not a keyword
		
	Datatypes:
		char(20), varchar2(20), number(6, 2), date, timestamp
		long, CLOB, BLOB, BFile
		
	Constraints:
	
		- primary key
		- unique
		- not null
		- check (bool-expr)
		- foreign key

* alter:


* drop:
	DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

---------------------- Examples ------------------------


create table my_depts
(dept_id number(4) constraint my_depts_my_depts_pk primary key,
 dept_name varchar2(30) unique not null)

insert into my_depts
values (30, 'IT')

create table my_emps
(emp_id number(4) constraint my_emps_emp_id_pk primary key,
 emp_name varchar2(30) constraint my_emps_emp_name_nn not null,
 hire_date date default sysdate,
 salary number(8, 2) constraint my_emps_salary_ck check(salary > 4000),
 dept_id number(4) constraint my_emps_emp_dept_id references my_depts(dept_id))
 

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (103, 'Yasmin', 4500, 20)


			

-------------------- Questions ------------------------

