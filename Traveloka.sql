CREATE DATABASE traveloka
GO 

-- Tạo bảng MAYBAY
CREATE TABLE MAYBAY (
    MaMB NVARCHAR(10) NOT NULL PRIMARY KEY,
    TenMB NVARCHAR(50) NOT NULL,
    Tongsoghe INT
);

-- Tạo bảng KHACHHANG
CREATE TABLE KHACHHANG (
    MaKH NVARCHAR(10) NOT NULL PRIMARY KEY,
    TenKH NVARCHAR(50) NOT NULL,
    Diachi NVARCHAR(50) NOT NULL,
    CMND TEXT NOT NULL,
    Sove TEXT NOT NULL
);

-- Tạo bảng TUYENBAY
CREATE TABLE TUYENBAY (
    MaTuyen NVARCHAR(10) NOT NULL PRIMARY KEY,
    MaSB NVARCHAR(10) NOT NULL,
    Sanbaydi NVARCHAR(50) NOT NULL,
    Sanbayden NVARCHAR(50) NOT NULL,
    FOREIGN KEY (MaSB) REFERENCES MAYBAY(MaMB)
);

-- Tạo bảng CHUYENBAY
CREATE TABLE CHUYENBAY (
    Machuyenbay NVARCHAR(10) NOT NULL PRIMARY KEY,
    MaTuyen NVARCHAR(10) NOT NULL,
    MaMB NVARCHAR(10) NOT NULL,
    Khoihanh DATETIME,
    Thoigiandukien TIME(7),
    Soghetrong INT,
    FOREIGN KEY (MaTuyen) REFERENCES TUYENBAY(MaTuyen),
    FOREIGN KEY (MaMB) REFERENCES MAYBAY(MaMB)
);

-- Tạo bảng SANBAY
CREATE TABLE SANBAY (
    MaSB NVARCHAR(10) NOT NULL PRIMARY KEY,
    TenSB NVARCHAR(50) NOT NULL,
    Tinh NVARCHAR(50) NOT NULL
);

-- Tạo bảng HOADON
CREATE TABLE HOADON (
    MaHD NVARCHAR(10) NOT NULL PRIMARY KEY,
    MaKH NVARCHAR(10) NOT NULL,
    Ngaylap DATETIME NOT NULL,
    Thanhtien INT NOT NULL,
    FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
);

-- Tạo bảng VE
CREATE TABLE VE (
    MaVE NVARCHAR(10) NOT NULL PRIMARY KEY,
    Machuyenbay NVARCHAR(10) NOT NULL,
    MaKH NVARCHAR(10) NOT NULL,
    MaHD NVARCHAR(10) NOT NULL,
    Hangve NVARCHAR(50) NOT NULL,
    Loaive NVARCHAR(20) NOT NULL,
    Soghe INT NOT NULL,
    Tinhtrang NVARCHAR(10) NOT NULL,
    FOREIGN KEY (Machuyenbay) REFERENCES CHUYENBAY(Machuyenbay),
    FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
    FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD)
);

