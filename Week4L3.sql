************ Week 4, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

* Controlling User Access:

	CREATE USER username
	IDENTIFIED BY password
	
	* System Privileges:
		
		GRANT priv1|role1, .., ...
		TO role1|user1|PUBLIC, .., ...
		
		REVOKE priv1|role1, ..., ...
		FROM role1|user1|PUBLIC, ..., ...
		
	
	CREATE ROLE role_name
	
	
	* Object Privileges: (select, insert, update(), delete)
		
		GRANT priv1|role1|all, .., ...
		ON object_name
		TO role1|user1|PUBLIC, .., ...
		[WITH GRANT OPTION]
		
		REVOKE priv1|role1|all, ..., ...
		ON object_name
		FROM role1|user1|PUBLIC, ..., ...


---------------------- Examples ------------------------

--- SYS_CONN


create user dev1
identified by dev1

select *
from session_privs

grant create session, create sequence, create table
to dev1

grant unlimited tablespace
to dev1

revoke create session, create sequence, create table
from dev1

create role developer


grant create session, create sequence, create table
to developer

grant developer
to dev1

revoke create table
from developer

select *
from hr.employees

grant select, insert
on hr.departments
to developer

grant update(location_id)
on hr.departments
to developer

revoke all
on hr.departments
from developer


-- DEV1_CONN


create table t3 (c1 number)


select *
from hr.departments

insert into hr.departments (department_id, department_name)
values (300, 'DB Admin.')

update hr.departments
set location_id = 1500
where department_id = 300


update hr.departments
set manager_id = 103
where department_id = 300




-------------------- Questions ------------------------

