CREATE DATABASE library;

USE library;

CREATE TABLE Book_Details (
	Book_id TINYINT,
    Book_Name VARCHAR(30),
    Book_Author VARCHAR(30),
    Book_Price FLOAT,
    Publish_Year  YEAR,
    Volume CHAR(5)
);


DESCRIBE Book_details;

INSERT INTO Book_Details VALUE(1, 'DBMS', 'Balaguru Swamy', 500.00,'2007', 'V2'),(2, 'Data Structure', 'Padma Reddy', 595.00,'2015', 'V3'),
								(3, 'My Journy', 'Abdul Kalam', 780.00,'2008', 'V1'),(4, 'The wings of Fire', 'Abdul Kalam', 600.00,'2009', 'V1'),
                                (5, 'Whispher of Time', 'Krishna Saksena', 1200.00,'2007', 'V7'),(6, 'Cheque book', 'Vasdev Mohi', 800.00,'2019', 'V6');
;

SELECT Book_Name FROM Book_Details WHERE Publish_Year >= "2015";

SELECT * FROM Book_Details WHERE Book_Id = 1;

SELECT COUNT(*) FROM Book_Details;

ALTER TABLE Book_Details ADD COLUMN No_Of_Pages INT;

ALTER TABLE Book_Details DROP COLUMN No_Of_Pages;

ALTER TABLE Book_Details ADD COLUMN No_Of_Pages INT AFTER Book_Name;

ALTER TABLE Book_Details RENAME COLUMN Book_Price to Book_Amount;

ALTER TABLE Book_Details RENAME TO Books;

SELECT * FROM Books;

TRUNCATE Books;

DROP TABLE books;

DROP DATABASE library;

USE library;

CREATE TABLE Book_Details (
	Book_id TINYINT,
    Book_Name VARCHAR(30) UNIQUE,
    Book_Author VARCHAR(30) NOT NULL,
    Book_Price FLOAT DEFAULT(500),
    Publish_Year  YEAR CHECK(Publish_Year > 2000),
    Volume CHAR(5),
    PRIMARY KEY(Book_id)
);

DESCRIBE Book_details;

INSERT INTO Book_Details VALUE(1, 'DBMS', 'Balaguru Swamy', 500.00,'2007', 'V2'),(2, 'Data Structure', 'Padma Reddy', 595.00,'2015', 'V3'),
								(3, 'My Journy', 'Abdul Kalam', 780.00,'2008', 'V1'),(4, 'The wings of Fire', 'Abdul Kalam', 600.00,'2009', 'V1'),
                                (5, 'Whispher of Time', 'Krishna Saksena', 1200.00,'2007', 'V7'),(6, 'Cheque book', 'Vasdev Mohi', 800.00,'2019', 'V6');
;

INSERT INTO Book_Details VALUE(7, 'The Testaments', 'Margaret Atwood', 650.00,'2017', 'V5'),(8, 'Making of New India', 'Dr. Bibek Debroy', 2000.00,'2013', 'V3'),
								(9, 'Indian Fiscal Federalism', 'Dr. Y.V. Reddy	', 850.00,'2012', 'V1'),(10, 'Darkness to light', 'Lamar Odom', 1200.00,'2012', 'V1');

INSERT INTO Book_Details(Book_Id, Book_Name, Book_Author, Publish_Year) VALUE(11,'Making of Legend', 'Bindeshwar Pathak','2016'),(12, 'Indian Cultures as Heritage', 'Romila Thapar','2020');

SELECT * FROM Book_Details WHERE Volume IS NULL;

SELECT * FROM Book_Details WHERE Volume IS NOT NULL;

ALTER TABLE Book_Details MODIFY Book_Name VARCHAR(35) NOT NULL;

SELECT DISTINCT Book_Author FROM Book_Details;

UPDATE Book_Details SET Volume = 'V2' WHERE Book_Id = 4;

