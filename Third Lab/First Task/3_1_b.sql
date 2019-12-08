/*
	Объявите табличную переменную с такой же структурой как dbo.Address 
	и заполните ее данными из dbo.Address. заполните поле AddressType 
	значениями из Person.AddressType поля Name;
*/

USE AdventureWorks2012;

DECLARE @Address TABLE
(
	AddressId INT PRIMARY KEY,
	AddressLine1 NVARCHAR(60) NOT NULL,
	AddressLine2 NVARCHAR(60),
	City NVARCHAR(30) NOT NULL,
	StateProvinceID INT NOT NULL,
	PostalCode NVARCHAR(15) NOT NULL,
	ModifiedDate DATETIME NOT NULL,
	AddressType NVARCHAR(50)
);

INSERT INTO @Address (
	AddressId, 
	AddressLine1, 
	AddressLine2, 
	City, 
	StateProvinceID, 
	PostalCode, 
	ModifiedDate, 
	AddressType
)
SELECT
	dbo.Address.AddressID,
	AddressLine1,
	AddressLine2,
	City,
	StateProvinceID,
	PostalCode,
	dbo.Address.ModifiedDate,
	Person.AddressType.Name
FROM dbo.Address
	INNER JOIN Person.BusinessEntityAddress
		ON dbo.Address.AddressID = Person.BusinessEntityAddress.AddressID
	INNER JOIN Person.AddressType
		ON Person.BusinessEntityAddress.AddressTypeID = Person.AddressType.AddressTypeID