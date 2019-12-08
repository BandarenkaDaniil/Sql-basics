/*
	Создайте временную таблицу #Address, с первичным ключом по полю AddressID.
	Временная таблица должна включать все поля таблицы dbo.Address за 
	исключением поля DiffMin
*/

USE AdventureWorks2012;

CREATE TABLE #Address (
    AddressID INT NOT NULL PRIMARY KEY,
    AddressLine1 NVARCHAR(60) NOT NULL,
    AddressLine2 NVARCHAR(60) NULL,
    City NVARCHAR(30) NULL,
    StateProvinceID INT NOT NULL,
    PostalCode NVARCHAR(15) NOT NULL,
    ModifiedDate DATETIME NOT NULL,
    CountryRegionCode NVARCHAR(3),
    TaxRate SMALLMONEY,
);