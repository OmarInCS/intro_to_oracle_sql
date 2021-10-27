************ Week 3, Lesson 4 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Introduction to Data Definition Language (DDL):

    - create:
        CREATE TABLE table_name
        (column_name datatype [DEFAULT expr] [CONSTRAINT cons_name cons_type],
         ..., ...,
         [CONSTRAINT cons_name cons_type])

        Object Naming:
            - length <= 30
            - may contain A-Za-z0-9_$#
            - starts with alpha
            - not a keyword

        Datatypes:
            char(20), varchar2(20), number(8, 2), date, timestamp,
            long, CLOB, BLOB, BFile

        Constraints types:
            - primary key
            - unique
            - not null
            - check(bool-expr)
            - foreign key


    - alter:
        ALTER TABLE table_name
        READ ONLY
        | READ WRITE
        | RENAME TO new_name

        | ADD (column_name datatype [DEFAULT expr] [CONSTRAINT cons_name cons_type], ...)
        | MODIFY (column_name [datatype] [DEFAULT expr] [NULL | NOT NULL])
        | DROP (column_name, ...)
        | RENAME COLUMN column_name TO new_name

        | ADD CONSTRAINT cons_name cons_type
        | DROP CONSTRAINT cons_name
        | DISABLE CONSTRAINT cons_name
        | ENABLE CONSTRAINT cons_name
        | RENAME CONSTRAINT cons_name TO new_name

    - drop:
        DROP TABLE table_name [CASCADE CONSTRAINT] [PURGE]

---------------------- Examples ------------------------



-------------------- Questions ------------------------
