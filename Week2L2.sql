************ Week 2, Lesson 2 ************** 
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
		months_between(), add_months( , )
		last_day(), next_day( , )
		
	* Conversion:
		to_char(), to_date(), to_number()
		
	* General:
		nvl(), nvl2(), coalesce(),
		case, decode()

---------------------- Examples ------------------------


select last_name, hire_date, salary
from employees
where initcap(last_name) = initcap('&name')

select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 1 2009', 'Mon, DD YYYY')


select last_name, hire_date, salary
from employees
where hire_date > to_date('1/1/2009', 'DD/MM/YYYY')


select last_name, hire_date, salary
from employees
where salary > to_number('&sal', '00,000')


select last_name, hire_date, to_char(salary, '99,999')
from employees
where salary > to_number('&sal', '99,999')

-- YY ==> 2000 - 2099
-- RR ==> 1950 - 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('Jan, 1 95', 'Mon, DD, RR')

select first_name, hire_date
from employees
where hire_date between to_date('2006-06-01', 'YYYY-MM-DD') 
                and to_date('2007-07-30', 'YYYY-MM-DD')

select last_name, hire_date, 
    to_char(next_day(add_months(hire_date, 6), 'Monday'), 
            'fmDay, "the" Ddspth "of" Month, YYYY') as review
from employees

select last_name, salary, commission_pct,
        salary + salary * nvl(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct,
        salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees

select last_name, nvl(to_char(manager_id), 'No Mgr.')
from employees


select last_name, coalesce(to_char(manager_id), 'No Mgr.')
from employees

select last_name, department_id, salary, case
                                            when department_id = 60 then 500
                                            when department_id = 50 then 1000
                                            when department_id = 80 then 700
                                            else 0
                                         end reward
from employees

select last_name, department_id, salary, case department_id
                                            when 60 then 500
                                            when 50 then 1000
                                            when 80 then 700
                                            else 0
                                         end reward
from employees

select last_name, department_id, salary, case 
                                            when salary > 12000 then 'High'
                                            when salary > 6000 then 'Normal'
                                            else 'Low'
                                         end salary_level
from employees

select last_name, department_id, salary, decode( department_id
                                            , 60 , 500
                                            , 50 , 1000
                                            , 80 , 700
                                            , 0
                                         ) reward
from employees





-------------------- Questions ------------------------
* Write a query to get the first name and hire date from employees table where hire date between '2006-06-01' and '2007-07-30' (use the same format)


* Display each employee’s last name, hire date, and salary review date, which  is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in a format that is similar to 
“Monday, the Thirty-First of July, 2000.”


