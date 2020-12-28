************ Week 4, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

* Controlling User Access

	CREATE USER username
	IDENTIFIED BY password
	
	System PRIVILEGES:
		GRANT priv1|role1, ..., ...
		TO user1|role1, ...., ...
		[WITH GRANT OPTION]
		
		REVOKE priv1, .., ...
		FROM user1, ..., ...
	
	CREATE ROLE role_name

	Object PRIVILEGES: (select, update, delete, insert)
		GRANT priv1|role1|ALL, ..., ...
		ON object_name
		TO user1|role1|PUBLIC, ...., ...
		[WITH GRANT OPTION]
		
		REVOKE priv1, .., ...
		ON object_name
		FROM user1, ..., ...

---------------------- Examples ------------------------

---- SYS_CONN
create user demo
identified by demo

drop user demo cascade

select *
from session_privs

grant create session, create table, create sequence
to demo

grant unlimited tablespace
to demo

revoke create session, create table, create sequence
from demo


create role developer

drop role developer

grant create session, create table, create sequence
to developer

grant developer
to demo

revoke create table 
from developer

grant select
on hr.employees
to developer


grant update(first_name)
on hr.employees
to developer

revoke select, update
on hr.employees
from developer

grant create table
to developer


-------------------- Questions ------------------------

create table trainers
(trainer_id number(4) constraint trainers_trainer_id_pk primary key,
 trainer_name varchar2(50) constraint trainers_trainer_name_nn not null,
 salary number(8, 2) constraint trainers_salary_ck check(salary > 0))
 
create table courses
(course_id number(4) constraint courses_course_id_pk primary key,
 course_title varchar2(50) constraint courses_course_title_nn not null,
 price number(8, 2) constraint course_price_ck check(price > 500 and price < 3000),
 start_time date default (sysdate + 14),
 trainer_id number(4) constraint courses_trainer_id_fk references trainers(trainer_id)
                                                        on delete cascade)
