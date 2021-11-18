CREATE DATABASE limeroad;

USE limeroad;

CREATE TABLE customer_details(
customer_id INT,
customer_Name VARCHAR(30) NOT NULL,
customer_Email VARCHAR(40) UNIQUE,
customer_Phone BIGINT UNIQUE,
customer_Address VARCHAR(50),
PRIMARY KEY(customer_id)
);

DESCRIBE customer_details;

INSERT INTO customer_details
VALUE(1, 'Akshay', 'akshay@gmail.com', 9876543219, 'Bagalkot'),(2, 'Akash', 'akash@gmail.com', 9876541256, 'Vijaypur'),(3, 'Prasanna', 'prasanna@gmail.com', 7755543219, 'Hubli'),
(4, 'prateek', 'prateek@gmail.com', 9745862456, 'Belgavi'),(5, 'Manoj', 'manoj@gmail.com', 7456845785, 'Assan'),
(6, 'Megharaj', 'megharaj@gmail.com', 8654412256, 'Dharwad'),(7, 'Krishna', 'krishna@gmail.com', 755466985, 'shivmoga'),
(8, 'Akshay', 'kavya@gmail.com', 6695874525, 'Raichur'),(9, 'Anup', 'anup@gmail.com', 7554526659, 'Bangalore'),
(10, 'Rohan', 'rohan@gmail.com', 9888566984, 'Mysore');

SELECT * 
FROM customer_details;

CREATE TABLE orders(
order_id INT,
product_Name VARCHAR(30) NOT NULL,
order_Amount DECIMAL CHECK(order_Amount > 100),
order_DateTime DATETIME,
customer_ref INT,
PRIMARY KEY(order_id),
FOREIGN KEY(customer_ref) REFERENCES customer_details(customer_id)
);

DESCRIBE orders;

SELECT *
FROM orders;

INSERT INTO orders
VALUE(100,'Headphone', 1200.00,'2021-11-10 10:00:00',1);

INSERT INTO orders
VALUE(101,'Sony Speakers', 5000.00,'2021-11-12 02:00:00',2);

INSERT INTO orders
VALUE(102,'Ipad', 80000.00,'2021-11-12 11:00:00',3),
		(103,'MI TV', 15000.00,'2021-11-15 09:00:00',4),
        (104,'Watch', 5500.00,'2021-11-10 10:30:00',5),
        (105,'Charger', 1600.00,'2021-11-11 20:00:00',6),
        (106,'"Mouse"', 999.00,'2021-11-16 21:00:00',7),
        (107,'LED Buld', 599.00,'2021-11-15 22:00:00',8),
        (108,'RGB Light', 1999.00,'2021-11-10 23:00:00',9),
        (109,'Sweat Shirt', 899.00,'2021-11-13 01:00:00',10),
        (110,'Extension Box', 190.00,'2021-11-12 01:30:00',9),
        (111,'Jean Pants', 1500.00,'2021-11-14 15:10:00',10);
        
UPDATE orders SET customer_ref = 4 WHERE order_id = 107;

INSERT INTO orders(order_id,product_Name,order_Amount,order_DateTime)
VALUE(112,'Sony Speakers', 5000.00,'2021-11-12 02:00:00');

SELECT *
FROM customer_details 
WHERE customer_id = 1;

SELECT O.order_id, O.product_Name, O.order_amount, O.customer_ref, C.customer_id,C.customer_Name, C.customer_Email
FROM customer_details C INNER JOIN orders O
ON O.customer_ref = C.customer_id;

-- Get all the custome details from customer table and get only matching order details

SELECT * 
FROM customer_details C LEFT JOIN orders O
ON O.customer_ref = C.customer_id;

SELECT * 
FROM customer_details C RIGHT JOIN orders O
ON O.customer_ref = C.customer_id;

-- FULL JOIN

SELECT * 
FROM customer_details C LEFT JOIN orders O
ON O.customer_ref = C.customer_id 
UNION ALL
SELECT * 
FROM customer_details C RIGHT JOIN orders O
ON O.customer_ref = C.customer_id;


CREATE TABLE offers(
offer_id INT,
offer_Name VARCHAR(20) NOT NULL,
offer_Percentage DECIMAL CHECK (offer_Percentage<50),
offer_ratings INT,
offer_ref INT,
PRIMARY KEY(offer_id),
FOREIGN KEY(offer_ref) REFERENCES orders(order_id)
);

INSERT INTO offers(offer_id, offer_Name, offer_Percentage, offer_ratings)
VALUE(1, 'Diwali Offer', 15, 5);

SELECT *
FROM offers;

-- CROSS JOINING THE OFFERS AND ORDERS
SELECT *
FROM orders
CROSS JOIN offers;

-- VIEW

CREATE VIEW speaker_orders AS
SELECT *
FROM orders
WHERE product_Name
LIKE 'Sony Speakers';

SELECT *
FROM speaker_orders;

SELECT *
FROM speaker_orders
WHERE order_id = 101;

ALTER VIEW speaker_orders
AS SELECT *
FROM orders
WHERE product_Name = 'Sony Speakers';

CREATE VIEW offers_given
AS SELECT * 
FROM orders
CROSS JOIN offers;

SELECT *
FROM offers_given;

SELECT *
FROM offers_given
WHERE order_Amount > 6000;

-- TO DROP THE VIEW
DROP VIEW offers_given;