************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

* Creating Sequences, Synonyms, Views and Indexes:

	* Sequences:
		CREATE SEQUENCE seq_name
		[START WITH number]
		[INCREMENT BY number]
		[MAXVALUE number]
		[MINVALUE number]
		[CYCLE|NOCYCLE]
		[CACHE number|NOCACHE]
		
		DROP SEQUENCE seq_name
		
	* Synonyms:
		CREATE [PUBLIC] SYNONYM syn_name
		FOR obj_name
		
		DROP SYNONYM syn_name
		
	* Views:
		CREATE [OR REPLACE] VIEW vi_name [(alias1, alias2, ...)] AS
		<select-statement>
		[WITH CHECK OPTION]
		[WITH READ ONLY]
		
		DROP VIEW vi_name
		
	* Indexes:
		CREATE [UNIQUE] INDEX idx_name
		ON table_name(col_name)
		
		DROP INDEX idx_name

---------------------- Examples ------------------------


create sequence my_emps_seq
start with 104

drop sequence my_emps_seq
drop sequence my_depts_seq

insert into my_emps ( EMP_NAME, SALARY, DEPT_ID)
values ( 'Mehtas', 7000, 10)

alter table my_emps
modify (emp_id number(4) default my_emps_seq.nextval)

select  my_emps_seq.currval
from dual

create sequence my_depts_seq
start with 30
increment by 10

alter table my_depts
modify (dept_id default my_depts_seq.nextval)

insert into my_depts (dept_name)
values ('Sales')

------------------- 

select *
from employees

create synonym emps
for employees


select *
from emps

drop synonym emps

select *
from user_sequences


select *
from user_synonyms

----------------

create or replace view it_view as
select employee_id, last_name, email, hire_date, job_id, salary
from employees
where department_id = 60
with check option

select last_name, hire_date
from it_view

insert into it_view
values (214, 'Salma', 'sss', sysdate, 'IT_PROG', 7000)

select *
from employees


select *
from it_view

update it_view
set salary = 10000
where employee_id = 213

select rownum, employee_id, last_name, email, hire_date, job_id, salary
from employees
where department_id = 60

desc employees

drop view it_view
drop view it_dept_vi
drop view sales_emps_vi

select *
from user_indexes
where table_name = 'MY_EMPS'




-------------------- Questions ------------------------

