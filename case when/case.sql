## Label range 
SELECT Price, CASE
WHEN Price > 9 THEN "High"
WHEN Price > 7 THEN  "Medium"
WHEN Price > 5 THEN "Low"
ELSE "Very Low" END AS Price_Level
FROM Dishes; 

## Change name
SELECT Type, CASE
WHEN Type = "Appetizer" THEN "SideDish"
WHEN Type = "Main" THEN "MainFood"
WHEN Type = "Dessert" THEN "Sweet"
WHEN Type = "Beverage" THEN "DRINK"
ELSE "Free" END AS "NewType"
FROM Dishes;

SELECT 
	CustomerID,
	FirstName,
	LastName,
	CASE 
		WHEN CustomerID = 5995 THEN 'Unknow'
		WHEN Gender = "M" THEN Male
		WHEN Gender = "F" THEN Female
		ELSE 'Unknow' END AS Gender
	,DOB
FROM dbo.CustomerSample; 		


