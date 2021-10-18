************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

 
* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()


* Reporting Aggregated Data Using the Group Functions

    max(), min(), avg(), sum(), count()

---------------------- Examples ------------------------



select last_name, department_id, job_id, salary, salary + 500
from employees


select last_name, department_id, job_id, salary, case 
                                                    when department_id = 90 then salary - 500
                                                    when department_id = 60 then salary + 1000
                                                    when department_id = 30 then salary + 500
                                                    else salary
                                                 end new_salary
from employees


select last_name, department_id, job_id, salary, case 
                                                    when salary > 12000 then 'High'
                                                    when salary > 6000 then 'Normal'
                                                    else 'Low'
                                                 end salary_level
from employees


select last_name, department_id, job_id, salary, case department_id
                                                    when 90 then salary - 500
                                                    when 60 then salary + 1000
                                                    when 30 then salary + 500
                                                    else salary
                                                 end new_salary
from employees



select last_name, department_id, job_id, salary, decode( department_id
                                                    , 90 , salary - 500
                                                    , 60 , salary + 1000
                                                    , 30 , salary + 500
                                                    , salary
                                                 ) new_salary
from employees



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


select count(commission_pct)
from employees
where department_id = 60


select count(*)
from employees
where department_id = 60

select count(distinct department_id)
from employees


--select last_name, min(salary)
--from employees


select job_id, min(salary)
from employees
group by job_id


select department_id, round(avg(salary))
from employees
group by department_id

select to_char(hire_date, 'YYYY') as hire_year, count(last_name)
from employees
group by to_char(hire_date, 'YYYY')


select department_id, job_id, count(last_name)
from employees
group by department_id, job_id
order by department_id, job_id


select department_id, job_id, count(last_name)
from employees
where department_id is not null
group by department_id, job_id
order by department_id, job_id


select department_id, job_id, count(last_name)
from employees
where department_id is not null -- and count(last_name) > 1
group by department_id, job_id
having count(last_name) > 1
order by department_id, job_id


select count(distinct manager_id) as "Number Of Managers"
from employees




-------------------- Questions ------------------------

* Using the CASE or decode function, write a query that displays the grade of 
all employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0

* Find the highest, lowest, sum, and average salary for each job type. Label 
the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.

* Write a query to display the number of people with the same manager. 

* Determine the number of managers without listing them. 
Label the column Number of Managers.
