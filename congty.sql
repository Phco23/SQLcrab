USE TEST

CREATE TABLE PhongBan(
	MaPB varchar(7) PRIMARY KEY,
	TenPB nvarchar(50) 
);

INSERT INTO PhongBan(MaPB, TenPB)
VALUES  (101, 'phongban1'),
		(102, 'phongban2'),
		(103, 'phongban3'),
		(104, 'phongban4'),
		(105, 'phongban5');

CREATE TABLE NhanVien(
	MaNV varchar(7) PRIMARY KEY,
	TenNV nvarchar(50),
	NgaySinh Datetime,
	SoCMND char(9),
	GioiTinh char(1),
	DiaChi nvarchar(100),
	NgayVaoLam Datetime,
	MaPB varchar(7) FOREIGN KEY REFERENCES PhongBan(MaPB)
);


INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB)
VALUES  ('NVNAM', 'Nam', '11-2-2001', '012345', 'M', N'Hải Phòng', '1-1-2016', '101'),
		('NVLAN', 'Lan', '1-12-2003', '012346', 'F', N'Hà Nội', '2-1-2016', '102'),
		('NVHOANG', N'Hoàng', '12-1-1999', '012347', 'M', N'Nam Định', '3-1-2016', '103'),
		('NVDUONG', N'Dương', '8-9-2001', '012348', 'F', N'Thanh Hóa', '4-1-2016', '104'),
		('NVHAI', N'Hải', '2-5-2002', '012349', 'M', N'Đak Lak', '5-1-2016', '105');


CREATE TABLE LuongDA(
	MaDA varchar(8) PRIMARY KEY,
	MaNV varchar(7) FOREIGN KEY REFERENCES NhanVien(MaNV),
	NgayNhan Datetime,
	SoTien money,
	CHECK (SoTien>0)
);



INSERT INTO LuongDA(MaDA, MaNV, NgayNhan, SoTien)
VALUES  ('DXD01', 'NVNAM', '1-2-2016', '2000000'),
		('DXD02', 'NVLAN', '2-2-2016', '1550000'),
		('DXD03', 'NVHOANG', '3-2-2016', '100000'),
		('DXD04', 'NVDUONG', '4-2-2016', '400000'),
		('DXD05', 'NVHAI', '5-2-2016', '500000');
--Viết một query để hiển thị thông tin về các bảng LUONGDA, NHANVIEN, PHONGBAN.
SELECT * FROM PhongBan
SELECT * FROM NhanVien
SELECT * FROM LuongDA
--Viết một query để hiển thị những nhân viên có giới tính là ‘F’
SELECT * FROM NhanVien
WHERE GioiTinh = 'F';
--Hiển thị tất cả các dự án, mỗi dự án trên 1 dòng
SELECT * FROM LuongDA
WHERE MaDA >= 'DXD01'
--Hiển thị tổng lương của từng nhân viên (dùng mệnh đề GROUP BY).
SELECT MaNV,SUM(SoTien) FROM LuongDA
	GROUP BY MaNV
--Hiển thị tất cả các nhân viên trên một phòng ban cho trước
SELECT MaPB,MaNV FROM
NhanVien;