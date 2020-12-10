************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
	>, <, >=, <=, =, <>, !=, ^=
	between ... and ....
	in (..., ..., ...)
	like '....'
	is [not] null
	
Logical Operators:
	bool-expr and bool-expr
	bool-expr or bool-expr
	not bool-expr


---------------------- Examples ------------------------


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id = 60


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = 'ST_MAN'


select last_name, hire_date, job_id, department_id, salary
from employees
where salary < 3000


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date > '31-DEC-08'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date between '01-JAN-08' and '31-DEC-08'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%08'


select last_name, hire_date, job_id, department_id, salary
from employees
where hire_date like '%JAN%'


select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like 'K%'


select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like '%e%'


select last_name, hire_date, job_id, department_id, salary
from employees
where last_name like '_e%'


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id in (60, 30, 20)


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id in ('ST_MAN', 'PU_MAN', 'SA_MAN')

select last_name, hire_date, job_id, department_id, salary
from employees
where job_id like '%MAN'

select last_name, hire_date, job_id, department_id, salary
from employees
where department_id is null


select last_name, hire_date, job_id, department_id, salary
from employees
where department_id is not null


select last_name, hire_date, salary * 12 as annual_salary
from employees
where salary * 12 > 150000
order by annual_salary desc

select last_name, hire_date, job_id, department_id, salary
from employees
where salary < 4000 and department_id <> 50


select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = 'ST_MAN' or job_id = 'SA_MAN' or job_id = 'PU_MAN'



select last_name, hire_date, job_id, department_id, salary
from employees
where job_id = 'ST_MAN' or job_id = 'SA_MAN'





-------------------- Questions ------------------------
	
* Because of budget issues, the HR department needs 
a report that displays the last name and salary 
of employees who earn more than $12,000.

* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