UPDATE Book_Details SET Volume = 'V9' WHERE Book_Id = 2;

DELETE FROM Book_Details WHERE Book_id = 1;

SELECT * FROM Book_Details;

SELECT * FROM Book_Details ORDER BY Book_Price;

SELECT * FROM Book_Details ORDER BY Book_Price DESC;

SELECT * FROM Book_Details LIMIT 8;

SELECT * FROM Book_Details ORDER BY Book_Id DESC LIMIT 6;

SELECT * FROM Book_Details WHERE Book_Name IN('My Journy', 'The wings of Fire', 'Making of Legend');

SELECT * FROM Book_Details WHERE Book_Price BETWEEN 500 AND 1000;

SELECT Book_Price AS Book_Amount FROM Book_DetaiLs WHERE Book_Price > 1000;

SELECT * FROM Book_Details WHERE Book_Name LIKE '%Fire';

SELECT * FROM Book_Details WHERE Book_Name LIKE 'THE%';

SELECT * FROM Book_Details WHERE Book_Name LIKE '%of%';

SELECT * FROM Book_Details WHERE Book_Name LIKE '_h%';

SELECT * FROM Book_Details WHERE Book_Name LIKE '_a_a%';

SELECT CURDATE(); 

SELECT CURTIME(); 

SELECT NOW(); 

SELECT DATE(NOW()); 

SELECT TIME(NOW()); 

SELECT DAYOFMONTH(NOW()); 

SELECT MONTH(NOW());

SELECT YEAR(NOW());

SELECT WEEK(NOW()); 

SELECT DAYNAME(NOW()); 

SELECT DAYOFWEEK(NOW()); 

SELECT DAYOFYEAR(NOW());

SELECT MAX(Book_Price) AS maximum FROM Book_Details; 

SELECT MIN(Book_Price) AS Minumum FROM Book_Details; 

SELECT AVG(Book_Price) AS average FROM Book_Details;

SELECT SUM(Book_price) AS Total FROM Book_Details; 

SELECT COUNT(*) AS Total_count FROM Book_Details;

select count(*) as ID from Book_Details;

select time('2021-11-13 09:30:56') as Extracted_Year;

select  week('2021-11-13 09:30:56') as Extracted_Week;

SELECT Book_Author, COUNT(Book_Name) AS Count_Book_Author FROM Book_details GROUP BY Book_Author;

SELECT Book_Name, COUNT(Book_Price) AS Count_Book_Price FROM Book_Details GROUP BY Book_Price;

SELECT Publish_Year, COUNT(Book_Name) AS count_book_name, Book_Name FROM Book_Details WHERE Publish_Year > 2005 GROUP BY Publish_Year;

SET AUTOCOMMIT = 0;
SELECT * 
FROM book_details;

DELETE FROM book_details
WHERE Book_id = 7;

ROLLBACK;

SELECT MAX(Book_Price) 
FROM book_details;

-- GET THE DETAILS OF THE BOOK WHICH HIGHEST COST

-- main query or outer query
SELECT *
FROM book_details	-- inner query
WHERE Book_Price = (SELECT MAX(Book_Price) FROM book_details);

-- Get the second highest cost of the book from the book_details table

SELECT MAX(Book_Price) AS Second_Highest_Cost_of_The_Book
FROM book_details
WHERE Book_Price < (SELECT MAX(Book_Price) FROM book_details);

-- GET THE DETAILS OF THE BOOK WHICH SECOND HIGHEST COST

SELECT *
FROM book_details
WHERE Book_Price =
 (SELECT MAX(Book_Price) AS Second_Highest_Cost_of_The_Book
 FROM book_details
 WHERE Book_Price < 
 (SELECT MAX(Book_Price)
 FROM book_details));
 
 -- to get the third hishest cost of the book_price from book_details table
 
 SELECT MAX(Book_price) AS Third_Highest_Cost_Of_Book_Price
 FROM book_details
 WHERE Book_Price < (SELECT MAX(Book_Price) AS Second_Highest_Cost_of_The_Book
 FROM book_details
 WHERE Book_Price < 
 (SELECT MAX(Book_Price)
 FROM book_details));

 -- to get details of the third hishest cost of the book_price from book_details table

