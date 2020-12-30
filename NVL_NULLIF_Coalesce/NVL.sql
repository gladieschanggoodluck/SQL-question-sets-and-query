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
                        
                        
## ISNULL and  NULLIF differences
## ISNULL : replaces NULL with the specified replaacement value
## ISNULL (<check expression>, (dispplaced expression)
ISNULL(Param1, Param2)
-- IF Param1 = NULL, return Param2
-- IF Param1 <> Null, return Param1
-- IF Param1 ISNULL, then return Param2

-- EXAMPLE
DECLARE @ PARAM1 INT,
		@ PARAM2 INT
SELECTT @PARAM1 = 10 @PARAM2 = 20
SELECT ISNULL(@PARAM1, @PARAM2) 
# This function returns 10
		
ISNULL(NULL, 20)
# This function returns 20

## NULLIF
## Retrun a null value if the two specified expressions are equal
## NULLIF(<Expression1>, <Expresssion2>)

NULLIF(Param1, Param2)
--If Param1 = Param2, return NULL
--If Param1 <> Param2, return Param1
-- EXAMPLE

DECLARE @PARAM1 INT,
		@PARAM2 INT
SELECT @ PARAM1 = 10, @PARAM2 = 10
SELECT NULLIF(@PARAM1, @PARAM2)
-- RETURN NULL


DECLARE @PARAM1 INT,
		@PARAM2 INT
SELECT @ PARAM1 = NULL, @PARAM2 = NULL
SELECT NULLIF(@PARAM1, @PARAM2)
-- RETURN NULL


DECLARE @PARAM1 INT,
		@PARAM2 INT
SELECT @ PARAM1 = 10, @PARAM2 = 20
SELECT NULLIF(@PARAM1, @PARAM2)
-- RETURN 20

# - DIFFERENCES between ISNULL AND NULLIF
