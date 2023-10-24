************ Session 6 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns [AS alias]
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ....]


* Retriving, Restricting and Sorting data

Math Expr: +, -, *, /
Concat Expr: ||
Bool Expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND .....
    IN (..., ..., ...)
    LIKE '.....'
    IS [NOT] NULL

Logical Expr:
    bool-expr AND|OR bool-expr

* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr()

    - Numbers:
        round(), trunc()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(..., ..., ..., ...)
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()


---------------------- Examples ------------------------

Group 1: 18 + 5 + 3 + 10
Group Moshi Mosh: 18 + 13 + 15 + 8


select last_name, department_id, salary, salary + 500 as new_salary
from employees


select last_name, department_id, salary, case
                                            when department_id = 90 then salary - 500
                                            when department_id = 60 then salary + 500
                                            when department_id = 100 then salary + 1000
                                            else salary
                                         end as new_salary
from employees

select last_name, department_id, salary, case
                                            when salary > 12000 then 'High Salary'
                                            when salary > 6000 then 'Normal Salary'
                                            else 'Low Salary'
                                         end as salary_level
from employees

select last_name, department_id, salary, case department_id
                                            when 90 then salary - 500
                                            when 60 then salary + 500
                                            when 100 then salary + 1000
                                            else salary
                                         end as new_salary
from employees

select last_name, department_id, salary, decode( department_id
                                            , 90 , salary - 500
                                            , 60 , salary + 500
                                            , 100 , salary + 1000
                                            , salary
                                         ) as new_salary
from employees


select min(salary), max(salary)
from employees

select min(hire_date), max(hire_date)
from employees

select max(salary)
from employees
where job_id = 'IT_PROG'

-- after subquery
--select last_name, max(salary)
--from employees
--where job_id = 'IT_PROG'


select sum(salary), round(avg(salary))
from employees

select count(last_name)
from employees


select count(commission_pct)
from employees

select count(unique job_id)
from employees


select count(*)
from employees

select job_id, max(salary)
from employees
group by job_id


select department_id, count(last_name)
from employees
group by department_id

select department_id, count(last_name)
from employees
where department_id is not null
group by department_id

select department_id, count(last_name)
from employees
where department_id is not null
group by department_id
having count(last_name) > 5
order by count(last_name) desc

-- to know the department with subquery
select max(count(last_name))
from employees
where department_id is not null
group by department_id


select department_id, job_id, count(last_name)
from employees
where department_id is not null
group by department_id, job_id
having count(last_name) > 5
order by count(last_name) desc

select to_char(hire_date, 'YYYY') as hire_year, count(last_name)
from employees
group by to_char(hire_date, 'YYYY')



-------------------- Questions ------------------------
* Using the CASE or decode function, write a query that displays the grade of all
employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0

* Find the highest, lowest, sum, and average salary for each job type. 
Label the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.

* Determine the number of managers without listing them. 
Label the column Number of Managers.