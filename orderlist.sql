CREATE TABLE customer(
	customer_id int PRIMARY KEY,
	tel varchar(10),
	name nvarchar(50),
	address nvarchar(50),
)

INSERT INTO customer(customer_id, tel, name, address)
VALUES ('756383716', '987654321', N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội')

CREATE TABLE product_list(
	product_id int PRIMARY KEY,
	name nvarchar(50),
	product_info nvarchar(50),
	product_unit nvarchar(50),
	price int,
)

INSERT INTO product_list(product_id, name, product_info, product_unit, price)
VALUES  (21450,N'Máy Tính T450', N'Máy nhập mới', N'Chiếc', 1000),
		(45670,N'Điện Thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200),
		(12450,N'Máy In Samsung 450', N'Máy in đang ế ', N'Chiếc', 100);


CREATE TABLE Order_Info(
	Order_ID int PRIMARY KEY,
	Order_Number int,
	Customer_ID int FOREIGN KEY REFERENCES customer(customer_id),
	product_id int FOREIGN KEY REFERENCES product_list(product_id),
	Order_date Date,
	Amount nvarchar(50),
	Total_price int,
)

INSERT INTO Order_Info(Order_ID, Order_Number, Customer_ID, product_id,Order_date, Amount, Total_price)
VALUES  (1, 75664, 756383716, 21450, '11/18/09',1, 1000 ),
		(2, 75664, 756383716, 45670, '11/18/09',2, 400 ),
		(3, 75664, 756383716, 12450, '11/18/09',1, 100 );

SELECT * FROM Order_Info
SELECT * FROM product_list
SELECT * FROM customer

