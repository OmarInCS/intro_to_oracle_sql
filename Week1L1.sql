************ Week 1, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------


* Retriving, Restricting and Sorting data


---------------------- Examples ------------------------


select *
from employees

select last_name, hire_date, job_id, salary
from employees


select last_name, hire_date, job_id, salary, salary * 12 as annual_salary
from employees

select first_name || ' bin ' || last_name as full_name, job_id
from employees


select last_name, hire_date, job_id, salary, salary * 12 "annual salary"
from employees

select last_name, hire_date, salary, commission_pct
      , salary + commission_pct * salary as total_salary
from employees










-------------------- Questions ------------------------
* The HR department wants a query to display the last name, 
job ID, hire date, and employee ID for each employee, 
with the employee ID appearing first. Provide an alias
STARTDATE for the HIRE_DATE column.

* The HR department wants a query to display all 
unique job IDs from the EMPLOYEES table.

	
* Because of budget issues, the HR department needs 
a report that displays the last name and salary 
of employees who earn more than $12,000.

* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.

* Display the last name, job, and salary for all employees 
whose job is that of a sales representative (SA_REP) or 
a stock clerk (ST_CLERK), and whose salary is not equal 
to $2,500, $3,500, or $7,000.

* The HR department wants to run reports based on a manager. 
Create a query that prompts the user for a manager ID, and generates the employee ID, last name, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column.

* Write a query that displays the last name (with uppercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

* For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed.

* Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.



