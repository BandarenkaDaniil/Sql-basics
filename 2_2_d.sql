/*
	Используя инструкцию ALTER TABLE, создайте для таблицы 
	dbo.Address ограничение DEFAULT для поля ModifiedDate,
	задайте значение по умолчанию текущую дату и время
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address
ADD CONSTRAINT modified_date_default DEFAULT GETDATE() FOR ModifiedDate