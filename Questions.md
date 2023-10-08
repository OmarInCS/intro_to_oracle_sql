
# Oracle SQL Course

## Retriving, Restricting and Sorting data

**Question 1:**
Retrieve all columns from the `Patients` table for patients who have a gender of 'Female' and sort the results by their last names in ascending order.

**Question 2:**
Select the first name, last name, and email of patients born after January 1, 1980, and sort the result set in descending order of their birthdates.

**Question 3:**
List the doctor IDs, first names, and specializations of doctors who specialize in 'Dermatology' and have a supervisor.


**Question 4:**
Fetch the appointment ID, appointment date and time, and status (with alias "ApptStatus") for appointments that are scheduled for '2023-08-15' and have a status of 'Scheduled'.


**Question 5:**
Retrieve the first name and last name of patients whose last names start with 'S'.


**Question 6:**
Find the doctor IDs and emails of doctors whose emails don't end with '.com'.


**Question 7:**
List the appointment IDs, patient IDs and appointment dates for appointments scheduled between '2023-09-01' through '2023-09-30'.


**Question 8:**
Retrieve the distinct doctor specializations from the `Doctors` table.


**Question 9:**
Retrieve the first name, last name, and email of doctors whose specialization is either 'Dermatology' or 'Oncology'.


**Question 10:**
List the patient IDs, first names, and last names of patients, skipping the first 5 rows and fetching the next 10 rows from the `Patients` table, sorted alphabetically by their first name. 


## Using Single-Row Functions to Customize Output

**Question 1:**
You work in a healthcare database where patient addresses are stored in the `Patients` table. Write a query that prompts the user for a specific address substring using a substitution variable and returns the patient IDs and full addresses of patients whose addresses contain the specified substring. Additionally, capitalize the the address.

<details>
<summary>Solution</summary>

* first name in first row: Bev
* first name in last row: Chrisse

```sql
select PATIENT_ID, FIRST_NAME, LAST_NAME
from patients
order by FIRST_NAME
offset 5 rows
fetch next 10 rows only
```

</details>
<br/>


**Question 2:**
In your healthcare database, you have a table named `Treatments` that includes an "FDA_CODE" column representing the FDA code associated with each treatment. Write a query that prompts the user for a specific FDA code using a substitution variable and returns the treatment IDs, descriptions, and treatment costs for treatments with the specified FDA code. Additionally, include a column that calculates the round value of the treatment cost with tax 15%.

**Question 3:**
In your healthcare database, the `Patients` table contains phone numbers with format XXXXXXXXXX. Write a query that retrieves the patient IDs and phone numbers after formatting them as (XXX) XXX-XXXX using appropriate functions.

**Question 4:**
list distinct email domains (e.g., gmail.com, yahoo.com) from the `Patients` table.

**Question 5:**
Find the patient IDs and email addresses of patients with email domains (gmail and yahoo) from the `Patients` table without using like keyword.

**Question 6:**
In your healthcare database, there is a `DESCRIPTION` column in the `Treatments` table containing textual descriptions of treatments. Write a query that prompts the user for a keyword using a substitution variable and retrieves the treatment IDs and descriptions for treatments where the description contains the specified keyword. Additionally, make the keyword search case-insensitive and leading/trainling spaces insensetive.

**Question 7:**
The "Appointments" table contains appointment dates and times in the `DATE_TIME` column. Write a query that returns the appointment IDs and appointment dates for appointments scheduled for '26/09/2023'. Use the `TRUNC()` function to extract the date portion and compare it to the requested date.

**Question 8:**
Write a query that selects the current date and time displays it in the format 'DD-MON-YYYY HH:MI:SS AM'.

**Question 9:**
In your healthcare database, you need to calculate the number of months between the appointment date and today's date for each appointment. Write a query that computes this and returns the appointment ID and the calculated number of months.

**Question 10:**
In your healthcare database, you have a table named `Appointments` with an `APPOINTMENT_DATE` column containing appointment dates. Create a query that prompts the user for a specific month using a substitution variable and retrieves the appointment IDs and appointment dates for appointments occurring in that month, sorted in ascending order.

**Question 11:**
You need to categorize patients based on their age into three groups: 'Child' for ages below 18, 'Adult' for ages 18 to 64, and 'Senior' for ages 65 and above. Write a query using the `CASE` function that returns the patient IDs, first names, last names, and their respective age categories based on their date of birth from the `Patients` table.

**Question 12:**
In the `Doctors` table, there is a column named `SUPERVISOR_ID` representing the supervisor of each doctor. Some doctors have supervisors, while others do not. Write a query to retrieve the doctor IDs, first names, and the corresponding supervisor IDs from the `Doctors` table. If a doctor has no supervisor, display 'No Supervisor' as the supervisor's ID.

