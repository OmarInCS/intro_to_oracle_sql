************ Week 2, Lesson 1 ************** 
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
	* General:
	

---------------------- Examples ------------------------

select round(27.7), round(27.3)
from dual

select round(27.6666, 2)
from dual

select trunc(27.7), trunc(27.3)
from dual


select trunc(27.6699, 2)
from dual

select last_name, salary, salary * 0.03334
--                , round(salary * 0.03334)
                , trunc(salary * 0.03334, -1)
from employees

select mod(5, 3), mod(7, 3)
from dual

select employee_id, last_name, salary
                    , round(salary + salary * 0.155) as new_salary
                    , round(salary * 1.155) as new_salary
from employees


select sysdate, current_date
from dual

select last_name, hire_date, round(hire_date, 'Month')
from employees


select last_name, hire_date, round(hire_date, 'Year')
from employees


select last_name, hire_date, trunc(hire_date, 'Month')
from employees

select last_name, hire_date
                , round(months_between(sysdate, hire_date) / 12)
from employees

select last_name, hire_date, round(sysdate - hire_date)
from employees

select last_name, hire_date, round(add_months(hire_date, 3), 'Month') as start_date
from employees

select last_day(sysdate)
from dual

select next_day(sysdate, 'Sun')
from dual


select next_day(sysdate, 7)
from dual

select last_name, months_between(sysdate, hire_date) as months_worked
from employees
order by months_worked

select last_name, trunc((sysdate - hire_date) / 7) as tenure
from employees
where department_id = 90
order by tenure desc


-------------------- Questions ------------------------

* The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.





