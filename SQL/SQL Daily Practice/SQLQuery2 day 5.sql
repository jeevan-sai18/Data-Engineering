create database practise2;
use practise2;

CREATE TABLE raw_data (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2),
    registration_date DATE
);

INSERT INTO raw_data (id, name, age, salary, registration_date)
VALUES
    (1, 'John Doe', 30, 50000.00, '2022-01-01'),
    (2, 'Alice Smith', NULL, 60000.50, '2022-02-15'),
    (3, 'Bob Johnson', 25, 75000.75, NULL),
    (4, 'Eve Williams', 40, 80000.00, '2022-03-20');

select * from raw_data;

-- Replace NULL age with 0
UPDATE raw_data
SET age = 0
WHERE age IS NULL;

-- Replace NULL registration_date with '1900-01-01'
UPDATE raw_data
SET registration_date = '1900-01-01'
WHERE registration_date IS NULL;

select * from raw_data;

-- Add a new column 'monthly_salary' calculated from 'salary'
ALTER TABLE raw_data
ADD monthly_salary DECIMAL(10, 2);

-- Update 'monthly_salary' by dividing 'salary' by 12
UPDATE raw_data
SET monthly_salary = salary / 12;

select * from raw_data;

-- Convert 'name' to uppercase
UPDATE raw_data
SET name = UPPER(name);


-- Remove records with age less than 0 or salary less than 0
DELETE FROM raw_data
WHERE age <= 0 OR salary <= 0;

-- Add a new column 'registration_year' extracted from 'registration_date'
ALTER TABLE raw_data
ADD registration_year INT;

UPDATE raw_data
SET registration_year = YEAR(registration_date);
-- Calculate average age by registration year
SELECT registration_year, AVG(age) AS average_age
FROM raw_data
GROUP BY registration_year;

select * from raw_data;

-- ranking functions

-- Add a new column 'row_num' to store the row number
ALTER TABLE raw_data
ADD row_num INT;

-- Use a common table expression (CTE) with ROW_NUMBER() to assign a unique row number
WITH NumberedRows AS (
    SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn
    FROM raw_data
)
UPDATE raw_data
SET row_num = NumberedRows.rn
FROM raw_data
JOIN NumberedRows ON raw_data.id = NumberedRows.id;
-- Display the result
SELECT * FROM raw_data;



-- Add a new column 'salary_rank' to store the rank based on salary
ALTER TABLE raw_data
ADD salary_rank INT;

-- Use a common table expression (CTE) with RANK() to assign ranks based on salary
WITH RankedSalaries AS (
    SELECT id, RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM raw_data
)
UPDATE raw_data
SET salary_rank = RankedSalaries.rnk
FROM raw_data
JOIN RankedSalaries ON raw_data.id = RankedSalaries.id;

-- Display the result
SELECT * FROM raw_data;



-- Add a new column 'age_dense_rank' to store the dense rank based on age
ALTER TABLE raw_data
ADD age_dense_rank INT;

-- Use a common table expression (CTE) with DENSE_RANK() to assign dense ranks based on age
WITH DenseRankedAges AS (
    SELECT id, DENSE_RANK() OVER (ORDER BY age) AS dense_rnk
    FROM raw_data
)
UPDATE raw_data
SET age_dense_rank = DenseRankedAges.dense_rnk
FROM raw_data
JOIN DenseRankedAges ON raw_data.id = DenseRankedAges.id;

-- Display the result
SELECT * FROM raw_data;

-- Stored procedure

-- Create a new table 'employee_data'
CREATE TABLE employee_data (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_age INT,
    emp_salary DECIMAL(10, 2),
    emp_registration_date DATE
);

-- Insert values into 'employee_data'
INSERT INTO employee_data (emp_id, emp_name, emp_age, emp_salary, emp_registration_date)
VALUES
    (1, 'John Doe', 30, 50000.00, '2022-01-01'),
    (2, 'Alice Smith', 25, 60000.50, '2022-02-15'),
    (3, 'Bob Johnson', 35, 75000.75, '2022-03-20'),
    (4, 'Eve Williams', 40, 80000.00, '2022-04-10');

-- Create a stored procedure for 'SelectEmployeesByAgee' with a parameter
CREATE PROCEDURE SelectEmployeesByAgee
    @Age INT
AS
BEGIN
    -- Use a different name for the parameter inside the stored procedure
    DECLARE @TargetAge INT;
    SET @TargetAge = @Age;

    -- Select employees based on the specified age
    SELECT * FROM employee_data WHERE emp_age = @TargetAge;
END;

EXEC SelectEmployeesByAgee @Age = 30;

