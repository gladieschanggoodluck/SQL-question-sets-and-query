## NVL function
## NVL is to deal with null value
#/1 -string*/
SELECT first_name, last_name, country,
NVL(country, 'No country')
FROM nvl_customers;

#/2 - number */
SELECT first_name, last_name, employees,
NVL(employees, 0) "Fixed Employees"
FROM nvl_customers;

#/3 - dates */
SELECT first_name,last_name, start_date,
NVL(start_date, TO_DATE('01-JAN-2000')) 'Fixed Start Date'
FROM nvl_customers;

#/4 - another columns as return */
SELECT first_name, last_name, country,
NVL(country, last_name)
FROM nvl_customers;

#/5 -multiple columns */
SELECT first_name, last_name
NVL(Country, 'No country') "Country",
NVL(employees, 0) "Employees",
NVL(start_date, TO_DATE('01-JAN-2000')) 'start_date'
FROM nvl_customers;
