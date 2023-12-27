CREATE TABLE Employee(
	EmployeeID int PRIMARY KEY,
	Name varchar(100),
	Tel char(11),
	Email varchar(30)
)

INSERT INTO Employee
VALUES  (1001, 'Nam', '123456', 'hfdhfhd@gmail.com'),
		(1002, 'Phuc', '123457', 'fasdadsafa@gmail.com'),
		(1003, 'Huy', '123458', 'sdaassaa@gmail.com'),
		(1004, 'Kiet', '123459', 'dsgdgdf@gmail.com'),
		(1005, 'Thong', '123450', 'aawaww@gmail.com');

CREATE TABLE GroupGroup(
	GroupID int FOREIGN KEY REFERENCES GroupDetail(GroupID),
	GroupName varchar(30),
	LeaderID int PRIMARY KEY,
	ProjectID int FOREIGN KEY REFERENCES Project(ProjectID),
)

INSERT INTO GroupGroup(
	
)



CREATE TABLE Project(
	ProjectID int PRIMARY KEY,
	ProjectName varchar(30),
	StartDate datetime,
	EndDate datetime,
	Period int,
	Cost money
)



CREATE TABLE GroupDetail(
	GroupID int PRIMARY KEY,
	EmployeeID int FOREIGN KEY REFERENCES Employee(EmployeeID),
	Status char(20)
)

INSERT INTO GroupDetail 
VALUES  (10001, 1001, 'Dang lam'),
		(10002, 1002, 'Sap lam'),
		(10003, 1003, 'Da lam'),
		(10004, 1004, 'Da lam'),
		(10005, 1005, 'Dang lam');

