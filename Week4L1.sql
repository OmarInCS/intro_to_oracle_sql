************ Week 4, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Introduction to Data Dictionary Views
	
	* USER_TABLES, ALL_TABLES
	* USER_TAB_COLUMNS, .....
	* USER_CONSTRAINTS, ....
	* USER_CONS_COLUMNS, ....

* Creating Sequences, Synonyms, Views and Indexes

	* CREATE SEQUENCE seq_name
	  [START WITH number]
	  [INCREMENT BY number]
	  [MAXVALUE number]
	  [MINVALUE number]
	  [CYCLE|NO CYCLE]
	  [CACHE number|NOCACHE]
	  
	  DROP SEQUENCE seq_name
	  
	* CREATE [PUBLIC] SYNONYM syn_name
	  FOR table_name
	  
	  DROP SYNONYM syn_name
	  
	* CREATE [UNIQUE] INDEX idx_name
	  ON table_name(col_name|expr)
	  
	  DROP INDEX idx_name
	
	* Views
		CREATE VIEW vi_name AS
		select-statement
		
		DML: 
			delete:
				- no group function
				- no group by
				- distinct
				- no rownum
			
			update:
				+ no expr
				
			insert:
				+ not null column missing
				
		
		DROP VIEW vi_name
			

---------------------- Examples ------------------------


select last_name, hire_date
from employees
where department_id in (select department_id
                        from employees
                        where last_name = '&&name')
and last_name <> '&name'

undefine name

---------------
desc new_depts
desc my_emps

select *
from user_constraints
where table_name = 'MY_EMPS'

select *
from user_cons_columns
where table_name = 'MY_EMPS'

select *
from user_tables

select *
from user_tab_columns

delete from new_depts
where dept_id = 20

alter table my_emps
drop constraint MY_EMPS_DEPT_ID_FK


alter table my_emps
add constraint MY_EMPS_DEPT_ID_FK foreign key(dept_id)
                                  references new_depts(dept_id)
                                  on delete set null


delete from new_depts
where dept_id = 20

drop sequence my_emps_seq

create sequence my_emps_seq
start with 102

insert into my_emps (EMP_ID, EMP_NAME, SALARY, DEPT_ID)
values (my_emps_seq.nextval, 'Abbas', 4444, 30)

delete from new_depts

create sequence new_depts_seq
start with 10
increment by 10

desc new_depts

alter table new_depts 
modify (dept_id default new_depts_seq.nextval)

insert into new_depts (dept_name)
values ('IT Support')


select new_depts_seq.currval
from dual

select *
from user_sequences

drop sequence new_depts_seq
drop sequence my_emps_seq

select *
from emps

create synonym emps
for employees

drop synonym emps

select *
from employees
where last_name like 'K%'

select *
from user_indexes
where table_name in ('MY_EMPS', 'NEW_DEPTS')

create view emps_addresses as
select last_name, department_name, city, street_address
from employees 
join departments using(department_id)
join locations using(location_id)



select last_name, department_name, city
from emps_addresses
where department_name = 'Sales'

create view high_salary_emps (emp_id, emp_name, email, hire_date, job_id, salary) as 
select EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY
from employees
where salary > 12000

insert into HIGH_SALARY_EMPS
values (214, 'Yasser', 'yaya', sysdate, 'SA_MAN', 18888)

delete from HIGH_SALARY_EMPS
where emp_id = 214

select rownum, last_name
from employees

desc employees

drop view EMPS_ADDRESSES
drop view HIGH_SALARY_EMPS


-------------------- Questions ------------------------


