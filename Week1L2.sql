************ Week 1, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Retriving, Restricting and Sorting data


Math operators: *, /, +, -
Concat Operator: ||
Bool-expr:
	>, <, >=, <=, =, <>
	between .... and ....
	in (..., .., ...)
	like ''
	is [not] null
	
Logical Operators:

	bool-expr and bool-expr
	bool-expr or bool-expr
	not bool-expr


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

---------------------- Examples ------------------------


accept sal prompt 'Enter the min. salary:'
define sal = 12000

select last_name, hire_date, job_id, salary
from employees
where salary > &sal

undefine sal

select upper(last_name), lower(hire_date), initcap(job_id), salary
from employees


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = upper('&job')

select trim('      Hello World    ')
from dual


select replace('      Hello World    ', ' ', '-')
from dual


select replace('      Hello World    ', ' ', '')
from dual


select last_name, hire_date, job_id, salary
from employees
where upper(job_id) = trim(upper('&job'))


select 12
from employees


select last_name, hire_date, job_id, replace(job_id, 'MAN', 'MGR'), salary
from employees


select last_name, hire_date
                , substr(hire_date, 4, 3) as hire_month
                , substr(hire_date, 4) as hire_month
                , 20 || substr(hire_date, 8) as hire_year
                , 20 || substr(hire_date, -2) as hire_year
from employees

select last_name, instr(last_name, 'e')
from employees


select last_name, instr(last_name, 'e', 3)
from employees


select last_name, instr(last_name, 'e', 1, 2)
from employees

select upper(last_name), length(last_name)
from employees
Where last_name like 'A%' or last_name like 'J%' or last_name like 'M%'


select upper(last_name), length(last_name)
from employees
Where substr(last_name, 1, 1) in ('A', 'J', 'M')

select rpad(last_name, 15, '-'), lpad(last_name, 15, '-')
from employees

select round(27.7), round(27.3)
from dual

select trunc(27.7), trunc(27.3)
from dual


select round(27.66666, 2)
from dual

select last_name, salary, salary * 0.013 as incr_amount
                        , trunc(salary * 0.013) as incr_amount
                        , trunc(salary * 0.013, -1) as incr_amount
from employees

select mod(7, 3)
from dual


select mod(11, 3)
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from employees


select last_name, hire_date, trunc(hire_date, 'Year') as start_date
from employees

desc employees

select sysdate
from dual

select last_name, round(months_between(sysdate, hire_date) / 12)
from employees

select last_name, round(sysdate - hire_date)
from employees

select last_name, hire_date, add_months(hire_date, 3)
from employees


select last_name, hire_date, hire_date + 7
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Friday')
from dual


--------------- Conversion ---------------

select last_name, hire_date, salary, department_id
from employees
where department_id = '90'


select last_name, hire_date, 20 || substr(hire_date, -2)
from employees
where department_id = '90'

select last_name, hire_date, salary
from employees
where hire_date > '01-JAN-08'


select last_name, hire_date, salary
from employees
where hire_date > '01/01/2008'

select to_char(hire_date, 'DD(Day)Dy/MM(Month)Mon/Year YYYY')
from employees

select to_char(sysdate, 'HH24:MI:SS')
from dual

select to_char(hire_date, 'Mon, DD YYYY')
from employees


select to_char(hire_date, 'Ddspth "of" Month')
from employees

select last_name, to_char(salary, '$00,000.00')
from employees


select last_name, to_char(salary, 'L00G000D00')
from employees


select last_name, to_char(salary, '$99,999.00')
from employees

select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')


select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 2008', 'Mon, DD YYYY')


select last_name, hire_date, salary
from employees
where salary > to_number('$9,000', '$99,999')

-- YY => 2000 -> 2099
-- RR => 1950 -> 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 01 97', 'Mon, DD RR')




-------------------- Questions ------------------------
* Write a query that displays the last name (with all letters in uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.


* The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.

* The HR department wants to find the duration of employment for each employee. For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column as MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.

* Write a query to get the first name and hire date from employees table where hire date between '2006-06-01' and '2007-07-30' (use the same format)
