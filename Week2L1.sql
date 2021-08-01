************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr]
[ORDER BY column|number|expr|alias [ASC|DESC]]

* Retriving, Restricting and Sorting data

* Using Single-Row Functions to Customize Output

    - CHARACTERS:
        upper(), lower(), initcap(), trim(), replace(),
        substr(), instr(), lenght(), lpad(), rpad()

    - NUMBERS:
        round(), trunc(), mod()

    - DATES:
        round(), trunc(), sysdate
        months_between(), add_months()
        last_day(), next_day()

    - CONVERSION:
        to_char(), to_date(), to_number()

        YY => 2000 - 2099
        RR => 1950 - 2049

    - GENERAL:
        nvl(), nvl2(), coalesce()



---------------------- Examples ------------------------


select last_name, hire_date, job_id
from employees


select last_name, hire_date, job_id
from employees
where hire_date > '01-JAN-08'


select last_name, hire_date, job_id
from employees
where hire_date > '01/01/2008'


select last_name, hire_date, job_id, salary
from employees
where salary > '12,000'

select hire_date, to_char(hire_date, 'Day(Dy) DD/Month(Mon) MM/Year YYYY')
from employees

select to_char(sysdate, 'fmMonth DD, YYYY - HH24:MI:SS')
from dual

select to_char(hire_date, 'Month Ddsp, YYYY')
from employees


select to_char(hire_date, 'Month Ddspth, YYYY')
from employees

select last_name, to_char(salary, '00,000.00')
from employees


select last_name, to_char(salary, '99,999.99')
from employees


select last_name, to_char(salary, '999.99')
from employees


select last_name, to_char(salary, '$99,999.99')
from employees



select to_char(sysdate, '"D:" Month DD, YYYY "T:" HH24:MI:SS')
from dual


select last_name, hire_date, to_char(next_day(add_months(hire_date, 6), 'Monday')
                                    , 'fmDay, "the" Ddspth "of" Month, yyyy') as review
from employees


select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/2008', 'DD/MM/YYYY')

select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan 01, 2008', 'Mon DD, YYYY')


select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan 01, 97', 'Mon DD, RR')

accept sal prompt 'Enter salary with format 00,000'

select last_name, hire_date, salary
from employees
where salary > to_number('&sal', '99,999')

undefine sal


select first_name, hire_date
from employees
where hire_date between to_date('2006-06-01', 'YYYY-MM-DD') and to_date('2007-07-30', 'YYYY-MM-DD')

select first_name, hire_date
from employees
where hire_date between to_date('2006-06-01', 'fxYYYY,MM,DD') and to_date('2007-07-30', 'YYYY-MM-DD')


select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, nvl(to_char(department_id), 'No. Dept')
from employees


select last_name, salary, commission_pct, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees



-------------------- Questions ------------------------

* Display each employee’s last name, hire date, and salary review date, which  is the first Monday after six months 
of service. Label the column REVIEW. Format the dates to appear in a format that is similar to 
“Monday, the Thirty-First of July, 2000.”

* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (use the same format)