************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
	>, >=, <, <=, =, <>
	expr [NOT] BETWEEN .... AND ....
	expr [NOT] IN (.., .., ..)
	expr [NOT] LIKE '...'
	expr IS [NOT] NULL
	
Logical Operators:
	
	bool-expr  AND  bool-expr
	bool-expr  OR  bool-expr


---------------------- Examples ------------------------


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 100

select last_name, hire_date, job_id, salary, department_id
from employees
where salary > 12000

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = 'IT_PROG'

select last_name, hire_date, job_id, salary, department_id
from employees
where salary between 5000 and 10000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date between '01-JAN-08' and '31-DEC-08'

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in ('ST_CLERK', 'SH_CLERK', 'PU_CLERK')

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id like '%CLERK'

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%08'

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%MAY%'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like 'K%'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '_e%'

select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where commission_pct is null

select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where commission_pct is not null

select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where commission_pct is not null and hire_date like '%08'


select last_name, hire_date, job_id, salary, department_id, commission_pct
from employees
where hire_date like '%08' or hire_date like '%07'

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = 'ST_CLERK'
    or job_id = 'SH_CLERK'
    or job_id = 'PU_CLERK'


select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%08'
order by last_name


select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%08'
order by 2


select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%08'
order by salary desc


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees
order by annual_salary desc


select last_name, hire_date, salary, salary * 12 as annual_salary
from employees
--where annual_salary > 150000 -- alias not allowed here
order by annual_salary desc

select LAST_NAME, JOB_ID, SALARY
from employees
where job_id in ('SA_REP', 'ST_CLERK')
    and salary not in (2500, 3500, 7000)


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