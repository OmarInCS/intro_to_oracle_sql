************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT
FROM
[WHERE bool-expr]
[ORDER BY column|expr|alias|number [ASC|DESC]]


* Retriving, Restricting and Sorting data

Math Expr: *, /, +, -
Concat Excpr: ||
Bool-expr:
	>, >=, <, <=, =, <>
	between ... and ...
	in (..., ..., ...)
	like ''
	is [NOT] null

Logical Operators:
	bool-expr and bool-expr
	bool-expr or bool-expr

* Using Single-Row Functions to Customize Output:

	* Characters:
		lower(), upper(), initcap(), trim(), replace(),
		substr(), instr(), length(), lpad(), rpad()
	
	* Numbers:
		round(), trunc(), mod()
		
	* Dates:
		sysdate, current_date, round(), trunc(),
		months_between(), add_months(),
		next_day(), last_day()
		
	* Conversion:
		to_char(), to_date(), to_number()
		
	* General:
		nvl(,), nvl2(,,), coalesce()
		case, decode()
		

---------------------- Examples ------------------------

select last_name, hire_date, salary
from employees
where hire_date > '01-JAN-08'

select last_name, hire_date, salary
from employees
where hire_date > to_date('2008-01-01', 'YYYY-MM-DD')


select last_name, hire_date, salary
from employees
where hire_date between to_date('Jan 1, 2008', 'Mon DD, YYYY') 
                    and to_date('Dec 31, 2008', 'Mon DD, YYYY')

-- YY => 2000 - 2099
-- RR => 1950 - 2049
select last_name, hire_date, salary
from employees
where hire_date > to_date('01/01/95', 'DD/MM/RR')


select last_name, hire_date, salary
from employees
where salary > 12000


select last_name, hire_date, salary
from employees
where salary > to_number('$12,000', '$00,000')


select last_name, hire_date, to_char(salary, '$00,000')
from employees


select last_name, hire_date, salary
from employees
where salary > to_number('&sal', '00,000')


select last_name, hire_date, salary
from employees
where salary > to_number('&sal', '99,999')

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

select last_name, nvl(to_char(manager_id), 'No. MGR')
from employees

select last_name, coalesce(to_char(manager_id), 'No. MGR')
from employees


select last_name, department_id, salary, case 
                                            when department_id = 90 then salary - 500
                                            when department_id = 60 then salary + 500
                                            when department_id = 100 then salary + 250
                                            else salary
                                         end new_salary
from employees
where department_id = &dept


select last_name, department_id, salary, case department_id
                                            when  90 then salary - 500
                                            when 60 then salary + 500
                                            when  100 then salary + 250
                                            else salary
                                         end new_salary
from employees


select last_name, department_id, salary, decode( department_id
                                            ,  90 , salary - 500
                                            , 60 , salary + 500
                                            ,  100 , salary + 250
                                            , salary
                                         ) new_salary
from employees




-------------------- Questions ------------------------
* Write a query to get the first name and hire date from employees table where hire date between '2006-06-01' and '2007-07-30' (use the same format)


* Display each employee’s last name, hire date, and salary review date, which  is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in a format that is similar to “Monday, the Thirty-First of July, 2000.”

* Create a query that displays employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.


* Using the CASE or DECODE function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using 
the following data:
Job 		Grade
AD_PRES 	A
ST_MAN 		B
IT_PROG 	C
SA_REP 		D
ST_CLERK 	E
else		0

