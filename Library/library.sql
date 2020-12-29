## Check Book "Dracula" is still in the library
## Using join method
SELECT
(SELECT COUNT(Books.Title) FROM Books WHERE Books.Title = "Dracula")
-
(SELECT COUNT(Books.Title)
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title = "Dracula" AND Loans.ReturnedDate IS NULL)
AS AvaliableBooks;


## Not Using join method
SELECT 
(SELECT COUNT(Title) FROM Books
WHERE Title = "Dracula")-
(SELECT COUNT(BookID) FROM Loans
WHERE BookID IN (SELECT BookID FROM Books 
WHERE Title = "Dracula") AND ReturnedDate IS NULL)

AS AvaliableBook;

## Add books into library
 INSERT INTO Books 
 (Title, Author, Published, Barcode)
 VALUES
 ("Dracula", "Bram Stoker", "1897", "4819277482"),
 ("Gulliver's Travels", "Jonathan Swift", "1729", "4899254401");

 ## A person loan a book and store this information to loan
INSERT INTO Loans
(BookID, PatronID, LoanDate, DueDate)
VALUES
((SELECT BookID FROM Books WHERE Barcode = "2855934983"), 
(SELECT PatronID FROM Patrons WHERE Email = "jvaan@wisdompets.com"),
"2020-08-25",
"2020-09-08"); 
INSERT INTO Loans
(BookID, PatronID, LoanDate, DueDate)
VALUES
((SELECT BookID FROM Books WHERE Barcode = "4043822646"), 
(SELECT PatronID FROM Patrons WHERE Email = "jvaan@wisdompets.com"),
"2020-08-25",
"2020-09-08"); 

## Remind Patron to return book the due date is "2020-07-13"
SELECT Books.Title, Loans.DueDate, Patrons.FirstName, Patrons.Email
FROM Books
JOIN Loans on Books.BookID = Loans.BookID
JOIN Patrons on Loans.PatronID = Patrons.PatronID
WHERE Loans.DueDate = "2020-07-13" AND Loans.ReturnedDate IS NULL; 

## When Patron return books back
UPDATE Loans SET DueDate = "2020-07-05"
WHERE BookID = (SELECT BookID FROM Books WHERE Barcode = "8730298424") AND ReturnedDate IS NULL;


## Encouraging top 5 patron who loan least books 
SELECT COUNT(Loans.PatronID), Patrons.FirstName, Patrons.LastName
FROM Loans
JOIN Patrons
ON Loans.PatronID = Patrons.PatronID
GROUP BY Loans.PatronID
ORDER BY COUNT(Loans.PatronID) ASC LIMIT 5;

## publish the book in 1890 and 1900 not yet check out
SELECT Books.Title, Books.Published, Books.Author
FROM Books
JOIN Loans
ON Books.BookID = Loans.BookID
WHERE Published > "1890" AND Published < 1900 AND ReturnedDate IS NOT NULL
GROUP BY Books.Title
ORDER BY Books.Title; 

## Show books statistic
## Create a report showing how many books were published each year
SELECT Title, COUNT(DISTINCT (Title)), Published FROM Books 
GROUP BY Published; 
## Create a report showuing the five most popular books to check out
SELECT Count(Loans.BookID), Books.Title
FROM Loans 
JOIN Books
ON Loans.BookID = Books.BookID
GROUP BY Loans.BookID
ORDER BY Count(Loans.BookID) DESC LIMIT 5;