SELECT *
FROM book_details
WHERE Book_Price = 
(SELECT MAX(Book_price) AS Third_Highest_Cost_Of_Book_Price
 FROM book_details
 WHERE Book_Price < (SELECT MAX(Book_Price) AS Second_Highest_Cost_of_The_Book
 FROM book_details
 WHERE Book_Price < 
 (SELECT MAX(Book_Price)
 FROM book_details)));
 
 -- get the details of the book which has a highest cost and second highest cost
 
SELECT *
FROM book_details
WHERE Book_Price 
 IN((SELECT MAX(Book_Price) AS Second_Highest_Cost_of_The_Book
 FROM book_details
 WHERE Book_Price < 
 (SELECT MAX(Book_Price)
 FROM book_details)),( 
 (SELECT MAX(Book_Price)
 FROM book_details)));
 
 SELECT * 
 FROM book_details
 WHERE Book_Price IN(2000,1200);
 
 -- GET THE DETAILS OF THE BOOKS SO WHICH HAS COST HIGHER THEN AVERAGE COST
 
 SELECT AVG(Book_Price)
 FROM book_details;
 
 SELECT *
 FROM book_details
 WHERE Book_Price >=
 (SELECT AVG(Book_Price)
 FROM book_details);
 
 -- OR
 
 SELECT Book_Price
 FROM book_details
 WHERE Book_Price > ( SELECT AVG(Book_Price)
 FROM book_details);
 
 SELECT * 
 FROM book_details
 WHERE Book_Price
 IN(SELECT Book_Price
 FROM book_details
 WHERE Book_Price > ( SELECT AVG(Book_Price)
 FROM book_details));
 
 -- TO GET THE DETAILS OF THE OOK NAME WHCIH HAS PUSLISH YEAR GRETAER THAN 2005
 
 SELECT Book_Name
 FROM book_details
 WHERE Publish_Year > '2005';
 
 SELECT *
 FROM book_details
 WHERE Book_Name 
 IN(SELECT Book_Name
 FROM book_details
 WHERE Publish_Year > '2005');
 
 -- OR
 
 SELECT *
 FROM book_details
 WHERE Book_Name
 IN(SELECT Book_Name
 FROM book_details
 GROUP BY Publish_Year
 HAVING Publish_Year >= 2005);
 
 
DELETE FROM book_details
WHERE Book_Name = (SELECT Book_Name
				FROM Books);

CREATE TABLE Books (
	Book_id TINYINT,
    Book_Name VARCHAR(30),
    Book_Author VARCHAR(30),
    Book_Price FLOAT,
    Publish_Year  YEAR,
    Volume CHAR(5)
);

SELECT *
FROM books;

INSERT INTO books
SELECT *
FROM book_details
WHERE Book_id IN(SELECT Book_id
FROM book_details);

UPDATE book_details
SET Book_Price = Book_Price + 100
WHERE Book_Name
IN(SELECT Book_name
FROM Books);

DELETE 
FROM book_details
WHERE Book_id
IN(SELECT Book_id 
FROM books
WHERE Book_id < 8);

SELECT *
FROM book_details;

SELECT USER,HOST FROM mysql.user; -- to see the users and host

-- creating a user 

CREATE USER 'TempUser'@'localhost';

SHOW GRANTS FOR 'TempUser'@'localhost';

GRANT SELECT,UPDATE ON book_details TO 'TempUser'@'localhost';

GRANT USAGE ON *.* TO `TempUser`@`localhost`; -- grants all the permission

GRANT ALL ON book_details TO `TempUser`@`localhost`;

REVOKE CREATE,DELETE ON book_details FROM 'TempUser'@'localhost';



