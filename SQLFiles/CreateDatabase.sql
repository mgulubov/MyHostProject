----------------------------------
-- RE-CREATE DATABASE
USE master;
GO
----------------------------------
DROP DATABASE IF EXISTS
	SitesTenDB;
GO
----------------------------------
CREATE DATABASE
	SitesTenDB
COLLATE
	Latin1_General_CI_AS;
GO
----------------------------------
USE SitesTenDB;
GO
----------------------------------
----------------------------------
-- CREATE TABLES
CREATE TABLE ClientStatuses(
	Id INT IDENTITY(1, 1)
		CONSTRAINT PK_ClientStatuses_Id PRIMARY KEY,
	Status CHAR(6)
		CONSTRAINT CHK_ClientStatuses_Status_NotNull CHECK(
			Status IS NOT NULL
		),
		CONSTRAINT CHK_ClientStatuses_Status_Value CHECK(
			Status IN ('Active', 'Disabled')
		)
);
----------------------------------
CREATE TABLE Clients(
	Id INT IDENTITY(1, 1)
		CONSTRAINT PK_Clients_Id PRIMARY KEY,
	Password BINARY(32)
		CONSTRAINT CHK_Clients_Password_NotNull CHECK(
			Password IS NOT NULL
		),
	LastLogin DATETIME,
	Ip CHAR(15)
		CONSTRAINT CHK_Clients_Ip_NotNull CHECK(
			Ip IS NOT NULL
		),
	Host NVARCHAR(150)
		CONSTRAINT CHK_Clients_Host_NotNull CHECK(
			Host IS NOT NULL
		),
	StatusId INT
		CONSTRAINT FK_Clients_StatusId_ClientStatuses_Id FOREIGN KEY REFERENCES ClientStatuses(Id),
	ParentId INT,
	FirstName NVARCHAR(150)
		CONSTRAINT CHK_Clients_FirstName_NotNull CHECK(
			FirstName IS NOT NULL
		),
	LastName NVARCHAR(150)
		CONSTRAINT CHK_Clients_LastName_NotNull CHECK(
			LastName IS NOT NULL
		),
	CompanyName NVARCHAR(300),
	AddressPrimary NVARCHAR(500),
	AddressSecondary NVARCHAR(500),
	City NVARCHAR(150)
		CONSTRAINT CHK_Clients_City_NotNull CHECK(
			City IS NOT NULL
		),
	State NVARCHAR(150),
	PostCode NVARCHAR(50),
	CountryCode CHAR(2)
		CONSTRAINT CHK_Clients_CountryCode_NotNull CHECK(
			CountryCode IS NOT NULL
		),
	PhoneNumber NVARCHAR(30)
		CONSTRAINT CHK_Clients_PhoneNumber_NotNull CHECK(
			PhoneNumber IS NOT NULL
		),
	DateCreated DATE
		CONSTRAINT CHK_Clients_DateCreated_NotNull CHECK(
			DateCreated IS NOT NULL
		),
	Notes NVARCHAR(1000),
	Language NVARCHAR(50),
	IsCompany TINYINT
		CONSTRAINT CHK_Clients_IsCompany_NotNull CHECK(
			IsCompany IS NOT NULL
		),
		CONSTRAINT CHK_Clients_IsCompany_Value CHECK(
			IsCompany IN (0, 1)
		),
	Credit DECIMAL(5, 2)
		CONSTRAINT DF_Clients_Credit DEFAULT 0.00,
	IsTaxExempt TINYINT
		CONSTRAINT CHK_Clients_IsTaxExempt_NotNull CHECK(
			IsTaxExempt IS NOT NULL
		),
		CONSTRAINT CHK_Clients_IsTaxExempt_Value CHECK(
			IsTaxExempt IN (0, 1)
		),
	HasLateFeeOverride TINYINT
		CONSTRAINT CHK_Clients_HasLateFeeOverride_NotNull CHECK(
			HasLateFeeOverride IS NOT NULL
		),
		CONSTRAINT CHK_Clients_HasLateFeeOverride_Value CHECK(
			HasLateFeeOverride IN (0, 1)
		),
	CardType NVARCHAR(50),
	CardNumber NVARCHAR(50),
	CardExpirationDate DATE,
	HasLateNoticesOverride TINYINT
		CONSTRAINT CHK_Clients_HasLateNoticesOverride_NotNull CHECK(
			HasLateNoticesOverride IS NOT NULL
		),
		CONSTRAINT CHK_Clients_HasLateNoticesOverride_Value CHECK(
			HasLateNoticesOverride IN (0, 1)
		),
	ClientId INT
		CONSTRAINT CHK_Clients_ClientId_NotNull CHECK(
			ClientId IS NOT NULL
		),
	CurrencyId INT
		CONSTRAINT CHK_Clients_CurrencyId_NotNull CHECK(
			CurrencyId IS NOT NULL
		),
	CountryName NVARCHAR(150)
		CONSTRAINT CHK_Clients_CountryName_NotNull CHECK(
			CountryName IS NOT NULL
		)
);
----------------------------------