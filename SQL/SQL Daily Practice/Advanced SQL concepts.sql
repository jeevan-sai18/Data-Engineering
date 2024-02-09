use [practise2];

-- Creating a table
CREATE TABLE Sales (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Amount INT
);

-- Inserting data
INSERT INTO Sales (Region, Product, Amount)
VALUES
    ('East', 'Product_A', 100),
    ('East', 'Product_B', 150),
    ('West', 'Product_A', 120),
    ('West', 'Product_B', 180),
    ('North', 'Product_A', 90),
    ('North', 'Product_B', 130),
    ('South', 'Product_A', 110),
    ('South', 'Product_B', 160);

select * from Sales;
    
-- Using ROLLUP to get subtotals
SELECT Region, Product, SUM(Amount) AS TotalAmount
FROM Sales
GROUP BY ROLLUP (Region, Product);

-- Stored procedure

select * from employee_data;

create procedure allrecords
as
select * from employee_data
go;

exec allrecords;

-- stored procedure for one parameter

create procedure emp1 @emp_salary decimal(10,2)
as
select * from employee_data where emp_salary = @emp_salary;

exec emp1 @emp_salary=50000;

-- stored procedure for two parameters

create procedure emp2 @emp_salary decimal(10,2), @emp_age int
as
select * from employee_data where emp_salary = @emp_salary And emp_age=@emp_age;

exec emp2 @emp_salary=50000,@emp_age=30;

-- over by and partition by

SELECT
    Region,
    Product,
    Amount,
    ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Amount DESC) AS RowNum
FROM
    Sales;

-- Using various aggregate functions with PARTITION BY
SELECT
    Region,
    Product,
    Amount,
    SUM(Amount) OVER (PARTITION BY Region) AS TotalAmountPerRegion,
    AVG(Amount) OVER (PARTITION BY Region) AS AvgAmountPerRegion,
    MAX(Amount) OVER (PARTITION BY Region) AS MaxAmountPerRegion,
    MIN(Amount) OVER (PARTITION BY Region) AS MinAmountPerRegion,
    COUNT(*) OVER (PARTITION BY Region) AS CountPerRegion
FROM
    Sales;

-- Creating a sample table
CREATE TABLE ExamScores (
    StudentID INT,
    Subject VARCHAR(50),
    Score INT
);

-- Inserting data
INSERT INTO ExamScores (StudentID, Subject, Score)
VALUES
    (1, 'Math', 80),
    (1, 'English', 90),
    (2, 'Math', 85),
    (2, 'English', 92),
    (3, 'Math', 78),
    (3, 'English', 88),
    (4, 'Math', 92),
    (4, 'English', 95);
select * from ExamScores;

-- Using RANK(), DENSE_RANK(), and ROW_NUMBER()
SELECT
    StudentID,
    Subject,
    Score,
    RANK() OVER (ORDER BY Score DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY Score DESC) AS DenseRank,
    ROW_NUMBER() OVER (ORDER BY Score DESC) AS RowNum
FROM
    ExamScores;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

-- Insert some sample values
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department)
VALUES
    (1, 'John', 'Doe', 30, 'IT'),
    (2, 'Jane', 'Smith', 25, 'HR'),
    (3, 'Bob', 'Johnson', 35, 'Finance');

-- Create a view based on the Employees table
CREATE VIEW EmployeeView AS
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Age,
    Department
FROM
    Employees;

select * from EmployeeView;

-- Creating a materialized view
CREATE MATERIALIZED VIEW SalesSummary AS
SELECT
    Region,
    SUM(Amount) AS TotalAmount
FROM
    Sales
GROUP BY
    Region;

-- Star schema

-- Creating a star schema for sales data
CREATE TABLE FactSales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT
);

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Region VARCHAR(50)
);

CREATE TABLE DimCategory (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Creating a snowflake schema for sales data
CREATE TABLE FactSales1 (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

CREATE TABLE DimProduct1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT
);

CREATE TABLE DimCategory1 (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE DimProductSubcategory (
    SubcategoryID INT PRIMARY KEY,
    SubcategoryName VARCHAR(50),
    CategoryID INT
);

