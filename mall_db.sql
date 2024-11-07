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
	IdentityNumber NVARCHAR(50), -- CMND hoặc CCCD
    Email NVARCHAR(100)  NULL UNIQUE,
    Phone NVARCHAR(20),
    Avatar NVARCHAR(MAX),
    Role NVARCHAR(50) DEFAULT 'User', 
    CreatedDate DATE DEFAULT GETDATE(), 
    IsActive BIT DEFAULT 1, 
    BusinessName NVARCHAR(100), -- Tên doanh nghiệp nếu có
);

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
    Description TEXT NULL,
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
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName NVARCHAR(MAX) NOT NULL,
    Description NTEXT NULL,
	Image NVARCHAR(MAX) NULL,
	StartDate DATE  NULL,
    EndDate DATE NULL,
	BrandID INT NULL,
	Register NVARCHAR(255) NULL,
	FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
);
-- Bảng Mặt bằng (Spaces) với khóa ngoại liên kết với Thương hiệu (Brands)
CREATE TABLE Spaces (
    SpaceID INT PRIMARY KEY IDENTITY,
    SpaceName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
	Image NVARCHAR(MAX) NULL,
    Area FLOAT NOT NULL, -- Diện tích (m2)
    RentalPrice DECIMAL(18, 2) NOT NULL, -- Giá thuê mỗi tháng
    Status NVARCHAR(50) DEFAULT 'Available', -- Trạng thái (Available, Rented)
);

CREATE TABLE Contracts (
    ContractID INT PRIMARY KEY IDENTITY,
    SpaceID INT NOT NULL,
    AccountID INT NOT NULL,
    StartDate DATE NOT NULL, -- Ngày bắt đầu hợp đồng
    EndDate DATE, -- Ngày kết thúc hợp đồng
    RentAmount DECIMAL(18, 2) NOT NULL, -- Số tiền thuê
    Status NVARCHAR(50) DEFAULT 'Active', -- Trạng thái hợp đồng (Active, Terminated)
    FOREIGN KEY (SpaceID) REFERENCES Spaces(SpaceID),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    ContractID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(18, 2) NOT NULL, -- Số tiền thanh toán
    Status NVARCHAR(50) DEFAULT 'Pending', -- Trạng thái thanh toán (Paid, Pending, Overdue)
    FOREIGN KEY (ContractID) REFERENCES Contracts(ContractID)
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY IDENTITY,
    ContractID INT NOT NULL,
    InvoiceDate DATE NOT NULL,
    DueDate DATE NOT NULL, -- Hạn thanh toán
    TotalAmount DECIMAL(18, 2) NOT NULL, -- Tổng tiền phải thanh toán
    PaidAmount DECIMAL(18, 2) DEFAULT 0, -- Số tiền đã thanh toán
    Status NVARCHAR(50) DEFAULT 'Unpaid', -- Trạng thái hóa đơn (Paid, Unpaid, Overdue)
    FOREIGN KEY (ContractID) REFERENCES Contracts(ContractID)
);
