************ Week 2, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM
[WHERE bool-expr]	-- filter rows
[GROUP BY column, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|expr|alias|number [ASC|DESC]]

* Reporting Aggregated Data Using the Group Functions:

	max(), min(), avg(), sum(), count()


---------------------- Examples ------------------------


select max(salary), min(salary)
from employees

select max(hire_date), min(hire_date)
from employees


select sum(salary)
from employees

select round(avg(salary))
from employees
where job_id = 'IT_PROG'

-- Error - Solution => Subquery
--select last_name, min(salary)
--from employees

select count(last_name)
from employees


select count(first_name)
from employees

select count(*)
from employees

select count(unique job_id)
from employees


select round(avg(salary))
from employees
where job_id = 'IT_PROG'


select job_id, round(avg(salary))
from employees
group by job_id


select department_id, count(last_name)
from employees
where department_id is not null
group by department_id

select to_char(hire_date, 'yyyy'), count(last_name)
from employees
group by to_char(hire_date, 'yyyy')
order by 1

select department_id, manager_id, count(last_name)
from employees
where department_id is not null
group by department_id, manager_id
order by department_id, manager_id


select to_char(hire_date, 'yyyy'), count(last_name)
from employees
where to_char(hire_date, 'yyyy') > 2003
group by to_char(hire_date, 'yyyy')
order by 1

select to_char(hire_date, 'yyyy'), count(last_name)
from employees
group by to_char(hire_date, 'yyyy')
having count(last_name) > 6
order by 1


select department_id, manager_id, count(last_name)
from employees
where department_id is not null and manager_id is not null
group by department_id, manager_id
having count(last_name) > 1
order by department_id, manager_id





-------------------- Questions ------------------------
* Find the highest, lowest, sum, and average salary for each job type. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.

* Write a query to display the number of people with the same job. Generalize the query so that the user in the HR department is prompted for a job id.

* Determine the number of managers without listing them. Label the column Number of Managers.


* Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.