**Question 13:**
In your healthcare database, Write a query that prompts the user for a date range, including a start date and an end date in the format 'Mon DD, YYYY', and then selects the patient IDs, first names, last names, and their date of birth for patients whose date of birth falls within the specified date range.


## Reporting Aggregated Data Using the Group Functions

**Question 1:**
In your healthcare database, you have a `Patients` table. Write a query to find the average age of patients grouped by gender. Include only genders with more than five patients in the result.

**Question 2:**
In the `Doctors` table, each doctor is associated with a specialization. Write a query to find the number of doctors in each specialization. Display the specialization and the count of doctors. Sort the results in descending order of the doctor count.

**Question 3:**
In your healthcare database, there is a `Bills` table containing bill information for patients. Write a query to find the total amount of bills issued for each patient, but only include patients with total bill amounts exceeding SAR1,000.

**Question 4:**
Suppose you have a column named `STATUS` in the `Bills` table, where values can be 'Paid', 'Unpaid', or 'Partially Paid'. Write a query that calculates the percentage of bills in each status category and displays the results with the status and corresponding percentage. Round the percentage values to one decimal place.

**Question 5:**
In your healthcare database, you have a `Patients` table that contains patient records. Write a query to find the count of distinct email domains.


## Displaying Data from Multiple Tables Using Joins

**Question 1:**
In your healthcare database, you have two tables, `Patients` and `Appointments` Write a query that retrieves the first and last names of patients along with their appointment dates. Include only patients who have appointments.

**Question 2:**
In the `Doctors` table, there is a column named `SUPERVISOR_ID` representing the supervisor of each doctor. Some doctors have supervisors, while others do not. Write a query to retrieve the doctor IDs, names and the corresponding supervisor names. If a doctor has no supervisor, display 'No Supervisor' as the supervisor's name.

**Question 3:**
In your healthcare database, you have three tables: `Patients`, `Appointments`, and `Treatments`. Write a query that retrieves the patient's last name, appointment date, and treatment description for each patient's appointment that also includes treatment information. Join all three tables to retrieve this information.

**Question 4:**
In your healthcare database, Write a query to retrieve a list of all appointments, treatment description, patient's name, doctor's name, include appointments that have no treatments.

**Question 5:**
Retrieve the appointment ID, appointment date and time, and treatment cost (with alias "Treatment Cost") for appointments that have a treatment cost greater than 500 and sort the results by cost in descending order.

**Question 6:**
The `Appointments` table in your database includes appointment statuses like 'Scheduled,' 'Completed,' and 'Cancelled.' Write a query that calculates the percentage of completed appointments for each doctor. Display the doctor ID, doctor's last name, and the calculated percentage. Exclude doctors with no completed appointments.


## Using Subqueries to Solve Queries

**Question 1:**
In your healthcare database, you have a `Patients` table. Write a query to find the names of patients who are born after the patient with mobile number '0582100371' Utilize a subquery for this task.

**Question 2:**
You need to find the total number of appointments conducted by doctors who have a specialization in 'Gastroenterology.' Write a query that counts the appointments using a subquery.

**Question 3:**
In your healthcare database, there is a `Bills` table with information about bills issued to patients. Write a query that retrieves the patient IDs, first names, and last names of patients who have unpaid bills. Use a correlated subquery to check for unpaid bills.

**Question 4:**
You want to find the doctor with the highest average treatment cost among all doctors. Write a query that uses a subquery to calculate the average treatment cost for each doctor and then identifies the doctor with the highest average cost.

**Question 5:**
You need to find the appointment date and time for each patient's most recent appointment. Write a query that uses a correlated subquery involving the `Appointments` table to achieve this.

**Question 6:**
In the `Treatments` table, each treatment has a cost associated with it. Write a query to find the doctor ID of the doctor who has performed the most expensive treatment. Display the doctor ID and the cost of the treatment.


## Using the Set Operators

**Question 1:**
In your healthcare database, you have two tables, `Patients` and `Doctors`. Write a query to retrieve a list of unique first names, including both patient and doctor first names.

**Question 2:**
You want to find patients who have the same first name as doctors. Write a query to retrieve the first names that are common between patients and doctors.

**Question 3:**
In your healthcare database, you have a `Patients` table and a `Doctors` table. Write a query to find the last names of doctors who do not share the same last name with any patient.


## Managing Tables Using DML Statements

**Question 1:**
You are responsible for adding a new patient named "John Doe" to the `Patients` table. Write an SQL statement to insert this new patient with appropriate values for all columns.

**Question 2:**
In your healthcare database, a doctor's phone number has changed. Write an SQL statement to update the phone number for a specific doctor (doctor id 4).

**Question 3:**
A patient with mobile number '0528409456' has requested to have their record removed from the `Patients` table. Write an SQL statement to delete the patient's record from the table.


## Introduction to Data Definition Language


## Introduction to Data Dictionary Views


## Creating Sequences, Synonyms, Views and Indexes


## Controlling User Access










