

--        Exercise  1


-- Creation of database on online consultation and therapy website.
CREATE DATABASE CONSULTANCY_AND_THERAPY;


CREATE TABLE DOCTOR(
ID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(70) NOT NULL,
CONTACT_NO VARCHAR(15) NOT NULL,
SPECIALIZATION VARCHAR(70) NOT NULL,
EMAIL VARCHAR(80) NOT NULL
);


CREATE TABLE APPOINTMENT(
ID INT PRIMARY KEY NOT NULL,
DOCTOR_ID INT NOT NULL,
PATIENT_ID INT NOT NULL,
STATUS VARCHAR(30) NOT NULL,
SESSION_START_TIME TIMESTAMP NOT NULL,
SESSION_END_TIME TIMESTAMP NOT NULL
);


CREATE TABLE PATIENT(
ID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(70) NOT NULL,
CONTACT_NO VARCHAR(15) NOT NULL,
EMAIL VARCHAR(80) NOT NULL
);


CREATE TABLE REVIEW(
ID INT PRIMARY KEY NOT NULL,
DOCTOR_ID INT NOT NULL,
PATIENT_ID INT NOT NULL,
RATING INT NOT NULL,
COMMENTS VARCHAR(500) NOT NULL
);










-- 					Exercise  2


CREATE DATABASE EMPLOYEE_INFO;


CREATE TABLE CONTACT(
ID INT PRIMARY KEY NOT NULL,
Email VARCHAR(40) NOT NULL,
Fname VARCHAR(20) NOT NULL,
Iname VARCHAR(20),
Company VARCHAR(30) NOT NULL,
Active_Flag INT,
Opt_out INT
);

INSERT INTO CONTACT VALUES
(123,"a@a.com","Kian","Seth","ABC",1,1),
(133,"b@a.com","Neha","Seth","ABC",1,0),
(234,"c@c.com","Puru","Malik","CDF",0,0),
(342,"d@d.com","Sid","Maan","TEG",1,0);

-- Select all columns from the contact table where the active flag is 1.
SELECT * FROM CONTACT
WHERE Active_Flag =1;


-- Deactivate contacts who are opted out
DELETE FROM CONTACT
WHERE Opt_out = 1;


-- Delete all the contacts who have the company name as 'ABC'
DELETE FROM CONTACT
WHERE Company = "ABC";


-- Insert a new row with id as 658, name as 'milli', email as 'milli@gmail.com',
-- the company as 'DGH', active flag as 1, opt out flag as 1.
INSERT INTO CONTACT (ID,Fname,Email,Company,Active_Flag,Opt_out,Iname)
VALUES(658,"mili","mili@gmail.com","DGH",1,1,"");


-- Pull out the unique values of the company column.
SELECT DISTINCT(Company) AS UNIQUE_COMPANIES FROM CONTACT;


-- Update name as "mili" to "niti".
UPDATE CONTACT SET Fname = "niti"
WHERE Fname = "mili";









-- 					Exercise  3


-- SQL query to find those customers with a grade less than 100.
-- Returning customer name, city, grade, salesman, salesman city.
-- Which is ordered by customer id in ascending order.


-- Recreating the database for the query check.
CREATE DATABASE INDUSTRY;

-- Recreating the Customer table.
CREATE TABLE CUSTOMER(
CUSTOMER_ID INT NOT NULL,
CUST_NAME VARCHAR(70) NOT NULL,
CITY VARCHAR(60) NOT NULL,
GRADE INT DEFAULT 0,
SALESMAN_ID INT NOT NULL,
PRIMARY KEY (CUSTOMER_ID, SALESMAN_ID)     -- Composite Primary Key
);

INSERT INTO CUSTOMER VALUES
(3002,"Nick Rimando","New York",100,5001),
(3007,"Brad Davis","New York",200,5001),
(3005,"Graham Zusi","California",200,5002),
(3008,"Julian Green","London",300,5002),
(3004,"Fabian Johnson","Paris",300,5006),
(3009,"Geoff Cameron","Berlin",100,5003),
(3003,"Jozy Altidor","Moscow",200,5007);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUST_NAME, CITY, SALESMAN_ID) VALUES(3001,"Brad Guzan","London",5005);


-- Recreating the Salesman table.
CREATE TABLE SALESMAN(
salesman_id INT PRIMARY KEY NOT NULL,
name VARCHAR(70),
city VARCHAR(40),
commission FLOAT
);

INSERT INTO SALESMAN VALUES
(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite","Paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"Mc Lyon","Paris",0.14),
(5007,"Paul Adam","Rome",0.13),
(5003,"Lauson Hen","San Jose",0.12);


-- SQL Query Answer:
SELECT CUSTOMER.CUST_NAME, CUSTOMER.CITY AS customer_city, CUSTOMER.GRADE, SALESMAN.NAME AS salesman, SALESMAN.CITY AS salesman_city
FROM CUSTOMER
INNER JOIN SALESMAN ON CUSTOMER.SALESMAN_ID = SALESMAN.salesman_id
WHERE CUSTOMER.GRADE < 100
ORDER BY CUSTOMER.CUSTOMER_ID; -- Default is in Ascending order.