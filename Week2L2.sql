************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|column|expr
FROM table_name
[WHERE bool-expr]
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
	

---------------------- Examples ------------------------


select length(5000), 20 || ' Employee'
from dual

select last_name, hire_date, department_id, salary
from employees
where department_id = '60'


select last_name, hire_date, department_id, salary
from employees
where hire_date > '01-JAN-08'


select last_name, hire_date, department_id, salary
from employees
where hire_date > '01/01/2008'


select last_name, hire_date, department_id, salary
from employees
where salary > '10,000'


select last_name, to_char(hire_date, 'Day(Dy)DD/Month(Mon)MM/Year (YYYY)')
from employees

select last_name, to_char(hire_date, 'Mon DD, YYYY')
from employees


select to_char(sysdate, 'HH24:MI:SS')
from dual


select last_name, hire_date, to_char(hire_date, 'Ddsp')
from employees


select last_name, hire_date, to_char(hire_date, 'Ddspth "of" Month')
from employees

select last_name, to_char(salary, '00,000.00')
from employees


select last_name, to_char(salary, '$99,999.99')
from employees

select last_name,  to_char(salary, '99,999.99') || ' SAR'
from employees

select last_name, hire_date, department_id, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')

select last_name, hire_date, department_id, salary
from employees
where hire_date between to_date('Jan 01, 2008', 'Mon DD, YYYY') 
                and to_date('Dec 31, 2008', 'Mon DD, YYYY')

-- YY => 2000 - 2099
-- RR => 1950 - 2049
select last_name, hire_date, department_id, salary
from employees
where hire_date > to_date('01/01/97', 'DD/MM/RR')

select last_name, hire_date, department_id, salary
from employees
where salary > to_number('04,000', '00,000')


select last_name, hire_date, department_id, salary
from employees
where salary > to_number('4,000', '99,999')


select last_name, hire_date
        , to_char(next_day(add_months(hire_date, 6), 'Monday'), 
                 'fmDay, "The" Ddspth, "of" Month, YYYY')
from employees

select last_name, salary, commission_pct,
        salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct,
        salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, salary, nvl(to_char(department_id), 'No Dept.')
from employees

select last_name, salary, coalesce(to_char(department_id), 'No Dept.')
from employees


-------------------- Questions ------------------------

* Write a query to get the first name and hire date from employees table where hire date between '2006-06-01' and '2007-07-30' (use the same format)


* Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in a format that is similar to “Monday, the Thirty-First of July, 2000.”





