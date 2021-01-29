************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


		
* Using Single-Row Functions to Customize Output

	* Characters:
		upper(), lower(), initcap(), trim(), replace()
		substr(), instr(), length(), lpad(), rpad()
		
	* Numbers:
		round(), trunc(), mod()
	
	* Dates:
		round(), trunc(), sysdate
		months_between(), add_months()
		next_day(, last_day()
	
	* Conversion:
		to_char(), to_number(), to_date()
		
	* General:
		nvl(), nvl2(), coalesce()

---------------------- Examples ------------------------


select last_name, hire_date, salary, department_id
from employees
where department_id = '60'


select last_name, 20 || substr(hire_date, -2)
from employees
where department_id = '60'

select last_name, hire_date
                , to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year YYYY')
from employees

select last_name, hire_date
                , to_char(hire_date, 'Ddspth "of" Month YYYY')
from employees

select to_char(sysdate, 'HH24:MI:SS')
from dual

select last_name, salary, to_char(salary, '00,000.00')
from employees


select last_name, salary, to_char(salary, '$99,999.99')
from employees


select last_name, salary, 'SAR' || to_char(salary, '99,999.99')
from employees

select last_name, hire_date, salary
from employees
where hire_date < to_date('22/6/2002', 'DD/MM/YYYY')

select last_name, hire_date, salary
from employees
where hire_date between to_date('May, 19 2002', 'Mon, DD YYYY') 
                and to_date('Jun, 22 2002', 'Mon, DD YYYY')
                
select last_name, hire_date, salary
from employees
where salary > to_number('12,000.00', '00,000.00')


select last_name, hire_date, salary
from employees
where salary > to_number('9,000.00', '99,999.99')

select last_name, salary, commission_pct
                , salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct
                , salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees


select last_name, salary, commission_pct
                , salary + salary * coalesce(commission_pct, 0) as total_salary
from employees

select last_name, nvl(to_char(department_id), 'No Dept.')
from employees


-------------------- Questions ------------------------

* Write a query to get the first name and hire date from employees table where hire date between '2006-06-01' and '2007-07-30' (use the same format)


* Display each employee’s last name, hire date, and salary review date, which is after six months of service. Label the column REVIEW. Format the dates to appear in a format that is similar to “Monday, the Thirty-First of July, 2000.”

* Create a query that displays employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.

