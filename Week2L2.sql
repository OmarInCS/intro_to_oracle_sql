************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table
[WHERE bool-expr [AND|OR bool-expr ...]]
[GROUP BY column|expr, ...]
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Bool Expression:
    >, >=, <, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ....)
    LIKE '.....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc(),
        months_between(), add_months( , 3),
        last_day(), next_day( , )

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()


* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()



---------------------- Examples ------------------------


select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees

select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, hire_date, nvl(to_char(department_id), 'No Dept.')
from employees

select last_name, salary, commission_pct, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees

---------------------

select last_name, department_id, salary, case
                                            when department_id = 30 then salary + 1000
                                            when department_id = 60 then salary + 500
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
                                            when 30 then salary + 1000
                                            when 60 then salary + 500
                                            when 90 then salary - 500
                                            else salary
                                         end as new_salary
from employees

select last_name, department_id, salary, decode( department_id
                                            , 30 , salary + 1000
                                            , 60 , salary + 500
                                            , 90 , salary - 500
                                            , salary
                                         ) as new_salary
from employees

---------------------

select max(salary), min(salary)
from employees

select max(hire_date), min(hire_date)
from employees

select sum(salary), round(avg(salary))
from employees

select sum(salary), round(avg(salary))
from employees
where department_id = 60


--select last_name, min(salary)
--from employees

select count(last_name)
from employees

select count(commission_pct)
from employees

select count(*)
from employees


select count(nvl(commission_pct, 0))
from employees

select count(distinct department_id)
from employees

select job_id, round(avg(salary))
from employees
group by job_id

select department_id, count(last_name)
from employees
group by department_id

select to_char(hire_date, 'yyyy'), count(last_name)
from employees
group by to_char(hire_date, 'yyyy')




-------------------- Questions ------------------------

* Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” 
Label the column COMM.

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
