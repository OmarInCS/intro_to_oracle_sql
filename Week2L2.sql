************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column1, ...
FROM table
[WHERE bool-expr [AND|OR bool-expr]]    -- filter rows
[GROUP BY column|expr, ....]
[HAVING bool-expr [AND|OR bool-expr]]   -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace(),
        length(), lpad(), rpad(), substr(), instr()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        sysdate, round(), trunc()
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), avg(), sum(), count()

* Displaying Data from Multiple Tables Using Joins:

    - Inner Join:
        FROM table1 [INNER] JOIN table2 ON bool-expr JOIN table3 ON bool-expr ....


---------------------- Examples ------------------------


select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees

select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, nvl(to_char(manager_id), 'No Mgr.')
from employees

select last_name, salary, commission_pct, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees

select last_name, job_id, department_id, salary, case 
                                                    when department_id = 90 then salary - 500
                                                    when department_id = 60 then salary + 500
                                                    when department_id = 30 then salary + 1000
                                                    else salary
                                                 end as new_salary
from employees


select last_name, salary, case 
                            when salary >= 12000 then 'High Salary'
                            when salary >= 6000 then 'Normal Salary'
                            else 'Low Salary'
                          end as salary_level
from employees


select last_name, job_id, department_id, salary, case department_id
                                                    when 90 then salary - 500
                                                    when 60 then salary + 500
                                                    when 30 then salary + 1000
                                                    else salary
                                                 end as new_salary
from employees


select last_name, job_id, department_id, salary, decode( department_id
                                                    , 90 , salary - 500
                                                    , 60 , salary + 500
                                                    , 30 , salary + 1000
                                                    , salary
                                                 ) as new_salary
from employees


------------------

select max(salary), min(salary)
from employees

select max(hire_date), min(hire_date)
from employees


select sum(salary), round(avg(salary))
from employees


select sum(salary), round(avg(salary))
from employees
where job_id = 'IT_PROG'

--select last_name, sum(salary), round(avg(salary))
--from employees
--where job_id = 'IT_PROG'


select count(last_name)
from employees

select count(commission_pct)
from employees

select count(distinct department_id)
from employees

select count(*)
from employees

select job_id, count(last_name)
from employees
group by job_id

select department_id, count(last_name)
from employees
group by department_id


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
where department_id is not null
group by department_id, job_id
having count(last_name) > 1
order by department_id, job_id

select to_char(hire_date, 'yyyy') as year, count(last_name)
from employees
group by to_char(hire_date, 'yyyy')
having count(last_name) >= 10
order by year


select last_name, salary, sum(salary) over()
from employees

select last_name, salary, job_id, sum(salary) over(partition by job_id)
from employees
--where job_id = 'IT_PROG'

--------------------

select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id


select last_name, salary, job_title, max_salary
from employees e join jobs j
on e.job_id = j.job_id

select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select e.last_name as emp_name, m.last_name as mgr_name
from employees e join employees m
on e.manager_id = m.employee_id
order by e.last_name


select last_name, department_name, job_title
from employees e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id





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

* Create a report to display the manager number and the salary of 
the lowest-paid employee for that manager. 
Exclude anyone whose manager is not known. 
Exclude any groups where the minimum salary is $6,000 or less. 
Sort the output in descending order of salary.

* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

