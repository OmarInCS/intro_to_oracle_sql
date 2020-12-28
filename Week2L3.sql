************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]
[GROUP BY column|expr, ...]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using Single-Row Functions to Customize Output

	* Characters:
		lower(), upper(), initcap(), trim(), replace()
		length(), substr(), instr(), lpad(), rpad()
	* Numbers:
		round(), trunc(), mod()
	* Dates:
		round(), trunc(), sysdate, current_date,
		months_between(), add_months(),
		last_day(), next_day()
		
	* Conversion:
		to_char(), to_date(), to_number()
		
	* General:
		nvl(), nvl2(), coalesce()
		case, decode()
		
* Reporting Aggregated Data Using the Group Functions
	
	sum(), avg(), max(), min(), count()
	

---------------------- Examples ------------------------


select last_name, department_id, salary, case 
                                            when department_id = 60 then salary + 500
                                            when department_id = 90 then salary - 500
                                            when department_id = 30 then salary + 1000
                                            else salary
                                         end new_salary
from employees

select last_name, department_id, salary, case department_id
                                            when 60 then salary + 500
                                            when 90 then salary - 500
                                            when 30 then salary + 1000
                                            else salary
                                         end new_salary
from employees


select last_name, salary, case 
                            when salary > 12000 then 'High Salary'
                            when salary > 6000 then 'Normal Salary'
                            else 'Low Salary'
                         end salary_level
from employees

select last_name, department_id, salary, decode( department_id
                                                , 60 , salary + 500
                                                , 90 , salary - 500
                                                , 30 , salary + 1000
                                                , salary
                                             ) new_salary
from employees


----------------- Group Functions ------------

select min(hire_date) as first_hire, max(hire_date) as last_hire
from employees

-- SubQuery
--select last_name, min(salary)
--from employees

select min(salary)
from employees

select min(salary)
from employees
where department_id = 60

select sum(salary), round(avg(salary))
from employees

select count(last_name)
from employees

select count(last_name)
from employees
where job_id = 'IT_PROG'

select count(department_id)
from employees

select count(distinct department_id)
from employees

select count(*)
from employees

select department_id, min(salary)
from employees
where department_id is not null and department_id in (60, 100)
group by department_id
order by department_id

select job_id, round(avg(salary)), count(last_name)
from employees
group by job_id

select to_char(hire_date, 'YYYY'), count(last_name)
from employees
group by to_char(hire_date, 'YYYY')


select job_id, count(last_name)
from employees
where job_id = '&job'
group by job_id





-------------------- Questions ------------------------

* Using the DECODE or CASE function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using 
the following data:
Job 		Grade
AD_PRES 	A
ST_MAN 		B
IT_PROG 	C
SA_REP 		D
ST_CLERK 	E
None		0


* Find the highest, lowest, sum, and average salary for each job type. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.

* Write a query to display the number of people with the same job. Generalize the query so that the user in the HR department is prompted for a job id.



