************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

Logical Operator:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate
        months_between(), add_months( , )
        last_day(), next_day( , )

    * Conversion:

    * General:
        case, decode()



---------------------- Examples ------------------------


select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, round(hire_date, 'Year') as start_date
from employees

select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees

select sysdate
from dual

select last_name, hire_date, round(months_between(sysdate, hire_date)) as service_period
from employees


select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) as service_period
from employees

select last_name, hire_date, round(sysdate - hire_date)
from employees

select last_name, hire_date, hire_date + 6
from employees

select last_name, hire_date, add_months(hire_date, 6) start_date
from employees

select last_day(sysdate)
from dual


select next_day(sysdate, 'Sunday')
from dual

select next_day(sysdate, 'Sun')
from dual

select last_name, hire_date, next_day(add_months(hire_date, 6), 'Monday') as review_date
from employees


select last_name, department_id, salary, case 
                                            when department_id = 60 then salary + 1000
                                            when department_id = 30 then salary + 500
                                            when department_id = 90 then salary - 500
                                            else salary
                                         end as new_salary
from employees

select last_name, salary, case
                            when salary > 12000 then 'High Salary'
                            when salary > 6000 then 'Normal Salary'
                            else 'Low Salary'
                          end as salary_level
from employees

select last_name, department_id, salary, case department_id
                                            when 60 then salary + 1000
                                            when 30 then salary + 500
                                            when 90 then salary - 500
                                            else salary
                                         end as new_salary
from employees

select last_name, department_id, salary, decode( department_id
                                            , 60 , salary + 1000
                                            , 30 , salary + 500
                                            , 90 , salary - 500
                                            , salary
                                         ) as new_salary
from employees

select last_name, job_id, decode(job_id,
                                   'AD_PRES', 'A',
                                   'ST_MAN', 'B',
                                   'IT_PROG', 'C',
                                   'SA_REP', 'D',
                                   'ST_CLERK', 'E',
                                   '0') as grade
from employees


-------------------- Questions ------------------------
* The HR department wants to find the duration of employment for each employee. 
For each employee, display the last name and calculate the number of months 
between today and the date on which the employee was hired. 
Label the column as MONTHS_WORKED. Order your results by the number of months 
employed.

* Create a query to display the last name and the number of weeks employed 
for all employees in department 90. Label the number of weeks column as TENURE. 
Truncate the number of weeks value to 0 decimal places. Show the records in 
descending order of the employee’s tenure.

* Display each employee’s last name, hire date, and salary review date, 
which is the first Monday after six months of service.

* Using the CASE or decode function, write a query that displays the grade of all
employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0
