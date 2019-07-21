
/* create Database where info will be stored*/


CREATE DATABASE LIBRARY
USE LIBRARY




/*Create Tables*/


CREATE TABLE Library_Branch(
	Branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Branch_Name VARCHAR(300) NOT NULL,
	Branch_Address VARCHAR(500) NOT NULL,
	Branch_addition INT
	);


/* creating a primary key as the publishers name, not a random integer */

CREATE TABLE Publisher(
	Publisher_name VARCHAR(300) PRIMARY KEY NOT NULL,
	Publisher_Address VARCHAR(300) NOT NULL,
	Publisher_phone VARCHAR(10) NOT NULL,
	);

/*the foreign key needs to be the same data type as the primary key it is in reference too*/
CREATE TABLE Book(
	Book_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Book_Title VARCHAR(300) NOT NULL,
	Book_pName VARCHAR(300) NOT NULL CONSTRAINT fk_pName FOREIGN KEY REFERENCES Publisher(Publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
	);

CREATE TABLE Book_Copies(
	Book_id INT NOT NULL CONSTRAINT fk_Book_id FOREIGN KEY REFERENCES Book(Book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_id INT NOT NULL CONSTRAINT fk_Branch_id Foreign Key References Library_Branch(Branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_of_copies VARCHAR (20)
	);


CREATE TABLE Borrower(
	Borrower_CardNumber VARCHAR(300) PRIMARY KEY NOT NULL,
	Borrower_Name VARCHAR(300) NOT NULL, 
	Borrower_Address VARCHAR(300) NOT NULL,
	Borrower_Phone VARCHAR(300) NOT NULL,
	Borrower_Addition INT
	);

CREATE TABLE Book_Loans(
	Book_id INT NOT NULL CONSTRAINT Book_id FOREIGN KEY REFERENCES Book(Book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_id INT NOT NULL CONSTRAINT Branch_id FOREIGN KEY REFERENCES Library_Branch(Branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_Num VARCHAR(300) NOT NULL CONSTRAINT fk_Borrower_CardNumber FOREIGN KEY REFERENCES Borrower(Borrower_CardNumber) ON UPDATE CASCADE ON DELETE CASCADE,
	Date_Out VARCHAR(300) NOT NULL,
	Date_Due VARCHAR(300) NOT NULL
	);

CREATE TABLE Book_Authors( 
	Book_id INT NOT NULL CONSTRAINT Author_Book_id FOREIGN KEY REFERENCES Book(Book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(100) NOT NULL
	);


/*
Insert Data into tables 
*/

INSERT INTO Library_Branch
		(Branch_Name, Branch_Address, Branch_addition)
		VALUES 
		('Central','25 West Hanover St. Rapid City, SD 57701', 1),
		('Sharpstown','9305 Carpenter St. Hillsborough, NJ 08844', 1),
		('Red Jug Pub','596 Tower Dr. Niceville, FL 32578', 1),
		('Darkhorse','760 Birch Hill Street Parsippany, NJ 07054', 1);
SELECT * FROM Library_Branch;


INSERT INTO Publisher
	(Publisher_name, Publisher_Address, Publisher_phone)
	VALUES
	('Olive Dejan','9842 East Joy Ridge Drive Owosso, MI 48867','8408171'),
	('Lauge Felix','7429 Charles Ave. Circle Pines, MN 55014','4088938'),
	('Aglaya Vellamo','15 Anderson St. Matthews, NC 28103','8530559'),
	('Walery Radha','8960 Hickory St. Lakewood, NJ 08701','6449115'),
	('Josiah Democritus','7471 Pacific St. Prattville, AL 36067','9957253');
SELECT * FROM Publisher


INSERT INTO Book
	(Book_Title, Book_pName)
	VALUES
	('The Lost Tribe','Olive Dejan'	),
	('IT','Lauge Felix' ),
	('The Shinning','Aglaya Vellamo' ),
	('Letting Go','Josiah Democritus'),
	('Fear of Flying','Olive Dejan' ),
	('The French','Lauge Felix'),
	('Wide Sargasso Sea','Aglaya Vellamo'),
	('When Breath Becomes Air','Walery Radha'),
	('GENESIS', 'Josiah Democritus'),
	('The Manuscript','Walery Radha' ),
	('The Adventures of Tom Sawyer','Olive Dejan' ),
	('In the Heart of the Sea','Lauge Felix' ),
	('A New Earth','Aglaya Vellamo' ),
	('Men are from Mars, Women are from Venus', 'Josiah Democritus'),
	('the facebook EFFECT', 'Josiah Democritus'),
	('The OZ Principle','Walery Radha' ),
	('Zappos.com','Olive Dejan' ),
	('Think and Grow Rich','Lauge Felix' ),
	('Quatum Realm Physics: Time Travel', 'Josiah Democritus' ), 
	('The Great Gatsby', 'Aglaya Vellamo'),
	('Pride and Prejudice', 'Olive Dejan' ),
	('To Kill a Mockingbird','Lauge Felix' );
SELECT * FROM Book

INSERT INTO Book_Authors
	(AuthorName, Book_id)
	VALUES
	('Mark Lee', 100),
	('Stephen King', 101),
	('Stephen King', 102),
	('Philip Roth', 103),
	('Erica Jong', 104),
	('Thomas Keller', 105),
	('Jean Rhys', 106),
	('Paul Kalanithi', 107),
	('Lélia Wanick Salgado', 108),
	('R. W. Franklin', 109),
	('Mark Twain', 110),
	('Nathaniel Philbrick', 111),
	('Eckhart Tolle', 112),
	('John Gray, Ph.D.', 113),
	('David Kirkpatrick', 114),
	('Roger Connors', 115),
	('Tony Hseih', 116),
	('Napoleon Hill', 117),
	('Scott Lang', 118), 
	('F. Scott Fitzgerald', 119),
	('Jane Asten', 120),
	('Harper Lee', 121);
SELECT * FROM Book_Authors


INSERT INTO Book_Copies
	(Book_id, Branch_id, Number_of_copies)
	VALUES
	(100, 2, 3),
	(101, 1, 4),
	(102, 1, 5),
	(103, 2, 7),
	(104, 1, 8),
	(105, 2, 9),
	(106, 1, 10),
	(107, 2, 20),
	(108, 1, 4),
	(109, 2, 2),
	(110, 1, 5),
	(111, 2, 7),
	(112, 1, 8),
	(113, 2, 9),
	(114, 1, 12),
	(115, 2, 4),
	(116, 1, 4),
	(117, 2, 7),
	(118, 1, 8),
	(119, 2, 9),
	(120, 3, 2),
	(121, 4, 2);
SELECT * FROM Book_Copies

DELETE FROM Borrower
INSERT INTO Borrower
	(Borrower_CardNumber, Borrower_Name, Borrower_Address, Borrower_Phone, Borrower_addition)
	VALUES
	(1252368433647820,'Tobey Maverick','14 Bowman Street Tualatin, OR 97062',           8889073951, 1),  
	(8527008159101843,'Saint ONeal','77 Cedar Swamp Street Hillsborough, NJ 08844',     7937211208, 1),
	(9810578383524798,'Star Wildin','361 Armstrong Rd. Grand Island, NE 68801',         6837584760, 1),
	(1254587528251871,'T-Pain','8699 Randall Mill Circle Farmingdale, NY 11735',        3076984984, 1),
	(1844461531705872,'Lexus Dmotor','788 Plumb Branch Ave. Hummelstown, PA 17036',     8459679351, 1),
	(9999645970573430,'Jose Hannett ','7311 Anderson Rd. Mishawaka, IN 46544',          9638672913, 1),
	(1254503961942231,'Tony Rogers ','9741 South Pawnee Drive Fleming Island, FL 32003',6267316503, 1),
	(2918797452983259,'Steve Stark ','60 Selby St. Port Jefferson Station, NY 11776',   5337967009, 1),
	(4446521600268760,'Tony Stank ','484 Devon Ave. Stow, OH 44224',                    8647895272, 1),
	(3399740336528419,'Ian Batman ','239 Temple Drive Union City, NJ 07087',            0262315376, 1),
	(0284057685900417,'Frank Sinatra ','736 Bayberry Dr. Palm City, FL 34990',          2949870048, 1),
	(8801095109661882,'Elvis Presely','8 W. Cactus Road Toms River, NJ 08753',          6404956312, 1),
	(2872980583183329,'Iam Batman ','1007 Mountain Drive, Gotham',                      3712187251, 1);
SELECT * FROM Borrower 

INSERT INTO Book_Loans
	(Book_id, Branch_id, card_Num, Date_Out, Date_Due) --THE BOOK_ID AND BRANCH ID NEED TO BE CONSISTANT WITH ONE ANOTHER 
	VALUES
	(100,2 ,1252368433647820,'2019-1-25','2019-4-25'),
	(101,1 ,8527008159101843,'2019-1-25','2019-4-25'),
	(102,1 ,9810578383524798,'2019-1-25','2019-4-25'),
	(103,2 ,1254587528251871,'2019-1-26','2019-4-26'),
	(104,1 ,1844461531705872,'2019-1-26','2019-4-26'),
	(105,2 ,9999645970573430,'2019-1-26','2019-4-26'),
	(106,1 ,1254503961942231,'2019-1-26','2019-4-26'),
	(107,2 ,2918797452983259,'2019-1-26','2019-4-26'),
	(108,1 ,4446521600268760,'2019-1-27','2019-4-27'),
	(109,2 ,3399740336528419,'2019-1-27','2019-4-27'),
	(110,1 ,0284057685900417,'2019-1-27','2019-4-27'),
	(111,2 ,8801095109661882,'2019-1-27','2019-4-27'),
	(112,1 ,2872980583183329,'2019-1-27','2019-4-27'),
	(113,2 ,1252368433647820,'2019-1-27','2019-4-27'),
	(114,1 ,1252368433647820,'2019-1-27','2019-4-27'),
	(115,2 ,1252368433647820,'2019-1-27','2019-4-27'),
	(116,1 ,1252368433647820,'2019-1-28','2019-4-28'),
	(117,2 ,1252368433647820,'2019-1-28','2019-4-28'),
	(118,1 ,1252368433647820,'2019-1-29','2019-4-29'),
	(119,2 ,1254587528251871,'2019-1-29','2019-4-29'),
	(120,3 ,2918797452983259,'2019-1-29','2019-4-29'),
	(121,4 ,9999645970573430,'2019-1-29','2019-4-29'),
	(100,2 ,4446521600268760,'2019-1-29','2019-4-29'),
	(101,1 ,2872980583183329,'2019-1-29','2019-4-29'),
	(102,1 ,2918797452983259,'2019-1-30','2019-4-30'),
	(103,2 ,1254587528251871,'2019-1-30','2019-4-30'),
	(104,1 ,9999645970573430,'2019-1-30','2019-4-30'),
	(105,2 ,2872980583183329,'2019-1-31','2019-4-30'),
	(106,2 ,2918797452983259,'2019-2-1','2019-5-1'),
	(107,1 ,1254587528251871,'2019-2-1','2019-5-1'),
	(108,2 ,9999645970573430,'2019-2-1','2019-5-1'),
	(109,1 ,4446521600268760,'2019-2-1','2019-5-1'),
	(110,2 ,2872980583183329,'2019-2-2','2019-5-2'),
	(111,1 ,2918797452983259,'2019-2-2','2019-5-2'),
	(112,2 ,4446521600268760,'2019-2-3','2019-5-3'),
	(113,1 ,8801095109661882,'2019-2-4','2019-5-4'),
	(114,2 ,3399740336528419,'2019-2-5','2019-5-5'),
	(115,1 ,1254503961942231,'2019-2-5','2019-5-5'),
	(116,2 ,1254503961942231,'2019-2-5','2019-5-5'),
	(117,1 ,2918797452983259,'2019-2-5','2019-5-5'),
	(118,2 ,9999645970573430,'2019-2-5','2019-5-5'),
	(119,3 ,4446521600268760,'2019-2-6','2019-5-6'),
	(120,4 ,2872980583183329,'2019-2-7','2019-5-7'),
	(121,2 ,8801095109661882,'2019-2-7','2019-5-7'),
	(100,1 ,3399740336528419,'2019-2-7','2019-5-7'),
	(101,1 ,4446521600268760,'2019-2-7','2019-5-7'),
	(102,2 ,2872980583183329,'2019-2-7','2019-5-7'),
	(103,1 ,1254503961942231,'2019-2-8','2019-5-8'),
	(104,2 ,3399740336528419,'2019-2-9','2019-5-9'),
	(105,1 ,4446521600268760,'2019-2-9','2019-5-9');
SELECT * FROM Book_Loans





/*creation of stored procedures*/

/*
1. Stored Procedure 1: How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
*/
GO 
Create PROC sp_BranchCopies (@Book_Title AS VARCHAR(50))
AS
BEGIN
SELECT
		a1.Book_title, a2.Branch_name, 
		a3.Number_of_copies
		FROM Book a1 
		INNER JOIN Book_Copies a3 ON a3.Book_id = a1.Book_id
		INNER JOIN Library_Branch a2 ON a2.Branch_id = a3.Branch_id
		WHERE a1.Book_Title = @Book_Title;
END 
EXECUTE sp_BranchCopies 'The Lost Tribe'

/*
2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
*/



--can use previous stored procedure to find out whether there is copies of "The Lost Tribe"



/*
3. Retrieve the names of all borrowers who do not have any books checked out.
This stored Procedure selects for those that are on record (they have a card number on record) BUT do not currently have a book checked out 
*/
GO 
Create PROC sp_NoBooks
AS
BEGIN
SELECT
		a1.Borrower_Name, a2.card_Num, a2.Date_Out, a2.Date_Due, 
		a3.Book_Title
		FROM Borrower a1 
		INNER JOIN Book_Loans a2 ON a2.card_Num = a1.Borrower_CardNumber
		INNER JOIN Book a3 ON a3.Book_id = a2.Book_id
		WHERE a2.Date_Due = NULL
		ORDER BY a1.Borrower_Name
		--As of right not, all individuals have a book checked out 
END
Execute sp_NoBooks

--or we structure our SELECT Statment this way 
--Again, there are no borrowers on my list that do not have a book checked out 
SELECT 
	a1.Borrower_Name 
	FROM Borrower a1
		INNER JOIN Book_Loans a2 ON a2.card_Num = a1.Borrower_CardNumber
		INNER JOIN Book a3 ON a3.Book_id = a2.Book_id
	WHERE NOT EXISTS (SELECT * FROM Book_Loans WHERE a2.Card_Num = a1.Borrower_CardNumber)
	ORDER BY a1.Borrower_Name

-----------CORRECTION----------------------
--Neither of my answers for Number 3 will return anything, even if you had a borrower with nothing checked out, which you can test by adding another borrower. 
--INNER JOINS don't return null values, plus a value isn't 'equal' to NULL it just IS or IS NOT NULL
--So these two would work:

SELECT a1.Borrower_Name, a2.card_Num, a2.Date_Out, a2.Date_Due, 
a3.Book_Title
FROM Borrower a1 
FULL OUTER JOIN Book_Loans a2 ON a2.card_Num = a1.Borrower_CardNumber
FULL OUTER JOIN Book a3 ON a3.Book_id = a2.Book_id
WHERE a2.Date_Due IS NULL
ORDER BY a1.Borrower_Name
------------------------------------------and
SELECT a1.Borrower_Name 
FROM Borrower a1
FULL OUTER  JOIN Book_Loans a2 ON a2.card_Num = a1.Borrower_CardNumber
FULL OUTER  JOIN Book a3 ON a3.Book_id = a2.Book_id
WHERE NOT EXISTS (SELECT * FROM Book_Loans WHERE a2.Card_Num = a1.Borrower_CardNumber)
ORDER BY a1.Borrower_Name
----------------------------------


/*
4. This stored Procedure selects for those that are on record and do have a book checked out.
It then lists them in alphabetic order (starting with first name-may want to seperate name into first and last, then use last name as indicator)
*/
GO 
Create PROC sp_BookCheckOut
AS
BEGIN
SELECT
		a1.Borrower_Name, a2.card_Num, a2.Date_Out, a2.Date_Due, 
		a3.Book_Title
		FROM Borrower a1 
		INNER JOIN Book_Loans a2 ON a2.card_Num = a1.Borrower_CardNumber
		INNER JOIN Book a3 ON a3.Book_id = a2.Book_id
		ORDER BY a1.Borrower_Name
END
Execute sp_BookCheckOut


/*
5. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
retrieve the book title, the borrower's name, and the borrower's address.
*/

GO 
Create PROC sp_BranchDueDate (@branch_name AS VARCHAR(300), @date_due AS VARCHAR(100))
AS
BEGIN
SELECT
		a1.Book_title, a2.Borrower_Name, a2.Borrower_Address
		FROM Book a1 
		INNER JOIN Book_Loans a3 ON a3.Book_id = a1.Book_id
		INNER JOIN Borrower a2 ON a2.Borrower_CardNumber = a3.card_Num
		INNER JOIN Library_Branch a4 ON a4.Branch_id = a3.Branch_id
		WHERE a4.Branch_Name=@branch_name AND
		a3.Date_Due=@date_due
		ORDER BY a2.Borrower_Name
END
EXECUTE sp_BranchDueDate 'Sharpstown', '2019-4-29' --Lets pretend that todays date is 2019-4-29


/*
6. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
*/

GO 
Create PROC sp_BranchLoan 
AS
BEGIN
	SELECT 
		Branch_Name, SUM(Branch_addition) AS Branch_total 
		FROM Library_Branch a1
		INNER JOIN Book_Loans a2 ON a2.Branch_id = a1.Branch_id
		INNER JOIN Book a3 ON a3.Book_id = a2.Book_id
		INNER JOIN Borrower a4 ON a4.Borrower_CardNumber = a2.card_Num
		GROUP BY Branch_Name
END
EXECUTE sp_BranchLoan



--Cheated a bit by making my own column that would suppliment the math operator I wanted to use.  
--In the spirit of learning, here is another answer that doesnt use that method.
--Just to save me some time, i did not encapsulate it in a stored procedure 

SELECT 
	a1.Branch_Name, COUNT(*)
	FROM Library_Branch a1
	INNER JOIN Book_Loans a2 ON a2.Branch_id = a1.Branch_id
	INNER JOIN Book a3 ON a3.Book_id = a2.Book_id
	INNER JOIN Borrower a4 ON a4.Borrower_CardNumber = a2.card_Num
	GROUP BY Branch_Name




/*
7. Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
*/

GO 
Create PROC sp_Borrower  
AS
BEGIN
	SELECT 
		a1.Borrower_Name, Borrower_Address, COUNT(*) AS Checkout_total 
		FROM Borrower a1
		INNER JOIN Book_Loans a2 ON a2.card_Num = a1.Borrower_CardNumber
		GROUP BY a1.Borrower_Name, Borrower_Address
		HAVING COUNT(*) > 5
END 
EXECUTE sp_Borrower

















		

		
	





