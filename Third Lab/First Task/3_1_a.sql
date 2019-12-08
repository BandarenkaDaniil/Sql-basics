/*
	Добавьте в таблицу dbo.Address поле AddressType типа nvarchar
	размерностью 50 символов
*/

USE AdventureWorks2012;

ALTER TABLE dbo.Address
  ADD AddressType NVARCHAR(50);