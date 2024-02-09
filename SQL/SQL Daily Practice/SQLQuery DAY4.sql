create database practise;
use practise;

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(255),
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert values into the Products table
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
    (1, 'Chais', 1, 1, '10 boxes x 20 bags', 18),
    (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19),
    (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
    (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22),
    (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35),
    (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25),
    (7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30),
    (8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40),
    (9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

-- Insert values into the OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 10248, 11, 12),
    (2, 10248, 42, 10),
    (3, 10248, 72, 5),
    (4, 10249, 14, 9),
    (5, 10249, 51, 40),
    (6, 10250, 41, 10),
    (7, 10250, 51, 35),
    (8, 10250, 65, 15),
    (9, 10251, 22, 6),
    (10, 10251, 57, 15);
SELECT * FROM orderdetails;
SELECT * FROM products;

SELECT ProductName
FROM products
WHERE ProductID IN
  (SELECT OrderDetailID
  FROM orderdetails
  WHERE Quantity = 10);


SELECT ProductName
FROM products
WHERE ProductID NOT IN
  (SELECT OrderDetailID
  FROM orderdetails
  WHERE Quantity = 10);


-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Email VARCHAR(255)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductName VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert values into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Email)
VALUES
    (1, 'John Doe', 'john@example.com'),
    (2, 'Jane Smith', 'jane@example.com'),
    (3, 'Bob Johnson', 'bob@example.com');

-- Insert values into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductName, Quantity)
VALUES
    (101, 1, 'Chais', 2),
    (102, 2, 'Aniseed Syrup', 5),
    (103, 3, 'Chang', 3),
    (104, 1, 'Chef Anton''s Cajun Seasoning', 1),
    (105, 2, 'Chais', 4);

SELECT CustomerName
FROM Customers
WHERE EXISTS (
    SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

SELECT CustomerName
FROM Customers
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

SELECT CustomerName
FROM Customers
WHERE CustomerID = ANY (
    SELECT CustomerID
    FROM Orders
    WHERE ProductName = 'Chais'
);
select * from orders;
select * from customers;
SELECT OrderID, ProductName
FROM Orders
WHERE Quantity > ANY (
    SELECT Quantity
    FROM Orders
    WHERE OrderID = 101
);

SELECT OrderID, ProductName
FROM Orders
WHERE Quantity > ALL (
    SELECT Quantity
    FROM Orders
    WHERE OrderID = 101
);






-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
    (1, 'John', 'Doe', 1, 60000),
    (2, 'Jane', 'Smith', 2, 75000),
    (3, 'Bob', 'Johnson', 1, 55000),
    (4, 'Alice', 'Williams', 3, 80000);

-- Verify Data
SELECT * FROM Departments;
SELECT * FROM Employees;


-- AGGREGATE FUNCTIONS

SELECT DepartmentID, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY DepartmentID;

SELECT DISTINCT DepartmentID
FROM Employees;


SELECT DepartmentID, MAX(Salary) AS Max_Salary
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID, MIN(Salary) AS Min_Salary
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY DepartmentID;


-- group by 

SELECT DepartmentID, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY DepartmentID;

-- ORDER BY

SELECT * 
FROM Employees
ORDER BY DepartmentID;

SELECT DepartmentID, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY DepartmentID
ORDER BY Average_Salary DESC;

-- SUB QUERIES

-- EXISTS

SELECT EmployeeID, FirstName, LastName
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Departments d
    WHERE d.DepartmentID = e.DepartmentID
    AND d.DepartmentName = 'HR'
);

-- NOT EXISTS

SELECT EmployeeID, FirstName, LastName
FROM Employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM Departments d
    WHERE d.DepartmentID = e.DepartmentID
    AND d.DepartmentName = 'HR'
);

-- ANY

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE Salary > ANY (
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID
        FROM Departments
        WHERE DepartmentName = 'IT'
    )
);

-- ALL

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID
        FROM Departments
        WHERE DepartmentName = 'IT'
    )
);











-- Retrieve length of first names
SELECT FirstName, LEN(FirstName) AS FirstName_Length
FROM Employees;


-- ASCII function: Return leftmost ASCII value
SELECT ASCII('BA');

-- CHAR function: Return ASCII value to character
SELECT CHAR(67);


-- LEN function: Return length
SELECT LEN('Jeevan Sai');



-- LOWER function: Convert to lowercase
SELECT LOWER('JEEVAN');


-- REPLACE function: Replace
SELECT REPLACE('Microsoft SQL', 'SQL', 'Server');


-- REVERSE function: Reverse the string
SELECT REVERSE('python');

-- UPPER function: Converts to upper
SELECT UPPER('jeevan');

-- STR function: Convert number to string
SELECT STR(136.564, 8, 4);


-- GETDATE function: Get current date and time
SELECT GETDATE();

-- DATEADD function: Add months to an existing date
SELECT DATEADD(MM, 2, '2023-12-07');

-- DATEDIFF function: Return the difference of date in years
SELECT DATEDIFF(YEAR, CONVERT(DATETIME, '2006-03-06'), CONVERT(DATETIME, '2010-09-01'));

-- DATEPART function: Return months value
SELECT DATEPART(MM, '2024-01-22');

-- DAY function: Return day value
SELECT DAY('2024-01-22');

-- MONTH function: Return month value
SELECT MONTH('2024-01-22');

-- YEAR function: Return year value
SELECT YEAR('2024-01-22');

-- ABS function: Returns absolute value
SELECT ABS(-101);

-- SIN function: Returns sine value (angle in radians)
SELECT SIN(1.5);

-- CEILING function: Returns the smallest integer greater than or equal to the specified value
SELECT CEILING(14.01);

-- EXP function: Returns the exponential value
SELECT EXP(4.5);

-- FLOOR function: Returns the largest integer less than or equal to the specified value
SELECT FLOOR(14.75);

-- LOG function: Returns the logarithmic value
SELECT LOG(5.4);
