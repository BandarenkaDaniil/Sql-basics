/*
	»спользу€ инструкцию ALTER TABLE, создайте дл€ таблицы 
	dbo.Address ограничение DEFAULT дл€ пол€ ModifiedDate,
	 задайте значение по умолчанию текущую дату и врем€
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address
ADD CONSTRAINT modified_date_default DEFAULT GETDATE() FOR ModifiedDate