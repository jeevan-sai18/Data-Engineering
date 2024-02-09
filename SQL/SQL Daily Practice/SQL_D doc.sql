create database pet_adoption;
use pet_adoption;
CREATE TABLE animals
(id VARCHAR(100) Not null,
  name VARCHAR(200),
  breed VARCHAR(200),
  color VARCHAR(200),
  gender VARCHAR(200),
  status TINYINT(1) NOT null
);

CREATE TABLE adoptions (
    animal_id varchar(100) NOT NULL,
    name varchar(200),
    contact varchar(200),
    date TIMESTAMP
);
SHOW TABLES;
INSERT INTO animals (id, name, breed, color, gender, status)
 VALUES 
 ('89354034-20d9-4c3d-8195-3294bfd9dbc5', 'Bellyflop', 'Beagle', 'Brown', 'Male', 0),
('ae91cf1c-f972-4213-8160-6c04d935699c', 'Snowy', 'Husky', 'White', 'Female', 0),
('37df3388-b0f4-4f0d-b6ef-0d840923a4d8', 'Princess', 'Pomeranian', 'Black', 'Female', 0),
('94545432-d27a-4ac8-ab7c-3827d7535f3', 'Cricket', 'Chihuahua', 'Brown', 'Male', 0),
('a1e7a7fc-b429-41ec-9924-8bb39dd397c8', 'Princess', 'Poodle', 'Purple', 'Female', 0),
('5138ed53-2ab2-400b-973c-91186f8c673d', 'Spot', 'Dalmation', 'Black and White', 'Male', 0);

INSERT INTO animals (id, name, species, breed, color, gender, status)
VALUES ('11d6fa07-449f-4053-a7cb-ae4ec8570f3f', 'Meowmix', 'Cat', 'Munchkin', 'Yellow', 'Female', 0);
INSERT INTO animals (id, name, species, breed, color, gender, status)
VALUES ('4e55860a-ec39-494b-845a-2e0a6496bf9b', 'Ash', 'Cat', 'Persian', 'Gray', 'Female', 0);
INSERT INTO animals (id, name, species, breed, color, gender, status)
VALUES ('e80b92e5-98ed-458d-885d-b9e05d0d123e', 'Tiger', 'Cat', 'Bengal', 'Brown', 'Male', 0);

SELECT * FROM animals;

SELECT breed FROM animals;

SELECT name FROM animals WHERE gender = 'Female';

UPDATE animals SET status = 1 WHERE id = 'a1e7a7fc-b429-41ec-9924-8bb39dd397c8';

DELETE FROM animals WHERE id = '89354034-20d9-4c3d-8195-3294bfd9dbc5';

SELECT * FROM adoptions;

SELECT * FROM adoptions ORDER BY date DESC;

ALTER TABLE animals ADD COLUMN species char(10);
SELECT * FROM animals JOIN shelters ON animals.shelter = shelters.id;
SELECT * FROM adoptions JOIN animals ON adoptions.animal_id = animals.id WHERE animals.shelter = 1;

CREATE DATABASE xstream_db;
use xstream_db;

CREATE TABLE employee (emp_id INT, emp_name VARCHAR(255), 
                                  emp_city VARCHAR(255),
                                  emp_country VARCHAR(255),
                                  PRIMARY KEY (emp_id));
INSERT INTO employee VALUES (101, 'Utkarsh Tripathi', 'Varanasi', 'India'),
                            (102, 'Abhinav Singh', 'Varanasi', 'India'), 
                            (103, 'Utkarsh Raghuvanshi', 'Varanasi', 'India'),
                            (104, 'Utkarsh Singh', 'Allahabad', 'India'),
                            (105, 'Sudhanshu Yadav', 'Allahabad', 'India'),
                            (106, 'Ashutosh Kumar', 'Patna', 'India');
SELECT * FROM employee;

SELECT * FROM employee WHERE emp_city = 'Allahabad' AND emp_country = 'India';

SELECT * FROM employee WHERE emp_city IN ('Allahabad', 'Patna');

SELECT * FROM employee WHERE emp_city NOT LIKE 'A%';

SELECT * FROM employee WHERE emp_city LIKE 'P%';

SELECT * FROM employee WHERE emp_id BETWEEN 101 AND 104;

SELECT * FROM employee WHERE emp_id = ANY
                (SELECT emp_id FROM employee WHERE emp_city = 'Varanasi');

SELECT emp_name FROM employee WHERE EXISTS
        (SELECT emp_id FROM employee WHERE emp_city = 'Patna');

CREATE TABLE students (
  ROLL_NO INT,
  NAME VARCHAR(50),
  ADDRESS VARCHAR(100),
  PHONE VARCHAR(20),
  AGE INT
);
INSERT INTO students (ROLL_NO, NAME, ADDRESS, PHONE, AGE)
VALUES 
  (1, 'Shubham Kumar', '123 Main Street, Bangalore', '9876543210', 23),
  (2, 'Shreya Gupta', '456 Park Road, Mumbai', '9876543211', 23),
  (3, 'Naveen Singh', '789 Market Lane, Delhi', '9876543212', 26),
  (4, 'Aman Chopra', '246 Forest Avenue, Kolkata', '9876543213', 22),
  (5, 'Aditya Patel', '7898 Ocean Drive, Chennai', '9876543214', 27),
  (6, 'Avdeep Desai', '34 River View, Hyderabad', '9876543215', 24);
 Select * from students;

SELECT DISTINCT * FROM students;

SELECT COUNT(DISTINCT ROLL_NO)  FROM Students;
