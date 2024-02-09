create database sqlcodingchallenge1;

use sqlcodingchallenge1;

-- Create a sample table
CREATE TABLE Sales (
    ProductID INT,
    SalesDate DATE,
    Amount DECIMAL(10, 2)
);


-- Insert sample values
INSERT INTO Sales VALUES
(1, '2024-01-01', 100),
(1, '2024-01-02', 150),
(2, '2024-01-01', 200),
(2, '2024-01-02', 250),
(1, '2024-01-03', 120),
(2, '2024-01-03', 180);

SELECT * FROM SALES;

-- Calculate total sales and subtotal by product using OVER and PARTITION BY
SELECT
    ProductID,
    SalesDate,
    Amount,
    SUM(Amount) OVER (PARTITION BY ProductID ORDER BY SalesDate) AS SubtotalByProduct,
    SUM(Amount) OVER (ORDER BY SalesDate) AS TotalSales
FROM
    Sales;

-- Calculate RNK USING OVERBY AND PARTITIONBY
SELECT
    ProductID,
    SalesDate,
    Amount,
    rank() OVER (PARTITION BY ProductID ORDER BY SalesDate) AS RNK
FROM
    Sales;


-- Calculate various aggregate functions with and without OVER and PARTITION BY clauses

SELECT
    ProductID,
    SalesDate,
    Amount,
    SUM(Amount) OVER (PARTITION BY ProductID ORDER BY SalesDate) AS SubtotalByProduct,
    AVG(Amount) OVER (PARTITION BY ProductID ORDER BY SalesDate) AS AvgByProduct,
    MAX(Amount) OVER (PARTITION BY ProductID ORDER BY SalesDate) AS MaxByProduct,
    MIN(Amount) OVER (PARTITION BY ProductID ORDER BY SalesDate) AS MinByProduct,
    COUNT(*) OVER (PARTITION BY ProductID ORDER BY SalesDate) AS CountByProduct,
    SUM(Amount) OVER (ORDER BY SalesDate) AS TotalSales,
    AVG(Amount) OVER (ORDER BY SalesDate) AS AvgTotal,
    MAX(Amount) OVER (ORDER BY SalesDate) AS MaxTotal,
    MIN(Amount) OVER (ORDER BY SalesDate) AS MinTotal,
    COUNT(*) OVER (ORDER BY SalesDate) AS CountTotal
FROM
    Sales;



-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);
-- Insert sample values into Students table
INSERT INTO Students VALUES
(1, 'Alice', 22, 'Computer Science'),
(2, 'Bob', 20, 'Mathematics'),
(3, 'Charlie', 21, 'Physics'),
(4, 'David', 23, 'Computer Science');

-- Insert sample values into Courses table
INSERT INTO Courses VALUES
(101, 'Database Systems'),
(102, 'Calculus'),
(103, 'Mechanics');

select * from Students;
select * from Courses;

-- Add StudentCourseID column to Students table
ALTER TABLE Students
ADD StudentCourseIDD INT;

-- Add StudentCourseID column to Courses table with a different name
ALTER TABLE Courses
ADD StudentCourseID_Courses INT;

-- Update StudentCourseID values in Students table
UPDATE Students
SET StudentCourseID = 101 WHERE StudentID = 1;

UPDATE Students
SET StudentCourseID = 102 WHERE StudentID = 2;

UPDATE Students
SET StudentCourseID = 103 WHERE StudentID = 3;

UPDATE Students
SET StudentCourseID = 101 WHERE StudentID = 4;

-- Update StudentCourseID values in Courses table
UPDATE Courses
SET StudentCourseID = 101 WHERE CourseID = 101;

UPDATE Courses
SET StudentCourseID = 102 WHERE CourseID = 102;

UPDATE Courses
SET StudentCourseID = 103 WHERE CourseID = 103;



-- Inner join

-- INNER JOIN example with the corrected join condition
SELECT *
FROM Students
INNER JOIN Courses ON Students.StudentCourseID = Courses.StudentCourseID;

-- LEFT JOIN example
SELECT *
FROM Students
LEFT JOIN Courses ON Students.StudentCourseID = Courses.StudentCourseID;

-- RIGHT JOIN example
SELECT *
FROM Students
RIGHT JOIN Courses ON Students.StudentID = Courses.CourseID;

-- FULL JOIN example
SELECT *
FROM Students
FULL JOIN Courses ON Students.StudentID = Courses.CourseID;

-- CROSS JOIN example
SELECT *
FROM Students
CROSS JOIN Courses;
