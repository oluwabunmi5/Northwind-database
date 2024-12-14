USE northwind;

-- answer 1 (returning the CategoryName and Description from the categories table sorted by CategoryName)
SELECT CategoryName, Description
FROM categories
ORDER BY CategoryName;

-- answer 2 (returning the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.)
SELECT ContactName, CompanyName, ContactTitle, Phone 
FROM customers
ORDER BY Phone;

-- answer 3 (returning the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
 -- respectively and HireDate from the employees table sorted from the newest to the oldest employee.)
SELECT upper(FirstName) AS "FirstName", upper(LastName) AS "Lastname", HireDate
FROM employees
ORDER BY EmployeeID DESC;

-- answer 4 (Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted
 -- by Freight in descending order)
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM orders
ORDER BY Freight DESC
LIMIT 10;

-- answer 5 (Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table)
SELECT lower(CustomerID) AS "ID"
FROM customers;

-- answer 6 (Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the
-- Country in descending order then by CompanyName in ascending order.)
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM suppliers
ORDER BY Country DESC, CompanyName ASC;

-- answer 7 (Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.)
SELECT CompanyName, ContactName, City
FROM customers
WHERE City = "Buenos Aires";

-- answer 8 (Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock)
SELECT ProductName, UnitPrice, QuantityPerUnit, ProductID
FROM products
WHERE ProductID NOT IN ("UnitsInStock");

-- answer 9 (Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain)
SELECT ContactName, Address, City, CustomerID
FROM customers
WHERE CustomerID NOT IN ("Germany", "Mexico", "Spain");

-- answer 10 (Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996)
SELECT OrderDate, ShippedDate, CustomerID, Freight
FROM orders
WHERE OrderDate IN ("1996-05-21 00:00:00");

-- answer 11 (Create a report showing FirstName, LastName, Country from the employees not from United States.)
SELECT FirstName, LastName, Country
FROM employees
WHERE Country NOT IN ("USA");

-- answer 12 (Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later
-- than the required date.)
SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM orders
WHERE ShippedDate > RequiredDate;

-- answer 13 (Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B)
SELECT City, CompanyName, ContactName, CustomerID
FROM customers
WHERE City LIKE "A%" OR City LIKE "B%";

-- answer 14 (returning all the even mumbers of orderid from the orders table)
SELECT OrderID
FROM orders
WHERE OrderID % 2 = 0;

-- answer 15 (returning  all the orders where the freight cost more than $500)
SELECT OrderID, Freight
FROM orders
WHERE Freight > 500;

-- answer 16 (returning the ProductName, UnitsinStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder)
SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM products
WHERE UnitsInStock <= ReorderLevel;

-- answer 17 (returning the CompanyName, ContactName number of all customers that has no fax number)
SELECT CompanyName, ContactName, Phone, Fax
FROM customers
WHERE Fax IS NULL;

-- answer 18( returning the FirstName, LastName of all employees that do not report to anybody)
SELECT FirstName, LastName, ReportsTo
FROM employees
WHERE ReportsTo IS NULL;

-- answer 19 (returning all the odd numbers of orderid from the orders table)
SELECT OrderID
FROM orders
WHERE OrderID % 2 <> 0;

-- ANSWER 20 (returning the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName)
SELECT CompanyName, ContactName, Fax
FROM customers
WHERE Fax IS NULL 
ORDER BY ContactName;

-- answer 21  (returning the city, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName )
SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE "%L%"
ORDER BY ContactName;

