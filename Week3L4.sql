************ Week 3, Lesson 4 ************** 
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
	
	* drop:
		DROP TABLE table_name



---------------------- Examples ------------------------

    
update employees
set manager_id = 207
where employee_id in (208, 209)

select *
from employees
where employee_id in (208, 209)

commit

update employees
set salary = 10000

rollback

update employees
set salary = 10000
where employee_id = 207


update employees
set salary = 10000
where employee_id = 208

savepoint A

update employees
set salary = 10000
where employee_id = 209

select *
from employees
where employee_id  >= 207

rollback to A

commit

update employees
set salary = (select max_salary
                from jobs
                where job_id = 'SA_REP')
where employee_id = 207


update employees e
set salary = (select max_salary
                from jobs
                where job_id = e.job_id)
where employee_id = 207

desc employees

drop table my_emps
drop table my_depts

create table my_depts
(dept_id number(3) primary key,
 dept_name varchar2(50) unique not null)
 
 insert into my_depts
 values (20, 'Accounting')
 
 select *
 from my_depts
 
 create table my_emps
 (emp_id number(4) constraint my_emps_emp_id_pk primary key,
  emp_name varchar2(30) constraint my_emps_emp_name_nn not null,
  hire_date date default sysdate,
  salary number(8, 2) constraint my_emps_salary_ck check(salary > 4000),
  dept_id number(3) constraint my_emps_dept_id_fk references my_depts(dept_id))
  
insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (102, 'Omar', 7000, 13)   





-------------------- Questions ------------------------

// Add new Department
// Add Employee in the new department
// move the employee to different department
// delete the department
