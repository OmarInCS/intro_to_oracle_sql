************ Week 4, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

System Privileges: 
    GRANT priv1|role1, priv2, ...
    TO role1|user1, user2, ...
    
    REVOKE priv1, priv2, ...
    FROM user1, user2, ...
    
    CREATE ROLE role1
    
Object Privileges:  (select, insert, update, delete, alter)
    GRANT priv1|role1|ALL, priv2, ...
    ON object1
    TO role1|user1|PUBLIC, user2, ...
    
    REVOKE priv1, priv2, ...
    ON object1
    FROM user1, user2, ...
-----------



---------------------- Examples ------------------------


select *
from session_privs

create user demo
identified by demo


grant create session, create table, create sequence
to demo

grant UNLIMITED TABLESPACE
to demo


revoke create session, create table, create sequence
from demo

create role dev_team

grant create session, create table, create sequence
to dev_team

grant dev_team
to demo

revoke create table
from dev_team


grant select, insert, update
on hr.employees
to dev_team

revoke update
on hr.employees
from dev_team



grant update(first_name, last_name)
on hr.employees
to dev_team
-- with grant option



-------------------- Questions ------------------------