-- answer 22 (returning FirstName, LastName, BirthDate of employees born in the 1950's)
SELECT FirstName, LastName, BirthDate
FROM employees
WHERE BirthDate BETWEEN "1950-01-01" AND "1959-12-31";

-- answer 23 (returning the FirstName, LastName, the year of BirthDate as birth year from the employees table)
SELECT FirstName, LastName, year(BirthDate) AS "birth year"
FROM employees;

-- answer 24 (returning the OrderId, total number of OrderID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order
SELECT OrderID, count(OrderID) AS NumberofOrders
FROM `order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

-- answer 25 ( returning the supplierID, ProductName, CompanyName from all product supplied by exotic liquids,
-- specialty biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
SELECT s.SupplierID, p.ProductName, s.CompanyName
FROM products AS p
JOIN Suppliers as s on p.SupplierID = s.SupplierID
WHERE s.CompanyName IN ("Exotic Liquids", "Specialty Biscuits, Ltd.","Escargots Nouveaux")
ORDER BY s.SupplierID;

-- answer 26 (returning the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with 98124
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM orders
WHERE ShipPostalCode LIKE "98124%";

-- answer 27(returning the ContactName, ContactTitle, CompanyName of customers that has no "sales" in their ContactTitle
SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%sales%";

-- answer 28 (returning the LastName, FirstName, City of employees in cities other "Seattle"
SELECT LastName, FirstName, City
FROM employees
WHERE City NOT IN ("Seattle");

-- answer 29 (returning the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in spain other than madrid
SELECT CompanyName, ContactTitle, City, Country
FROM customers
WHERE City IN ("Mexico") AND City IN ("Spain") AND City NOT IN ("Madrid");

-- answer 30 
SELECT concat(FirstName," ",LastName," ","can be reached at"," ","x",Extension) AS Contactinfo
FROM employees;

-- answer 31 (returning the ContactName of all customers that do not have letter A as the second alphabet in their Contactname)
SELECT ContactName
FROM customers
WHERE ContactName NOT LIKE "_a%";

-- answer 32 (returning the average UnitPrice rounded to the next whole number, total price of UnitsInStock and 
-- maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively)
SELECT round(avg(UnitPrice)) AS "AveragePrice", sum(UnitPrice * UnitsInStock) AS "TotalStock", max(UnitsOnOrder) AS "MaxOrder"
FROM products;

-- answer 33 ( retuning the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table)
SELECT s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, UnitPrice
FROM products as p 
JOIN suppliers as s on p.SupplierID = s.SupplierID
JOIN categories as c on p.CategoryID = c.CategoryID;

-- answer 34 (returning the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped 
-- by CustomerID. HINT: you will need to use a Groupby and a Having statement)
SELECT CustomerID, sum(Freight)
FROM orders
GROUP BY CustomerID
HAVING sum(Freight) > 200;

-- answer 35 (returning the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase)
SELECT o.OrderID, c.ContactName, d.UnitPrice, d.Quantity, d.Discount
FROM `order details` as d
JOIN orders as o on d.OrderID = o.OrderID
JOIN customers as c on o.CustomerID = c.CustomerID;

-- answer 36 ( returning the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager
-- from the employees table sorted by Employee ID. HINT: This is a SelfJoin)
SELECT e.EmployeeID, e.LastName, e.FirstName AS "Employee" , concat(m.firstname," ",m.lastname) AS manager
FROM employees as e
JOIN employees as M on e.employeeid = M.ReportsTo
ORDER BY e.EmployeeID;

-- answer 37 (returning the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively)
SELECT avg(UnitPrice) AS AveragePrice, min(UnitPrice) AS MinimumPrice, max(UnitPrice) AS MaximumPrice
FROM PRODUCTS;

-- answer 38 (Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, 
-- Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View)
CREATE VIEW CustomerInfo AS
SELECT c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
FROM customers as c
JOIN orders as o on c.CustomerID = o.CustomerID;

-- answer 39 (Change the name of the view you created from customerinfo to customer details)
CREATE VIEW Customer_details AS
SELECT *
FROM customerinfo;

-- answer 40 (Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, 
-- QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View)
CREATE VIEW ProductDetails AS
SELECT P.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.Description, P.QuantityPerUnit, P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel, P.Discontinued
FROM products as p
JOIN suppliers as s on p.SupplierID = s.SupplierID
JOIN categories as c on p.CategoryID = c.CategoryID;

-- answer 41 (Drop the customer details view)
DROP VIEW customer_details;

-- answer 42 (returning the first 5 character of categoryName from the category tables and renamed as ShortInfo)
SELECT LEFT (CategoryName,5) AS ShortInfo
FROM categories;

-- answer 43 (Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table
-- HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.
CREATE TABLE shippers_duplicate LIKE shippers;
INSERT INTO shippers_duplicate
SELECT *
FROM shippers;

-- answer 44 (Create a select statement that outputs the following from the shippers_duplicate Table
SELECT shipperID, CompanyName, Phone, concat(CompanyName,"@gmail.com") AS Email
FROM shippers_duplicate;

-- answer 45 (Create a report that shows the CompanyName and ProductName from all product in the Seafood category
SELECT s.CompanyName, p.ProductName, c.CategoryName
FROM products as p
JOIN suppliers as s on p.supplierID = s.supplierID
JOIN categories as c on p.CategoryID = c.CategoryID
WHERE CategoryName = "seafood";

-- answer 46 (Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
SELECT p.CategoryID, s.CompanyName, p.ProductName 
FROM products as p
JOIN suppliers as s on p.SupplierID = s.SupplierID
WHERE CategoryID = 5;

-- answer 47 (Delete the shippers_duplicate table)
DROP TABLE shippers_duplicate;

-- answer 48 (Create a select statement that ouputs the following from the employees table.NB: The age might differ depending on the year you are attempting this query
SELECT LastName, FirstName, Title, (year(now())- year(BirthDate)) AS "Age"
FROM employees;

-- answer 49 (Create a report that the CompanyName and total number of orders by customer renamed as number of orders since
-- Decemeber 31, 1994. Show number of Orders greater than 10)
SELECT c.CompanyName, count(OD.OrderID) AS "number of orders since december 31 1994"
FROM `order details` AS OD
JOIN orders AS o on o.OrderID = OD.OrderID
JOIN customers as c on c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
HAVING count(OD.OrderID)>10;

-- Ans 50
SELECT concat(ProductName,"weighs/is"," ",QuantityPerUnit," ","and cost"," ","$", round(UnitPrice)) AS ProductInfo
FROM products;