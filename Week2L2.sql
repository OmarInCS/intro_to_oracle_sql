************ Week 2, Lesson 2 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *|columns
FROM table_name
[WHERE bool-expr [AND|OR bool-expr]]    --- filter rows
[GROUP BY column|expr]
[HAVING bool-expr [AND|OR bool-expr]]   --- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC]]


* Retriving, Restricting and Sorting data

Math Operators: *, /, +, -
Concat Operator: ||
Bool-expr:
    >, <, >=, <=, =, <>, !=, ^=
    BETWEEN .... AND ....
    IN (..., ..., ...)
    LIKE 'pattern'
    IS [NOT] NULL

* Using Single-Row Functions to Customize Output

    * Characters:
        upper(), lower(), initcap(), trim(), replace()
        length(), lpad(), rpad(), substr(), instr()

    * Numbers:
        round(), trunc(), mod()

    * Dates:
        round(), trunc(), sysdate,
        months_between(), add_months()
        last_day(), next_day()

    * Conversion:
        to_char(), to_date(), to_number()

    * General:
        nvl(), nvl2(), coalesce(),
        case, decode()

* Reporting Aggregated Data Using the Group Functions:

    min(), max(), sum(), avg(), count()


* Displaying Data from Multiple Tables Using Joins:

    * FROM table1 [INNER] JOIN table2 ON bool-expr
    * FROM table1 [INNER] JOIN table2 USING (column1, column2, ...)
    * FROM table1 NATURAL JOIN table2
    
    * FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON bool-expr



---------------------- Examples ------------------------



select last_name, salary, commission_pct, salary + salary * nvl(commission_pct, 0) as total_salary
from employees

select last_name, salary, commission_pct, salary + salary * nvl2(commission_pct, 0.1, 0) as total_salary
from employees


select last_name, nvl(to_char(manager_id), 'No MGR')
from employees

select last_name, nvl2(to_char(manager_id), 'Has MGR', 'No MGR')
from employees


select last_name, coalesce(to_char(manager_id), 'No MGR')
from employees


select last_name, coalesce(commission_pct, manager_id, department_id)
from employees


select last_name, department_id, salary, case 
                                            when department_id = 60 then salary + 500
                                            when department_id = 90 then salary - 500
                                            when department_id = 30 then salary + 1000
                                            else salary
                                         end as new_salary
from employees


select last_name, department_id, salary, case 
                                            when salary > 12000 then 'High Salary'
                                            when salary > 6000 then 'Normal Salary'
                                            else 'Low Salary'
                                         end as salary_level
from employees


select last_name, department_id, salary, decode( department_id
                                            , 60 , salary + 500
                                            , 90 , salary - 500
                                            , 30 , salary + 1000
                                            , salary
                                         ) as new_salary
from employees


select sysdate
from employees

select min(salary)
from employees

select length(last_name)
from employees


select min(salary), max(salary)
from employees

select min(hire_date), max(hire_date)
from employees

select sum(salary), round(avg(salary))
from employees


select sum(salary), round(avg(salary))
from employees
where department_id = 60


--select last_name, min(salary)
--from employees

select count(last_name)
from employees

select count(commission_pct)
from employees


select count(*)
from employees

select count(distinct department_id)
from employees

select department_id, sum(salary), round(avg(salary))
from employees
group by department_id

select job_id, count(last_name)
from employees
group by job_id
order by count(last_name) desc

select to_char(hire_date, 'yyyy'), count(last_name)
from employees
group by to_char(hire_date, 'yyyy')


select department_id, job_id, count(last_name)
from employees
group by department_id, job_id
order by department_id, count(last_name) desc

select department_id, job_id, count(last_name)
from employees
where department_id in (30, 50, 80)
group by department_id, job_id
order by department_id, count(last_name) desc

select department_id, job_id, count(last_name)
from employees
group by department_id, job_id
having count(last_name) >= 5
order by department_id, count(last_name) desc

select department_id, job_id, count(last_name)
from employees
where department_id in (30, 50, 80)
group by department_id, job_id
having count(last_name) >= 5
order by department_id, count(last_name) desc

select manager_id, min(salary)
from employees
group by manager_id


select last_name, department_name
from employees e join departments d
on e.department_id = d.department_id

select last_name, job_title, min_salary, salary
from employees e join jobs j
on e.job_id = j.job_id


select e.last_name as emp_name, department_name, m.last_name as mgr_name
from employees e join departments d
on e.department_id = d.department_id
join employees m
on d.manager_id = m.employee_id


select e.last_name as emp_name, m.last_name as mgr_name
from employees e join employees m
on e.manager_id = m.employee_id
order by e.last_name


--select e.last_name as emp_name, m.last_name as mgr_name
--from employees e , employees m
--where e.manager_id = m.employee_id
--order by e.last_name


select last_name, job_title, min_salary, salary, e.job_id
from employees e join jobs j
on e.job_id = j.job_id
where salary > 7000

select e.last_name, e.employee_id, m.last_name, m.employee_id
from employees e join employees m
on e.manager_id = m.employee_id


select last_name, department_name
from employees e join departments d
using (department_id)

select last_name, job_title, min_salary, salary
from employees e join jobs j
using (job_id)

select last_name, job_title, min_salary, salary
from employees e natural join jobs j

-- logic error
--select last_name, department_name
--from employees e natural join departments d

select department_name, last_name
from departments d join employees e
on d.manager_id = e.employee_id

select last_name, department_name, city
from employees join departments
using(department_id)
join locations
using(location_id)


select last_name, department_name
from employees e left join departments d
on e.department_id = d.department_id


select last_name, department_name
from employees e right join departments d
on e.department_id = d.department_id

select last_name, department_name
from employees e full join departments d
on e.department_id = d.department_id






-------------------- Questions ------------------------

* Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” 
Label the column COMM.


* Using the CASE or decode function, write a query that displays the grade of all
employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0


* Find the highest, lowest, sum, and average salary for each job type. 
Label the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.

* Determine the number of managers without listing them. 
Label the column Number of Managers.

* Create a report to display the manager number and the salary of 
the lowest-paid employee for that manager. 
Exclude anyone whose manager is not known. 
Exclude any groups where the minimum salary is $6,000 or less. 
Sort the output in descending order of salary.

* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.


* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* Create a report to display employees’ last names and employee numbers along with their
managers’ last names and manager numbers. Label the columns Employee, Emp#,
Manager, and Mgr#, respectively.
