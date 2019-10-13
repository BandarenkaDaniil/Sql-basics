/*
	Используя инструкцию ALTER TABLE, создайте для таблицы
	dbo.PersonPhone ограничение для поля PhoneNumber, 
	запрещающее заполнение этого поля буквами
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address
ADD CONSTRAINT check_postal_code CHECK (PostalCode NOT LIKE '%[a-zA-Z]%')