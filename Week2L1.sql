************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using Single-Row Functions to Customize Output:
	- Characters:
		upper(), lower(), initcap(), trim(), replace(),
		substr(), instr(), length(), lpad(), rpad()
	- Numbers:
		round(), trunc(), mod()
	- Dates:
		round(), trunc(), sysdate,
		months_between(), add_months()
		next_day(), last_day()
		
	- Conversion:
		to_char(), to_number(), to_date()
		
	- General:
		nvl(), nvl2(), coalesce()
		case, decode()


* Reporting Aggregated Data Using the Group Functions

	max(), min(), sum(), avg(), count()

---------------------- Examples ------------------------


select last_name, salary, commission_pct
                , salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct, nvl2(commission_pct, 0.1, 0)
                , salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, nvl(to_char(manager_id), 'No Mgr.')
from employees

select last_name, coalesce(to_char(manager_id), 'No Mgr.')
from employees

--select last_name, salary + coalesce(col_1, col_2, col_3, col_4, 0)
--from employees

select last_name, salary + nvl(col_1, 0) + nvl(col_2, 0) + nvl(col_3, 0)
from employees

select last_name, job_id, department_id, salary, case department_id
                                                    when 90 then salary - 500
                                                    when 60 then salary + 1000
                                                    when 100 then salary + 500
                                                    else salary
                                                 end new_salary
from employees


select last_name, department_id, salary, case 
                                            when department_id = 90 then salary - 500
                                            when department_id = 60 then salary + 1000
                                            when department_id = 100 then salary + 500
                                            else salary
                                         end new_salary
from employees

select last_name, department_id, salary, case 
                                            when salary > 12000 then 'High'
                                            when salary > 6000 then 'Normal'
                                            else 'Low'
                                         end salary_level
from employees

select last_name, job_id, department_id, salary, decode( department_id
                                                    , 90 , salary - 500
                                                    , 60 , salary + 1000
                                                    , 100 , salary + 500
                                                    , salary
                                                 ) new_salary
from employees

select last_name, nvl(to_char(salary * commission_pct), 'No Commission') as comm
from employees

select last_name, case 
                    when commission_pct is null then 'No Commission'
                    else to_char(salary * commission_pct)
                  end comm
from employees


--------------- Group Functions ------------

select max(salary), min(salary)
from employees


select max(hire_date), min(hire_date)
from employees

select sum(salary), round(avg(salary))
from employees

select avg(salary)
from employees
where department_id = 60

select count(last_name)
from employees
where department_id = 60


select count(last_name)
from employees


select count(first_name)
from employees


select count(*)
from employees

select count(distinct department_id)
from employees


--select last_name, min(salary)
--from employees

select job_id, min(salary)
from employees
group by job_id

select department_id, count(last_name)
from employees
where department_id is not null
group by department_id

-- Logic Error
--select last_name, min(salary)
--from employees
--group by last_name

select to_char(hire_date, 'YYYY'), count(last_name)
from employees
group by to_char(hire_date, 'YYYY')

select job_id, count(last_name)
from employees
group by job_id

select department_id, count(last_name)
from employees
where department_id is not null
group by department_id
having count(last_name) > 5


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
* Create a query that displays employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.

* Using the CASE or decode function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0


* Find the highest, lowest, sum, and average salary for each job type. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.

* Write a query to display the number of people with the same job. Generalize the query so that the user in the HR department is prompted for a job id.

* Determine the number of managers without listing them. Label the column Number of Managers.


* Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
