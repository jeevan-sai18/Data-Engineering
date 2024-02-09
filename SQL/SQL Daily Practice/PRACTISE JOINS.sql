create database practise;
use practise;
CREATE TABLE Student (
    ROLL_NO INT,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(50),
    PHONE VARCHAR(15),
    Age INT
);


INSERT INTO Student (ROLL_NO, NAME, ADDRESS, PHONE, Age)
VALUES 
    (1, 'HARSH', 'DELHI', '123456789', 18),
    (2, 'PRATIK', 'BIHAR', '123456798', 19),
    (3, 'RIYANKA', 'SILIGURI', '123456897', 20),
    (4, 'DEEP', 'RAMNAGAR', '123456987', 18),
    (5, 'SAPTARHI', 'KOLKATA', '213456789', 19),
    (6, 'DHANRAJ', 'BARABAJAR', '312456789', 20),
    (7, 'ROHIT', 'BALURGHAT', '412356789', 18),
    (8, 'NIRAJ', 'ALIPUR','112233445', 19);

CREATE TABLE StudentCourse (
    COURSE_ID INT,
    ROLL_NO INT
);
INSERT INTO StudentCourse (COURSE_ID, ROLL_NO)
VALUES 
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(1, 5),
(4, 9),
(5, 10),
(4,11);
select * from student;
select * from studentcourse;

select studentcourse.COURSE_ID,student.NAME,student.Age 
from studentcourse join student on studentcourse.ROLL_NO=student.ROLL_NO;

select student.NAME,studentcourse.COURSE_ID from student
left join studentcourse on student.ROLL_NO=studentcourse.ROLL_NO
union
select student.NAME,studentcourse.COURSE_ID from student right join 
studentcourse on student.ROLL_NO=studentcourse.ROLL_NO;

-- EQUI Join
SELECT Student.ROLL_NO, Student.NAME, StudentCourse.COURSE_ID
FROM Student
JOIN StudentCourse ON Student.ROLL_NO = StudentCourse.ROLL_NO;

-- NON-EQUI Join
SELECT Student.ROLL_NO, Student.NAME, StudentCourse.COURSE_ID
FROM Student
JOIN StudentCourse ON Student.Age > 18;

SELECT S.ROLL_NO, S.NAME, COUNT(SC.COURSE_ID) AS Enrolled_Courses
FROM Student S
INNER JOIN StudentCourse SC ON S.ROLL_NO = SC.ROLL_NO
GROUP BY S.ROLL_NO, S.NAME;

SELECT SC.COURSE_ID, COUNT(S.ROLL_NO) AS Students_Enrolled
FROM Student S
INNER JOIN StudentCourse SC ON S.ROLL_NO = SC.ROLL_NO
GROUP BY SC.COURSE_ID;

SELECT SC.COURSE_ID, AVG(S.Age) AS Average_Age
FROM Student S
INNER JOIN StudentCourse SC ON S.ROLL_NO = SC.ROLL_NO
GROUP BY SC.COURSE_ID;

SELECT SC.COURSE_ID, MAX(S.Age) AS Maximum_Age
FROM Student S
INNER JOIN StudentCourse SC ON S.ROLL_NO = SC.ROLL_NO
GROUP BY SC.COURSE_ID;







SELECT studentcourse.COURSE_ID, student.NAME, student.Age 
FROM studentcourse
NATURAL JOIN student;

-- Create the students table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    class INT,
    city VARCHAR(50)
);


INSERT INTO students (id, name, class, city)
VALUES
    (3, 'Hina', 3, 'Delhi'),
    (4, 'Megha', 2, 'Delhi'),
    (6, 'Gouri', 2, 'Delhi');
    
-- Create the record table
CREATE TABLE record (
    id INT,
    class INT,
    city VARCHAR(50)
);

INSERT INTO record (id, class, city)
VALUES
    (9, 3, 'Delhi'),
    (10, 2, 'Delhi'),
    (12, 2, 'Delhi');

SELECT students.name, students.id, record.class, record.city
FROM students
JOIN record
ON students.city = record.city;

-- Create the Products table
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
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000);

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


