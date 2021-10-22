************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ..., ...]
[OFFSET offset ROWS]
[FETCH NEXT row_count ROWS ONLY]


* Retriving, Restricting and Sorting data

Math operators: *, /, +, -
Concat Operator: ||
Comparison Operators:
    >, >=, <, <=, =, <>
    BETWEEN .... AND ....
    IN (..., .., ...)
    LIKE '....'
    IS [NOT] NULL

Logical Operators:
    bool-expr AND bool-expr
    bool-expr OR bool-expr  
    NOT bool-expr


* Using Single-Row Functions to Customize Output

    - Characters:
        lower(), upper(), initcap(), trim(), replace()
        length(), substr(), instr(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
    - Conversion:
    - General:

---------------------- Examples ------------------------


select last_name, salary, commission_pct, salary + salary * commission_pct as total_salary
from employees

select last_name, hire_date, job_id, salary, department_id
from employees
where salary >= 12000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date < '01-JAN-03'

select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 30

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = 'IT_PROG'

select last_name, hire_date, job_id, salary, department_id
from employees
where salary between 5000 and 10000

select last_name, hire_date, job_id, salary, department_id
from employees
where salary in (5000, 7000, 13000)

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date between '01-JAN-03' and '31-DEC-04'

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id in ('ST_MAN', 'SA_REP')

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like 'A%'

select last_name, hire_date, job_id, salary, department_id
from employees
where job_id like '%MAN'


select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%08'

select last_name, hire_date, job_id, salary, department_id
from employees
where last_name like '_e%'


--select last_name, hire_date, job_id, salary, department_id
--from employees
--where commission_pct <> null

select last_name, hire_date, job_id, salary, department_id
from employees
where commission_pct is not null


select distinct department_id
from employees

select unique department_id
from employees


select last_name, hire_date, job_id, salary, department_id
from employees
where salary < 5000 or salary > 12000

select last_name, hire_date, job_id, salary, department_id
from employees
where hire_date like '%08' or salary > 12000


select last_name, hire_date, job_id, salary, department_id
from employees
where department_id = 50 and salary > 5000


select last_name, hire_date, job_id, salary, department_id
from employees
where job_id = 'ST_MAN' or job_id = 'SA_MAN'


select last_name, hire_date, job_id, salary, department_id
from employees
order by last_name


select last_name, hire_date, job_id, salary, department_id
from employees
order by 1


select last_name, hire_date, job_id, salary, department_id
from employees
order by salary desc


select last_name, hire_date, job_id, salary, department_id
from employees
order by salary desc, hire_date


select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
order by salary * 12 desc



--select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
--from employees
--where annual_salary > 150000   -- Error
--order by annual_salary desc


select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
where salary * 12 > 150000
order by annual_salary desc



select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
order by last_name
fetch next 5 rows only


select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
order by last_name
offset 5 rows
fetch next 5 rows only



select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
offset 5 rows
fetch next 5 rows only


select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
where last_name like '%ae%' and salary between &sal1 and &sal2


select last_name, hire_date, job_id, salary, department_id, salary * 12 as annual_salary
from employees
where last_name like '%&query%' 

select last_name, hire_date, salary &more_cols
from employees



select last_name, hire_date, salary &&more_cols
from employees

undefine more_cols

define low_sal = 7000
select last_name, hire_date, salary
from employees
where salary > &low_sal


select upper(last_name), lower(hire_date), initcap(job_id), salary
from employees


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = upper('&job')


select *
from dual

select trim('    Hello    '), replace('    Hello    ', ' ', '-')
from dual


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))


select last_name, hire_date, replace(job_id, 'MAN', 'MGR'), salary
from employees


select last_name, hire_date, substr(hire_date, 4, 3)  as hire_month
                            , 20 || substr(hire_date, 8)  as hire_year
from employees


select last_name, hire_date, substr(hire_date, 4, 3)  as hire_month
                            , 20 || substr(hire_date, -2)  as hire_year
from employees


select last_name, instr(last_name, 'e')
from employees


select last_name, instr(last_name, 'e', 4)
from employees



select last_name, instr(last_name, 'e', 1, 3)
from employees


select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees



select rpad(last_name, 1, '-'), lpad(last_name, 1, '-')
from employees


select round(19.6257), round(19.6257, 2), round(19.6237, 2)
from dual


select trunc(19.6257), trunc(19.6257, 2), trunc(19.6237, 2)
from dual


select last_name, hire_date, salary, salary * 0.01334, trunc(salary * 0.01334)
from employees


select last_name, hire_date, salary, salary * 0.01334, round(salary * 0.01334)
from employees


select last_name, hire_date, salary, salary * 0.01334, trunc(salary * 0.01334, -1)
from employees


select mod(7, 3)
from dual


select mod(11, 3)
from dual



select last_name, hire_date, salary 
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M') 
order by last_name















-------------------- Questions ------------------------
* The HR department wants a query to display all 
unique job IDs from the EMPLOYEES table.

* Because of budget issues, the HR department needs 
a report that displays the last name and salary 
of employees who earn more than $12,000.

* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.


* Create a report to display the last name, salary, and commission of all 
employees who earn commissions. Sort the data in descending order of salary 
and commissions. Use the column’s numeric position in the ORDER BY clause.

* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.

* The HR department needs a report to display the employee number, last name, 
salary, and salary increased by 15.5% (expressed as a whole number) for each 
employee. Label the column New Salary.