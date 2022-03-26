************ Week 3, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical operators:

    bool-expr AND|OR bool-expr 

* Using Single-Row Functions to Customize Output

    * characters:
        lower(), upper(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    * numbers:
        round(), trunc(), mod()

    * dates:
        round(), trunc(), sysdate,
        months_between( , ), add_months( , ),
        last_day(), next_day( , )

    * conversion:
        to_char(), to_date(), to_number()

    * general:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    max(), min(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, ...)
    
    * FROM table1 NATURAL JOIN table2

    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON|USING


* Using Subqueries to Solve Queries:

    * Single-row Subquery
    * Multipale-row Subquery

* Using the Set Operators:

    * union, union all
    * intersect
    * minus


* Managing Tables Using DML Statements:

    * insert:
        INSERT INTO table_name [(column1, column2, ....)]
        VALUES (value1, value2, ....)


    * update:
        UPDATE table_name
        SET column1 = value1, .....
        [WHERE bool-expr]

    * delete:
        DELETE [FROM] table_name
        [WHERE bool-expr]




---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary, department_id
from employees
where salary > (select salary
                from employees
                where last_name = 'Fox')


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = (select department_id
                        from employees
                        where employee_id = 141)
                        
                        

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Fox')
                

select last_name, hire_date, job_id, salary, department_id
from employees
where salary < (select avg(salary)
                from employees)


select last_name, hire_date, job_id, salary, department_id
from employees
where salary = (select min(salary)
                from employees)

-- Sales Representative
select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Sales Representative')


select last_name, hire_date, salary, salary - (select round(avg(salary))
                                                from employees) as avg_diff
from employees


--select last_name, avg(salary)
--from employees

select last_name, hire_date
from employees 
where hire_date > (select hire_date
                    from employees
                    where last_name = 'Davies')

select last_name, employee_id, salary
from employees
where salary > (select avg(salary)
                from employees)
order by salary



select last_name, hire_date, job_id, salary, department_id
from employees
where salary >all (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where salary >any (select salary
                    from employees
                    where last_name = 'Grant')

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id =any (select department_id
                            from employees
                            where last_name = 'King')

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id in (select department_id
                        from employees
                        where last_name = 'King')

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in (select job_id
                from jobs
                where min_salary = 4000)

select last_name, department_id, job_id
from employees
where department_id =any (select department_id
                            from departments
                            where location_id = 1700)
                            
                            
-------------------

select employee_Id, hire_date, null, job_id
from employees
union
select employee_Id, start_date, end_date, job_id
from job_history


select employee_Id, hire_date, 'untill now' as end_date, job_id
from employees
union
select employee_Id, start_date, to_char(end_date), job_id
from job_history

select employee_Id, hire_date, 'untill now' as end_date, job_id
from employees
union
select employee_Id, start_date, to_char(end_date), job_id
from job_history
order by hire_date


select employee_Id, hire_date, job_id
from employees
union all
select employee_Id, start_date, job_id
from job_history

select employee_Id, hire_date, job_id
from employees
intersect
select employee_Id, start_date, job_id
from job_history

select department_id
from departments
minus
select department_id
from employees

select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK'

select distinct job_id, department_id
from employees
where department_id = 10
union all 
select distinct job_id, department_id
from employees
where department_id = 50
union all
select distinct job_id, department_id
from employees
where department_id = 20

--------------


delete from departments
where department_id >= 280

delete from job_history
where employee_id in (207, 208)


delete from employees
where employee_id in (207, 208)

desc departments

insert into departments
values (280, 'Training', null, null)

insert into departments (DEPARTMENT_ID, DEPARTMENT_NAME)
values (290, 'Testing')

desc employees

insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values (208, 'Abass', 'aaa', sysdate, 'SA_REP', 7777, 80)


insert into employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
values ((select max(employee_id) + 1 from employees), 'Fernas', 'fff', sysdate, 'SA_REP', 7777, 80)

savepoint A

update employees
set first_name = 'Zaid'
where last_name = 'Abass'

update employees
set salary = 10000


rollback
rollback to A

update employees
set salary = 10000
where last_name = 'Abass'

commit

-------------------- Questions ------------------------

* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* Create a report for HR that displays the department 
number, last name, and job ID for every employee in 
the Executive department.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.

* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.
