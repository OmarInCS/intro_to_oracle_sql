************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


SELECT columns|*
FROM table_name
[WHERE bool-expr [AND|OR bool-expr ....]]   -- filter rows
[GROUP BY column1, ....]
[HAVING bool-expr [AND|OR bool-expr ....]]  -- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ....]

* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE '....'
    IS [NOT] NULL


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), length(),
        trim(), replace(), substr(), instr(),
        rpad(), lpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate,
        months_between(), add_months(),
        last_day(), next_day()

    - Conversion:
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    max(), min(), sum(), avg(), count()





---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary
from employees
where hire_date > '01-JAN-07'

--select last_name, hire_date, job_id, salary
--from employees
--where hire_date > 'Jan, 01 2007'

select last_name, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year YYYY')
from employees

select last_name, to_char(hire_date, 'Ddspth "of" Month')
from employees

select to_char(sysdate, 'fmMonth DD, HH24:MI:SS')
from dual

select last_name, to_char(salary, '$00,000.00')
from employees

select last_name, to_char(salary, '$99,999.99')
from employees

select last_name, 'SAR' || to_char(salary, '99,999.99')
from employees

select last_name, 'SAR' || to_char(salary, '999')
from employees


select last_name, hire_date, job_id, salary
from employees
where hire_date > to_date('Jan, 01 2007', 'Mon, DD YYYY')

select last_name, hire_date, job_id, salary
from employees
where hire_date between to_date('2007, 01 Jan', 'YYYY, DD Mon') and to_date('2007, 31 Dec', 'YYYY, DD Mon')


-- YY => 2000 - 2099
-- RR => 1950 - 2049
select last_name, hire_date, job_id, salary
from employees
where hire_date > to_date('Jan, 01 97', 'Mon, DD RR')

select last_name, hire_date, job_id, salary
from employees
where salary > to_number('$12,000', '$99,999')

select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees

select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees


select last_name, nvl(to_char(department_id), 'No Dept.')
from employees


select last_name, salary, commission_pct, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees

select last_name, nvl(to_char(commission_pct * salary), 'No Commission.') as comm
from employees

select last_name, salary, department_id, case
                                            when department_id = 90 then salary - 500
                                            when department_id = 60 then salary + 500
                                            when department_id = 30 then salary + 1000
                                            else salary
                                         end as new_salary
from employees


select last_name, salary, case 
                            when salary > 12000 then 'High Salary'
                            when salary > 6000 then 'Normal Salary'
                            else 'Low Salary'
                          end as salary_level
from employees


select last_name, salary, department_id, case department_id
                                            when 90 then salary - 500
                                            when 60 then salary + 500
                                            when 30 then salary + 1000
                                            else salary
                                         end as new_salary
from employees


select last_name, salary, department_id, decode( department_id
                                                , 90 , salary - 500
                                                , 60 , salary + 500
                                                , 30 , salary + 1000
                                                , salary
                                             ) as new_salary
from employees


select last_name, job_id, case job_id
                            when 'AD_PRES' then 'A'
                            when 'ST_MAN' then 'B'
                            when 'IT_PROG' then 'C'
                            when 'SA_REP' then 'D'
                            when 'ST_CLERK' then 'E'
                            else '0'
                          end as grade
from employees


----------------------

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

select count(distinct job_id)
from employees

select count(*)
from employees

select job_id, count(last_name)
from employees
group by job_id

select department_id, round(avg(salary))
from employees
group by department_id

select department_id, manager_id, count(last_name)
from employees
group by department_id, manager_id
order by department_id, manager_id

select department_id, manager_id, count(last_name)
from employees
where department_id is not null and manager_id is not null
group by department_id, manager_id
order by department_id, manager_id

select department_id, manager_id, count(last_name)
from employees
where department_id is not null and manager_id is not null -- and count(last_name) > 1
group by department_id, manager_id
having count(last_name) > 1
order by department_id, manager_id


select to_char(hire_date, 'YYYY'), count(last_name)
from employees
group by to_char(hire_date, 'YYYY')
having count(last_name) > 10


select max(count(last_name))
from employees
group by to_char(hire_date, 'YYYY')


select job_id, max(salary) as Max, min(salary) as Min, sum(salary) as Sum, round(avg(salary)) as Average
from employees
group by job_id

select count(distinct manager_id) as "Number of Managers"
from employees

select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc






-------------------- Questions ------------------------


* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the Thirty-First of July, 2000.”

* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)


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
