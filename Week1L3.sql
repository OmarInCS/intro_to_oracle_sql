************ Week 1, Lesson 3 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC], ...]

 
* Using Single-Row Functions to Customize Output

    - Characters:
        upper(), lower(), initcap(), trim(), replace()
        substr(), instr(), length(), lpad(), rpad()

    - Numbers:
        round(), trunc(), mod()

    - Dates:
        round(), trunc(), sysdate
        months_between(), add_months()
        last_day(), next_day()

    - Conversion:
    - General:



---------------------- Examples ------------------------


select *
from hr.employees

select last_name, hire_date, substr(hire_date, 4, 3) as hire_month
                            , 20 || substr(hire_date, 8) as hire_year
from hr.employees

select last_name, hire_date, substr(hire_date, 4, 3) as hire_month
                            , 20 || substr(hire_date, -2) as hire_year
from hr.employees

select last_name, instr(last_name, 'e')
from hr.employees


select last_name, instr(last_name, 'e', 4)
from hr.employees


select last_name, instr(last_name, 'e', 1, 2)
from hr.employees


select rpad(last_name, 15, '-'), lpad(last_name, 15, '-'), length(last_name)
from hr.employees

-- K, Steven
-- K, Neena
-- D, Lex
select substr(last_name, 1, 1) || ', ' || first_name as full_name, length(first_name)
from hr.employees


select round(19.627), round(19.627, 2), round(19.623, 2)
from dual


select trunc(19.627), trunc(19.627, 2), trunc(19.623, 2)
from dual


select last_name, salary * 0.0133, trunc(salary * 0.0133)
from hr.employees


select last_name, salary * 0.0133, trunc(salary * 0.0133, -1)
from hr.employees


select mod(7, 3)
from dual


select mod(11, 3)
from dual


select last_name, hire_date, round(hire_date, 'Month') as start_date
from hr.employees


select last_name, hire_date, trunc(hire_date, 'Month') as start_date
from hr.employees


select last_name, hire_date, round(hire_date, 'Year') as start_date
from hr.employees

select sysdate
from dual


select last_name, hire_date, round(months_between(sysdate, hire_date) / 12) service_years
from hr.employees


select last_name, hire_date, round((sysdate - hire_date) / 365) as service_years
from hr.employees


select last_name, hire_date, hire_date + 3
from hr.employees


select last_name, hire_date, add_months(hire_date, 3) as start_date
from hr.employees


select last_day(sysdate)
from dual

select next_day(sysdate, 'Sunday')
from dual

-- select '20-OCT-21' - sysdate
-- from dual


select employee_id, last_name, salary, round(salary + salary * 15.5 / 100)
from hr.employees


select last_name, round(months_between(sysdate, hire_date)) as months_worked
from hr.employees
order by months_worked


-------------------- Questions ------------------------
* The HR department needs a report to display the employee number, last name, salary, 
and salary increased by 15.5% (expressed as a whole number) for each employee. 
Label the column New Salary.

* The HR department wants to find the duration of employment for each employee. 
For each employee, display the last name and calculate the number of months between today 
and the date on which the employee was hired. Label the column as MONTHS_WORKED. 
Order your results by the number of months employed.
