************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...., ...]
[HAVING bool-expr]  -- filter groups
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
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    max(), min(), sum(), avg(), count()

---------------------- Examples ------------------------


select max(salary), min(salary)
from employees

select max(hire_date), min(hire_date)
from employees

select sum(salary), round(avg(salary))
from employees

select sum(salary), round(avg(salary))
from employees
where department_id = 60

select count(last_name)
from employees
where department_id = 60


select count(last_name)
from employees


select count(commission_pct)
from employees

select count(distinct department_id)
from employees

--select last_name, min(salary)
--from employees

select count(*)
from employees

select job_id, count(last_name)
from employees
group by job_id

select department_id, round(avg(salary))
from employees
where department_id is not null
group by department_id

select to_char(hire_date, 'yyyy'), count(last_name)
from employees
where to_char(hire_date, 'yyyy') > 2005
group by to_char(hire_date, 'yyyy')
order by to_char(hire_date, 'yyyy')

select department_id, round(avg(salary))
from employees
where department_id is not null
group by department_id
having avg(salary) > 5000


select to_char(hire_date, 'yyyy'), job_id, count(last_name)
from employees
group by to_char(hire_date, 'yyyy'), job_id
order by to_char(hire_date, 'yyyy')


select department_id, job_id, sum(salary), count(last_name)
from employees
where department_id is not null
group by department_id, job_id
order by department_id, job_id

select max(count(last_name))
from employees
group by to_char(hire_date, 'yyyy')
order by to_char(hire_date, 'yyyy')

select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc







-------------------- Questions ------------------------
* Find the highest, lowest, sum, and average salary for each job type. 
Label the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.

* Determine the number of managers without listing them. 
Label the column Number of Managers.

* Create a report to display the manager number and the salary of 
the lowest-paid employee for that manager. 
Exclude anyone whose manager is not known. 
Exclude any groups where the minimum salary is $6,000 or less. 
Sort the output in descending order of salary.