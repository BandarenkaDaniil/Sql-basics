/*
	Создайте таблицу dbo.PersonPhone с такой же структурой 
	как Person.PersonPhone, не включая индексы, ограничения и триггеры
*/

USE AdventureWorks2012

CREATE TABLE dbo.Address (
	AddressID INT NOT NULL,
	AddressLine1 NVARCHAR(60) NOT NULL,
	AddressLine2 NVARCHAR(60),
	City NVARCHAR(30) NOT NULL,
	StateProvinceID INT NOT NULL,
	PostalCode NVARCHAR(15) NOT NULL,
	ModifiedDate DATETIME NOT NULL,
);