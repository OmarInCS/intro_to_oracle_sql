************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT * | [DISTINCT|UNIQUE] columns|expr [AS] [alias]
FROM table_name
[WHERE bool-expr]
[ORDER BY column|expr|number|alias [ASC|DESC], ....]


	
* Using Single-Row Functions to Customize Output

	* Characters:
		lower(), upper(), initcap(), trim(), replace(),
		substr(), instr(), length(), lpad(), rpad()
	
	* Numbers:
		round(), trunc(), mod()
		
	* Dates:
		round(), trunc(), sysdate
		months_between(), add_months()
		last_day(), next_day()
		
	* Conversion:
		to_char(), to_date(), to_number()
		
	* General

---------------------- Examples ------------------------

select upper(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'


select upper(last_name), length(last_name)
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M')

select sysdate
from dual

select last_name, hire_date, round(hire_date, 'Month') as start_date
                            , round(hire_date, 'Year')
from employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
                            , trunc(hire_date, 'Year')
from employees

select last_name, hire_date
        , round(months_between(sysdate, hire_date) / 12) as service_period
from employees

select last_name, hire_date, round((sysdate - hire_date) / 365) as service_period
from employees

select last_name, hire_date, add_months(hire_date, 6) as increment_date
from employees

select last_name, hire_date, hire_date + 7 as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual

select last_name, hire_date, next_day( last_day(hire_date), 'Sunday') as first_sal_date
from employees

select last_name, months_between(sysdate, hire_date) as months_worked
from employees
order by months_worked

select last_name, to_char(hire_date, 'Day(Dy) DD/Month(Mon) MM/Year YYYY')
from employees

select to_char(sysdate, 'HH24:MI:SS')
from dual


select to_char(sysdate, 'fmMonth, DD YYYY')
from dual


select last_name, to_char(hire_date, 'fmMonth, Ddspth YYYY')
from employees

select last_name, to_char(salary, '00,000.00')
from employees


select last_name, to_char(salary, '99,999.99')
from employees

select last_name, to_char(salary, '$99,999.99')
from employees


select last_name, 'SAR' || to_char(salary, '99,999.99')
from employees


select to_char(sysdate, 'DD "of" Month')
from dual




-------------------- Questions ------------------------

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.



