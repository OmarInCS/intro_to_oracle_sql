************ Week 2, Lesson 1 ************** 
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
        to_char(), to_date(), to_number()

    - General:
        nvl(), nvl2(), coalesce()



---------------------- Examples ------------------------


select last_name, hire_date, salary
from employees


select last_name, hire_date, salary
from employees
where hire_date > '01-JAN-08'


--select last_name, hire_date, salary
--from employees
--where hire_date > '01/01/2008'


select last_name, to_char(hire_date, 'Day(Dy) DD/Month(Mon) MM/Year YYYY')
from employees

select last_name, to_char(hire_date, 'Month DD, YYYY')
from employees

select to_char(sysdate, 'DD "of" Month HH24:MI:SS')
from dual


select to_char(sysdate, 'Ddsp "of" Month HH24:MI:SS')
from dual



select to_char(hire_date, 'Ddspth "of" Month')
from employees

select last_name, to_char(salary, '00,000.00')
from employees


select last_name, to_char(salary, '99,999.00')
from employees


select last_name, to_char(salary, '$99,999.00')
from employees

select last_name, 'SAR' || to_char(salary, '99,999.00')
from employees


select last_name, 'SAR' || to_char(salary, '99G999D00')
from employees


select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')



select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan 1, 2008', 'Mon DD, YYYY')


select last_name, hire_date, salary
from employees
where salary > to_number('$12,000', '$00,000')


select last_name, hire_date, to_char(next_day(add_months(hire_date, 6), 'Monday')
                                    , 'fmDay, "the" Ddspth "of" Month, YYYY')
                                    
from employees


select first_name, hire_date
from employees
where hire_date between to_date('2006-06-01', 'YYYY-MM-DD') and  to_date('2007-07-30' , 'YYYY-MM-DD')


select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct
from employees
where nvl(commission_pct, 0) <> 0 


select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees


select last_name, nvl(to_char(manager_id), 'No Mgr.') as mgr_id, nvl(to_char(department_id), 'No Dept.') as dept_id
from employees



select last_name, salary, commission_pct, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees


select last_name, nvl(to_char(salary * commission_pct), 'No Commission') as comm
from employees




-------------------- Questions ------------------------
* Display each employee’s last name, hire date, and salary review date, which  is 
the first Monday after six months of service. Label the column REVIEW. 
Format the dates to appear in a format that is similar to 
“Monday, the Thirty-First of July, 2000.”

* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)

* Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” 
Label the column COMM.
