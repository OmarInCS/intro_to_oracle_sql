************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|number|alias [ASC|DESC], ....]


	
* Using Single-Row Functions to Customize Output

	* Characters:
		lower(), upper(), initcap(), trim(), replace(),
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
		nvl(), nvl2(), coalesce(),
		case, decode()
		

* Reporting Aggregated Data Using the Group Functions
	
	max(), min(), sum(), count(), avg()

---------------------- Examples ------------------------


select last_name, nvl(to_char(commission_pct * salary), 'No Commission') as comm
from employees

select max(salary)
from employees

-- Error
--select last_name, min(salary)
--from employees

select min(hire_date) as first_hire, max(hire_date) as last_hire
from employees

select sum(salary), avg(salary)
from employees

select count(last_name)
from employees


select count(last_name)
from employees
where job_id = 'IT_PROG'


select count(first_name)
from employees


select count(*)
from employees


select count(distinct department_id)
from employees

select job_id, count(last_name)
from employees
group by job_id

select department_id, round(avg(salary))
from employees
where department_id is not null
group by department_id

select to_char(hire_date, 'YYYY'), count(last_name)
from employees
--where count(last_name) > 10
group by to_char(hire_date, 'YYYY')
having count(last_name) > 10



select department_id, round(avg(salary))
from employees
where department_id is not null
group by department_id
having avg(salary) > 6000

select department_id, job_id, round(avg(salary))
from employees
where department_id is not null
group by department_id, job_id
having avg(salary) > 6000
order by department_id, job_id


-- Error
--select department_id, max(round(avg(salary)))
--from employees
--where department_id is not null
--group by department_id

select max(round(avg(salary)))
from employees
where department_id is not null
group by department_id




-------------------- Questions ------------------------

* Create a query that displays employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.


* Using the CASE or DECODE function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using 
the following data:
Job 		Grade
AD_PRES 	A
ST_MAN 		B
IT_PROG 	C
SA_REP 		D
ST_CLERK 	E
else		0

* Determine the number of managers without listing them. Label the column Number of Managers.


* Find the highest, lowest, sum, and average salary for each job type. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.


* Write a query to display the number of people with the same job. Generalize the query so that the user in the HR department is prompted for a job id.


* Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
