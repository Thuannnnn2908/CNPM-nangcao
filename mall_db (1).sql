CREATE DATABASE mall_db
GO
USE mall_db
GO
-- Bảng Tài khoản (Accounts)
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) UNIQUE, 
    PasswordHash NVARCHAR(256)  NULL, 
    FullName NVARCHAR(100),
    Email NVARCHAR(100)  NULL UNIQUE,
    Phone NVARCHAR(20),
    Avatar NVARCHAR(MAX),
    Role NVARCHAR(50) DEFAULT 'User', 
    CreatedDate DATETIME DEFAULT GETDATE(), 
    IsActive BIT DEFAULT 1 
);

INSERT INTO Accounts(Username, PasswordHash, Fullname, Email, Phone) values('PPTran', 'BBtran@1234', 'PP Tran', 'pptran123@gmail.com', '0987654321')

-- Bảng Danh mục (Categories)
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NULL
);


-- Bảng Thương hiệu (Brands)
CREATE TABLE Brands (
    BrandID INT PRIMARY KEY IDENTITY(1,1),
    BrandName NVARCHAR(100)  NULL,
    Image NVARCHAR(MAX) NULL,
    Url VARCHAR(MAX) NULL,
    Description NVARCHAR(255) NULL,
	Floor  NVARCHAR(50) NULL,
    CategoryID INT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


CREATE TABLE Staffs(
	StaffID INT PRIMARY KEY IDENTITY(1,1),
	StaffName NVARCHAR(255) NULL,
	Gender NVARCHAR(10) NULL,
	BirthYear INT  NULL,
	Position NVARCHAR(255) NULL,
	BrandID INT NULL,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
)

-- Bảng Sự kiện (Events)
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NULL,
	Image NVARCHAR(MAX) NULL,
	StartDate DATETIME  NULL,
    EndDate DATETIME NULL,
	BrandID INT,
	Register NVARCHAR(255) NULL,
	FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
);


-- Bảng Mặt bằng (Spaces) với khóa ngoại liên kết với Thương hiệu (Brands)
CREATE TABLE Spaces (
    SpaceID INT PRIMARY KEY IDENTITY(1,1),
	BrandID INT,
    SpaceName NVARCHAR(100) NULL,
    Size DECIMAL(10, 2) NULL,
    Location NVARCHAR(100) NULL,
	Image NVARCHAR(MAX) NULL,
	RentalPrice DECIMAL(10, 2),
	Status INT DEFAULT 0 NULL,
    StartDate DATETIME NULL,
    EndDate DATETIME NULL,
	FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
);

-- Bảng Ưu đãi (Promotions)
CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY IDENTITY(1,1),
    PromotionName NVARCHAR(100) NOT NULL,
	Image NVARCHAR(MAX),
	Description NVARCHAR(max) NULL,
    Discount DECIMAL(10, 2) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
	BrandID INT,
	FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
);
use mall_db
Insert into Categories(CategoryName) values(N'Mua sắm')
Insert into Categories(CategoryName) values(N'Giải trí')
Insert into Categories(CategoryName) values(N'Học tập')
Insert into Brands(BrandName, CategoryID, Image, Description, Url, Floor) values('Dookki', 1, 'C:\Users\luong\source\repos\CNPM_NC\images\dookki.jpg', N'Dookki Việt Nam thành lập vào cuối năm 2017 hoạt động trong lĩnh vực Dịch vụ Nhà hàng với nhiều thương hiệu. Trong đó nổi bật nhất là thương hiệu Dookki – Buffet lẩu Toppokki Hàn Quốc đầu tiên và lớn nhất tại Việt Nam cho đến thời điểm hiện tại.', 'https://dookkivietnam.com/', N'Tầng 6')

