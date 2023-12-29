CREATE DATABASE EmployeeDB

USE EmployeeDB

CREATE TABLE Department(
	DepartId INT PRIMARY KEY,
	DepartName varchar(50) NOT NULL,
	Description	varchar(100) NOT NULL
)

INSERT INTO Department
VALUES  (10001, 'John Smith', 'John Description'),
		(10002, 'Mary Smith', 'Mary Description'),
		(10003, 'Tony Quaro', 'Tony Description');

CREATE TABLE Employee(
	EmpCode char(6) PRIMARY KEY,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Birthday SMALLDATETIME NOT NULL,
	Gender BIT default 1,
	Address varchar(100),
	DepartID int FOREIGN KEY REFERENCES Department(DepartId),
	Salary money
)

INSERT INTO Employee(EmpCode, FirstName, LastName, Birthday, Address,DepartID,Salary)
VALUES  (20001, 'John', 'Smith', '03-25-05', 'Las Vegas', 10001 , 100),
		(20002, 'Mary', 'Smith', '03-15-08', 'Texas', 10002 , 110),
		(20003, 'Tony', 'Quaro', '03-22-09', 'New York', 10003 , 130);

SELECT * FROM Employee
SELECT * FROM Department

UPDATE Employee
SET Salary = Salary * 1.1

ALTER TABLE Employee
ADD CHECK (Salary>0)