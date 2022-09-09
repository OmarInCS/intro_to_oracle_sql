************ Week 5, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
#دقت_ساعة_الكود
------------------------------------------

SELECT [DISTINCT|UNIQUE] *|columns
FROM table_name
[WHERE bool-expr [OR|AND bool-expr]]    -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr [OR|AND bool-expr]]   -- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL
    EXISTS sub-query


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr( , , ), instr(), length(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins:

    - Inner Join:
        FROM table1 [INNER] JOIN table2 ON bool-expr [INNER] JOIN table3 ON bool-expr ....
        FROM table1 [INNER] JOIN table2 USING (column1, ..) [INNER] JOIN table3 USING (column1, ..) ....
        FROM table1 NATURAL JOIN table2

    - Outer Join:
        FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr [INNER] JOIN table3 ON bool-expr ....


* Using Subqueries to Solve Queries:

    - Single-row Subquery
    - Multible-row Subquery
    - Correlated Subquery

* Using the Set Operators:

    - union, union all
    - intersect
    - minus


* Managing Tables Using DML Statements:

    - insert:
        INSERT INTO table_name [(column1, column2, ...)]
        VALUES (value1, value2, ....)

    - update:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ...
        [WHERE bool-expr]

    - delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]

    commit, rollback

* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (
            col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type],
            ..,...,
            [[CONSTRAINT cons_name] cons_type]
        )

        Object Naming:
            * not more than 30 char
            * may contain A-Z a-z 0-9 _ $ #
            * starts with A-Z a-z
            * not a keyword

        Datatypes:
            char(20), varchar(20), number(6, 2), date, timestamp,
            long, CLOB, BLOB, BFile
        
        Constraints Types:
            * primary key
            * unique
            * not null
            * check(bool-expr)
            * foreign key

    - alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (col_name datatype [DEFAULT expr] [[CONSTRAINT cons_name] cons_type], ...)
        | MODIFY (col_name datatype [DEFAULT expr] [NOT NULL], ...)
        | DROP (col_name, ...)
        | SET UNUSED (col_name, ...)
        | DROP UNUSED COLUMNS
        | RENAME COLUMN col_name TO new_name

        | ADD [CONSTRAINT cons_name] cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name

    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

    - truncate:
        TRUNCATE TABLE table_name


* Introduction to Data Dictionary Views:

    - user_tables, all_tables
    - user_tab_columns, all_tab_columns
    - user_constraints, ....
    - user_cons_columns, .....


* Creating Sequences, Synonyms, Views and Indexes:

    - Sequences:
        CREATE SEQUENCE seq_name
        [START WITH number]
        [INCREMENT BY number]
        [MAXVALUE number]
        [MINVALUE number]
        [CYCLE| NO CYCLE]

        DROP SEQUENCE seq_name

    - Synonyms:
        CREATE [PUBLIC] SYNONYM syn_name
        FOR table_name

        DROP SYNONYM syn_name

    - Views:
        CREATE [OR REPLACE] VIEW [(alias1, alias2, ....)] AS
        select-statment
        [WITH READ ONLY]
        [WITH CHECK OPTION]

        View DML Rules:
            delete:
                - no group by
                - no group function
                - no distinct|unique
                - no sudo columns

            update:
                - all rules of delete
                - no expressions

            insert:
                - all rules of update
                - all not null columns included

        DROP VIEW vi_name

    - Indexes:
        CREATE [UNIQUE] INDEX idx_name
        ON table_name(col_name, ....)

        * indexes have a different naming space 
        * indexes will be deleted with the table

        DROP INDEX idx_name

* Controlling User Access:

    CREATE USER username
    IDENTIFIED BY password

    System Priviliges:
        GRANT priv1|role1, priv2, ....
        TO role1|user1, user2, ...

        REVOKE priv1|role1, priv2, ....
        FROM role1|user1, user2, ...

    CREATE ROLE role_name

    Object Priviliges: (select, insert, update(col1, ...), delete, alter)

        GRANT priv1|role1|ALL, priv2, ....
        ON obj_name
        TO role1|user1|PUBLIC, user2, ...
        [WITH GRANT OPTION]

        REVOKE priv1|role1, priv2, ....
        ON obj_name
        FROM role1|user1, user2, ...

---------------------- Examples ------------------------



create table students
(
    student_id number(6) primary key,
    email varchar(150) unique check(email like '%@%'),
    mobile varchar(10) unique check(mobile like '05%'),
    name varchar(50) not null
)

create table trainer
(
    trainer_id number(6) primary key,
    email varchar(150) unique check(email like '%@%'),
    mobile varchar(10) unique check(mobile like '05%'),
    name varchar(50) not null,
    salary number(8, 2) check(salary > 3000)
)

create table courses
(
    course_id number(6) primary key,
    title varchar(150) unique not null,
    start_date date default (sysdate + 7),
    duration number(3) check (duration between 12 and 120),
    price number(6, 2) check(price > 0),
    trainer_id number(6)
)


create table registerations
(
    course_id number(6),
    reg_date date default (sysdate),
    discount number(2, 2) check(discount between 0 and 0.5),
    student_id number(6),
    primary key (course_id, student_id)
)

alter table registerations
add foreign key (student_id)
    references students(student_id)

alter table registerations
add foreign key (course_id)
    references courses(course_id)

alter table courses
add foreign key (trainer_id)
    references trainers(trainer_id)

alter table trainer
rename to trainers

alter table courses
add foreign key (trainer_id)
    references trainers(trainer_id)




-------------------- Questions ------------------------
