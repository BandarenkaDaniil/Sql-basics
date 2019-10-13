/*
	Уменьшите размер поля City на NVARCHAR(20)
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address
	ALTER COLUMN City NVARCHAR(20) NOT NULL;