************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]   -- filter rows
[GROUP BY column|expr, ..., ...]
[HAVING bool-expr]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

* Using Single-Row Functions to Customize Output

    - CHARACTERS:
        upper(), lower(), initcap(), trim(), replace(),
        substr(), instr(), lenght(), lpad(), rpad()

    - NUMBERS:
        round(), trunc(), mod()

    - DATES:
        round(), trunc(), sysdate
        months_between(), add_months()
        last_day(), next_day()

    - CONVERSION:
        to_char(), to_date(), to_number()

        YY => 2000 - 2099
        RR => 1950 - 2049

    - GENERAL:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions

    min(), max(), avg(), sum(), count()


---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary, case job_id
                                                when 'IT_PROG' then salary + 2000
                                                when 'FI_ACCOUNT' then salary + 1000
                                                when 'ST_MAN' then salary + 500
                                                else salary
                                             end new_salary
from employees


select last_name, hire_date, job_id, salary, case 
                                                when job_id = 'IT_PROG' then salary + 2000
                                                when job_id = 'FI_ACCOUNT' then salary + 1000
                                                when job_id = 'ST_MAN' then salary + 500
                                                else salary
                                             end new_salary
from employees

select last_name, hire_date, job_id, salary, case
                                                when salary > 12000 then 'High Salary'
                                                when salary > 6000 then 'Normal Salary'
                                                else 'Low Salary'
                                             end salary_level
from employees


select last_name, hire_date, job_id, salary, decode( job_id
                                                , 'IT_PROG' , salary + 2000
                                                , 'FI_ACCOUNT' , salary + 1000
                                                , 'ST_MAN' , salary + 500
                                                , salary
                                             ) new_salary
from employees


-----------------

select max(salary), min(salary)
from employees

select max(hire_date), min(hire_date)
from employees

--select last_name, min(salary)
--from employees

select sum(salary), round(avg(salary))
from employees

select avg(salary), max(salary)
from employees
where job_id = 'IT_PROG'

select count(last_name)
from employees


select count(distinct department_id), count(distinct job_id)
from employees


select count(*)
from employees


select distinct job_id
from employees


select job_id, round(avg(salary)), max(salary)
from employees
group by job_id

select department_id, count(last_name)
from employees
where department_id is not null
group by department_id

select to_char(hire_date, 'YYYY'), count(last_name)
from employees
group by to_char(hire_date, 'YYYY')


select to_char(hire_date, 'YYYY'), count(last_name)
from employees
where to_char(hire_date, 'YYYY') > 2004
group by to_char(hire_date, 'YYYY')
having count(last_name) > 15


select department_id, count(last_name)
from employees
where department_id is not null
group by department_id
having count(last_name) > 10


select department_id, manager_id, count(last_name)
from employees
where department_id is not null
group by department_id, manager_id
order by department_id, manager_id


select max(count(last_name))
from employees
where department_id is not null
group by department_id





-------------------- Questions ------------------------

* Using the CASE or DECODE function, write a query that displays the grade of all employees 
based on the value of the JOB_ID column, using 
the following data:
Job 		Grade
AD_PRES 	A
ST_MAN 		B
IT_PROG 	C
SA_REP 		D
ST_CLERK 	E
else		0

* Determine the number of managers without listing them. Label the column Number of Managers.

* Find the highest, lowest, sum, and average salary for each job type. 
Label the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.

* Write a query to display the number of people with the same job. 
Generalize the query so that the user in the HR department is prompted for a job id.

* Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
