CREATE TABLE Company_Info(
	Company_ID int PRIMARY KEY,
	Company_Name varchar(50),
	Company_Region varchar(50),
	Tel int
)

INSERT INTO Company_Info
VALUES (123, 'Asus', 'USA', 983232)

CREATE TABLE Product_List(
	Product_ID int PRIMARY KEY,
	Product_Name nvarchar(50),
	Product_Info nvarchar(50),
	Product_Unit nvarchar(50),
	Company_ID int FOREIGN KEY REFERENCES Company_Info(Company_ID),
	Company_Name varchar(50),
	Price int,
	Amount_Available int,
	Sold int,
)

INSERT INTO Product_List
VALUES  (12450, N'Máy tính T450', N'Máy nhập cũ', N'Chiếc', 123,'Asus', 1000, 10, 5),
		(15670, N'Điện thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 123,'Asus', 200, 200, 44),
		(21450, N'Máy in Samsung 450', N'Máy in đang loại bình', N'Chiếc', 123,'Asus', 100, 10, 6);

SELECT * FROM Company_Info
SELECT * FROM Product_List
--Hiển thị tất cả các hãng sản xuất--
SELECT Company_Name FROM Company_Info 
--Hiển thị tất cả các sản phẩm--
SELECT Product_Name from Product_List
--Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên--
SELECT Product_Name FROM Product_List
ORDER BY Product_Name DESC
--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần--
SELECT Price FROM Product_List
ORDER BY Price DESC
--Hiển thị thông tin của hãng Asus--
SELECT * FROM Company_Info
WHERE Company_Name = 'Asus'
--Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho--
SELECT * FROM Product_List
WHERE Amount_Available < 11
--Liệt kê danh sách sản phẩm của hãng Asus--
SELECT * FROM Product_List
WHERE Company_Name = 'Asus'
--Số hãng sản phẩm mà cửa hàng có--
SELECT SUM(Amount_Available) FROM Product_List
--Số mặt hàng mà cửa hàng bán--
SELECT SUM(Sold) FROM Product_List
