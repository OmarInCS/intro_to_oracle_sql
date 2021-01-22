************ Week 2, Lesson 1 ************** 
Name: Omar Karem
Mobile: 0599 888 921
------------------------------------------

SELECT *
FROM table_name
[WHERE bool-expr]	-- filter rows
[GROUP BY column|expr, ...]
[HAVING bool-expr]	-- filter groups
[ORDER BY column|number|expr|alias [ASC|DESC], ...]


* Using Single-Row Functions to Customize Output:
	- Characters:
		upper(), lower(), initcap(), trim(), replace(),
		substr(), instr(), length(), lpad(), rpad()
	- Numbers:
		round(), trunc(), mod()
	- Dates:
		round(), trunc(), sysdate,
		months_between(), add_months()
		next_day(), last_day()
		
	- Conversion:
		to_char(), to_number(), to_date()
		
	- General:
		nvl(), nvl2(), coalesce()
		case, decode()


* Reporting Aggregated Data Using the Group Functions

	max(), min(), sum(), avg(), count()

---------------------- Examples ------------------------





-------------------- Questions ------------------------
* Create a query that displays employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.

* Using the CASE or decode function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0


* Find the highest, lowest, sum, and average salary for each job type. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.

* Write a query to display the number of people with the same job. Generalize the query so that the user in the HR department is prompted for a job id.

* Determine the number of managers without listing them. Label the column Number of Managers.


* Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
