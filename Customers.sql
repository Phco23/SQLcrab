CREATE TABLE Customers_detail(
	Name nvarchar(50),
	CMTND int PRIMARY KEY,
	Address nvarchar(50)
)

INSERT INTO Customers_detail
VALUES  (N'Nguyễn Hoàng Lăng', 987654321, N'Sơn La'),
		(N'Nguyễn Nguyệt Nga', 123456789, N'Hà Nội');

CREATE TABLE Customers_register_number(
	CMTND int FOREIGN KEY REFERENCES Customers_detail(CMTND),
	Address nvarchar(50),
	Register_number int PRIMARY KEY,
	Register_number_type nvarchar(50),
	Register_date date	
)

INSERT INTO Customers_register_number
VALUES  (123456789, N'Hà Nội', 0223456677, N'Trả trước', '12/12/02'),
		(123456789, N'Hà Nội', 0123456789, N'Trả Sau', '12/12/09'),
		(987654321, N'Sơn La', 0123123123, N'Trả trước', '12/12/09'),
		(987654321, N'Sơn La', 0321456789, N'Trả sau', '12/12/06');

--4a.Hiển thị toàn bộ thông tin của các khách hàng của công ty
SELECT * FROM Customers_detail
--4b.Hiển thị toàn bộ thông tin của các số thuê bao của công ty
SELECT * FROM Customers_register_number
--5a.Hiển thị toàn bộ thông tin của thuê bao có số: 0123456789
SELECT * FROM Customers_register_number
WHERE Register_number = 0123456789
--5b.Hiển thị thông tin về khách hàng có số CMTND: 123456789
SELECT * FROM Customers_detail
WHERE CMTND = 123456789
--5c.Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
SELECT * FROM Customers_register_number
WHERE CMTND = 123456789
--5d.Liệt kê các thuê bao đăng ký vào ngày 12/12/09
SELECT * FROM Customers_register_number
WHERE Register_date = '12/12/09'
--5e.Liệt kê các thuê bao có địa chỉ tại Hà Nội
SELECT * FROM Customers_register_number
WHERE Address = N'Hà Nội'
--6a.Tổng số khách hàng của công ty
SELECT COUNT(CMTND)
FROM Customers_detail
--6b.Tổng số thuê bao của công ty
SELECT COUNT(Register_number)
FROM Customers_register_number
--6c.Tổng số thuê bao đăng ký ngày 12/12/09
SELECT COUNT(Register_date)
FROM Customers_register_number
WHERE Register_date = '12/12/09'
--6d.Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao
SELECT * FROM Customers_detail
SELECT Register_number,Register_number_type
FROM Customers_register_number