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
	GroupID int PRIMARY KEY,
	GroupName varchar(30),
	LeaderID int FOREIGN KEY REFERENCES Leader(LeaderID),
	ProjectID int FOREIGN KEY REFERENCES Project(ProjectID),
)


INSERT INTO GroupGroup
VALUES  (10001, 'AnhEmFreeFire', 2001, 3001),
		(10002, 'AnhEmLienQuanMobile', 2002, 3002);

CREATE TABLE Leader(
	LeaderID int PRIMARY KEY,
	Name varchar(20),
	Tel int,
	Email varchar(30)
)

INSERT INTO Leader
VALUES  (2001, 'Khang', 321123, 'hduwud@gmail.com'),
		(2002, 'Quang', 321111, 'fssawwa@gmail.com');

CREATE TABLE Project(
	ProjectID int PRIMARY KEY,
	ProjectName nvarchar(30),
	StartDate datetime,
	EndDate datetime,
	Period int,
	Cost money
)



INSERT INTO Project
VALUES  (3001, N'Chính phủ điện tử', '1-1-2024', '1-2-2024', 30, 1000000),
		(3002, N'Chính phủ xã hội', '1-2-2024', '1-3-2024', 29, 2000000);

CREATE TABLE GroupDetail(
	GroupID int FOREIGN KEY REFERENCES GroupGroup(GroupID),
	EmployeeID int FOREIGN KEY REFERENCES Employee(EmployeeID),
	Status char(20)
)

INSERT INTO GroupDetail 
VALUES  (10001, 1001, 'Dang lam'),
		(10001, 1002, 'Sap lam'),
		(10001, 1003, 'Da lam'),
		(10002, 1004, 'Da lam'),
		(10002, 1005, 'Dang lam');

SELECT * FROM GroupDetail
SELECT * FROM Project
SELECT * FROM Leader
SELECT * FROM GroupGroup
SELECT * FROM Employee

--Hiển thị thông tin của tất cả nhân viên--
SELECT * FROM Employee
--Liệt kê danh sách nhân viên đang làm dự án “Chính phủ điện tử”--
SELECT * FROM GroupDetail
WHERE  Status = 'Dang lam' AND GroupID = 10001
--Thống kê số lượng nhân viên đang làm việc tại mỗi nhóm--
SELECT * FROM GroupDetail
WHERE Status = 'Dang lam'
--Liệt kê thông tin cá nhân của các trưởng nhóm--
SELECT * FROM Leader
--Liệt kê tất cả nhân viên dự kiến sẽ được phân vào các nhóm làm việc--
SELECT * FROM GroupDetail
WHERE Status = 'Sap lam'
--Trường tên nhân viên không được null--
ALTER TABLE Employee
ALTER COLUMN Name varchar(100) NOT NULL
--Trường giá trị dự án phải lớn hơn 1000--
ALTER TABLE Project
ADD CHECK (Cost > 1000)
