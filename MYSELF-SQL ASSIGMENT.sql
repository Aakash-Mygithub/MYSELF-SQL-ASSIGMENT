USE [MYSELF-SQL ASSIGMENT]
----************************
Use [MYSELF-SQL ASSIGMENT]

--Module 1 SQL Mandatory Assignment 1

--QUESTION- 1. Insert a new record in your Orders table.

CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

ALTER TABLE Salesman ALTER column SalesmanId INT Not null

ALTER TABLE Salesman
ADD CONSTRAINT PK_Salesman PRIMARY KEY (SalesmanId);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

Select * from Salesman

--***
CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);
ALTER TABLE Salesman ALTER column SalesmanId INT Not null

ALTER TABLE Customer
ADD CONSTRAINT PK_Customer_SalesmanId PRIMARY KEY (SalesmanId);

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

Select * from Customer

--***
CREATE TABLE Orders 
(
OrderId int,
CustomerId int,
SalesmanId int,
Orderdate Date,
Amount money
)

Orders table record insertion 

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

Select * from Orders
---********************************

--QUESTION 1. Insert a new record in your Orders table
Insert into Orders( OrderId,CustomerId,SalesmanId,Orderdate,Amount)
Values (5004, 2244, 106,'2023-02-20', 2000)

--************************

--Add Primary key constraint for SalesmanId column in Salesman table. Add default
--constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
--column in Customer table. Add not null constraint in Customer_name column for the
--Customer table.


--QUESTION 2.Add Primary Key constraint for SalesmanId column

ALTER TABLE Salesman ALTER column SalesmanId INT Not null

ALTER TABLE Salesman
ADD CONSTRAINT PK_Salesman PRIMARY KEY (SalesmanId);


--QUESTION 2. Add Default constraint for City column
ALTER TABLE Salesman
ADD CONSTRAINT DF_Salesman_City DEFAULT ('Delhi') FOR City;

Select *from Salesman

--QUESTION 2. Add Foreign key constraint for SalesmanId
--column in Customer table.
ALTER TABLE Customer ALTER column SalesmanId INT Not null

ALTER TABLE Customer
ADD CONSTRAINT FK_Salesman FOREIGN KEY (SalesmanId);

ALTER TABLE Customer ADD CONSTRAINT FK_Customer_SalesmanId FOREIGN KEY (SalesmanId)
REFERENCES Customer(SalesmanId);

--QUESTION 2.Add not null constraint in Customer_name column for the
--Customer table.

ALTER TABLE Customer ALTER column SalesmanId INT Not null

--QUESTION 3.Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.

SELECT Salesman.name , Customer.Amount
FROM Salesman WHERE Name LIKE '%N' AND PurchaseAmount>500;

Select * from customer where CustomerName like '%N' and purchaseamount>500

 Select *from Customer
 Select *from Orders
 Select *from Salesman

 --QUESTION 4. Using SET operators, retrieve the first result with unique SalesmanId values from two
--tables, and the other result containing SalesmanId with duplicates from two tables.

SELECT SalesmanId
FROM (
    SELECT SalesmanId FROM Customer
    UNION ALL
    SELECT SalesmanId FROM Salesman
) AS CombinedSalesmen
GROUP BY SalesmanId
HAVING COUNT(*) = 1;

--5. Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City which has the
--range of Purchase Amount between 500 to 1500.
SELECT O.ORDERDATE, S.NAME,C.CUSTOMERNAME,S.COMMISSION ,S.CITY,C.PURCHASEAMOUNT 
FROM SALESMAN S INNER JOIN CUSTOMER C ON (S.SALESMANID=C.SALESMANID)
INNER JOIN ORDERS O ON (S.SALESMANID= O.SALESMANID)
WHERE C.PURCHASEAMOUNT BETWEEN 500 AND 1500;

SELECT*FROM SALESMAN;
SELECT *FROM CUSTOMER;
SELECT * FROM ORDERS;


--6. Using right join fetch all the results from Salesman and Orders table.

SELECT S.SALESMANID,S.NAME,S.COMMISSION,S.CITY,S.AGE,O.ORDERID,O.CUSTOMERID,O.ORDERDATE,O.AMOUNT
FROM SALESMAN S RIGHT OUTER JOIN ORDERS O ON (S.SALESMANID=O.SALESMANID);


SP_HELP SALESMAN;
SP_HELP CUSTOMER;

--******************************

Signature - Aakash
Email - akashmehra9069@gmail.com

