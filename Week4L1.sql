************ Week 4, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM table_name [JOIN .....]
[WHERE bool-expr]	-- filter rows
[GROUP BY column, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|alias|number [ASC|DESC]]

* Introduction to Data Dictionary Views:
	
	* all_tables, user_tables
	* .., user_tab_columns
	* .., user_constraints
	* .., user_cons_columns
	
* Creating Sequences, Synonyms, Views and Indexes:

	* Sequences:
		CREATE SEQUENCE seq_name
		[START WITH number]
		[INCREMENT BY number]
		[MAXVALUE number]
		[MINVALUE number]
		[CYCLE|NOCYCLE]
		
		DROP SEQUENCE seq_name
		
	* Synonyms:
		
		CREATE [PUBLIC] SYNONYM syn_name FOR table_name
		
		DROP SYNONYM syn_name
		
	* Views:
		CREATE [OR REPLACE] VIEW vi_name [(columns)] AS
		select-stat
		
		DML:
			delete:
				- no group by
				- no group function
				- no distinct|unique
				- no soducolumn
			update:
				+ no expression 
			insert:
				+ all NOT NULL columns included
		
		DROP VIEW vi_name
		
	* Indexes:
		CREATE [UNIQUE] INDEX idx_name
		ON table_name(column, ...)

		DROP INDEX idx_name

---------------------- Examples ------------------------


select *
from user_tables

select *
from user_tab_columns

select *
from user_constraints

create sequence dept_seq
start with 280
increment by 10

insert into departments
values (dept_seq.nextval, 'Developing', null, null)

select dept_seq.currval
from dual

drop sequence dept_seq

create synonym emp for employees

select *
from emp

drop synonym emp

create view vi_high_salary as
select last_name, salary, hire_date
from employees
where salary > 12000

--delete from vi_high_salary
--where last_name = 'Abbas'

update vi_high_salary
set salary = 10000
where last_name = 'Abbas'


select last_name, salary, hire_date, rownum
from employees
where salary > 12000

desc employees

drop view vi_high_salary


select last_name, department_name, salary
from employees e join departments d using (department_id)
where salary = (select min(salary)
                from employees)
                
select *
from user_indexes

create unique index emp_phone_ix
on employees(phone_number)

drop index emp_phone_ix





-------------------- Questions ------------------------

