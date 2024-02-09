use xstream_db;

CREATE TABLE customer (
    CustomerID INT,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255)
);

INSERT INTO customer (CustomerID, CustomerName, ContactName, Address)
VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8');

SELECT * FROM Customer;

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),
   PRIMARY KEY (ID)
);
INSERT INTO CUSTOMERS VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'Hyderabad', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

select * from customers;

DELETE FROM CUSTOMERS WHERE AGE = 23;
COMMIT;
select * from customers;


START TRANSACTION;
DELETE FROM CUSTOMERS WHERE AGE = 25;
ROLLBACK;

SELECT *FROM t_employees UNION SELECT *FROM t2_employees;
SELECT *FROM t_students UNION SELECT *FROM t2_students;

SELECT *FROM t_employees UNION ALL SELECT *FROM t2_employees;
SELECT *FROM t_students UNION ALL SELECT *FROM t2_students;

SELECT *FROM t_employees INTERSECT SELECT *FROM t2_employees;
SELECT *FROM t_students INTERSECT SELECT *FROM t2_students;

select studentcourse.COURSE_ID,student.NAME,student.Age 
from studentcourse join student on studentcourse.ROLL_NO=student.ROLL_NO;

select student.NAME,studentcourse.COURSE_ID from student
left join studentcourse on student.ROLL_NO=studentcourse.ROLL_NO;

select student.NAME,studentcourse.COURSE_ID from student right join 
studentcourse on student.ROLL_NO=studentcourse.ROLL_NO;

select student.NAME,studentcourse.COURSE_ID from student
left join studentcourse on student.ROLL_NO=studentcourse.ROLL_NO
union
select student.NAME,studentcourse.COURSE_ID from student right join 
studentcourse on student.ROLL_NO=studentcourse.ROLL_NO;

SELECT studentcourse.COURSE_ID, student.NAME, student.Age 
FROM studentcourse
NATURAL JOIN student;

SELECT Student.ROLL_NO, Student.NAME, StudentCourse.COURSE_ID
FROM Student
JOIN StudentCourse ON Student.ROLL_NO = StudentCourse.ROLL_NO;

SELECT Student.ROLL_NO, Student.NAME, StudentCourse.COURSE_ID
FROM Student
JOIN StudentCourse ON Student.Age > 18;



