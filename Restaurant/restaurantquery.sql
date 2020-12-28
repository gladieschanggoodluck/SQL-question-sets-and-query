## Provide custmoer information in a restaurants
SELECT FirstName, LastName, Email 
FROM Customers 
ORDER BY LastName;  

## Create a table to store customer ID and party size
CREATE TABLE AnniversaryAttendees("CustomerID" INT, "PartySize" INT); 

## Serve customers - menu
## All items sorted price, low to high
## Appetizers and beverages, by type
## All times except beverages by type
SELECT * FROM Dishes ORDER BY Price;  
SELECT * FROM Dishes WHERE Type = "Appetizer" OR Type = "Beverage";  
SELECT * FROM Dishes WHERE Type != "Beverage" ORDER BY Type;  

## Add customer who wants to have party to AnniversaryAttendees table
INSERT INTO AnniversaryAttendees 
("CustomerID", "PartySize")
VALUES
("(SELECT * FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com')", "4");

## Make reservation
INSERT INTO Customers ("FirstName", "LastName", "Email", "Phone")
VALUES
("Sam", "McAdams", "smac@rouxacademy.com", "(555) 555-1212")

INSERT INTO Reservations("CustomerID", "Date", "PartySize")
VALUES
("102", "2020-07-14 18:00:00", "5") 

## Create an order
## Find the customer
## Create the order record
## Add items to the order
## Find the total cost
## For : Loretta Hundey
## 6939 Elka Place
## House Salad
## Mini Cheeseburgers
## Tropical Blue Smoothie

SELECT * FROM Customers WHERE 
FirstName = "Loretta" AND LastName = "Hundey" ;  

# Create an order


INSERT INTO Orders ("CustomerID")
VALUES ("70", "2020-03-20 14:00:00")

INSERT INTO OrdersDishes
("OrderID", "DishID")
VALUES
("1001", (SELECT DishID FROM DIshes WHERE NAME = "House Salad")),
("1001", (SELECT DishID FROM DIshes WHERE NAME = "Mini Chesseburgers")),
("1001", (SELECT DishID FROM DIshes WHERE NAME = "Tropical Blue Smoothie"));

SELECT SUM(Price) FROM Dishes 
WHERE DishID IN (SELECT DishID From OrdersDishes WHERE OrderID = 1001); 

SELECT SUM(Dishes.Price) FROM Dishes
JOIN OrdersDishes 
ON Dishes.DishID = OrdersDishes.DishID
WHERE OrderID = "1001"; 

## Set Cleo Goldwater's favorite dish to Quinoa Salmon Salad
UPDATE Customers
SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = "Quinoa Salmon Salad")
WHERE CustomerID = "42";

## Get top 5 customers who order the most meals
SELECT COUNT(Orders.OrderID), Customers.FirstName, Customers.LastName
FROM Orders JOIN
Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
ORDER BY COUNT(Orders.OrderID) DESC LIMIT 5;


