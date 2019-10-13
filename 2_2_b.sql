/*
	Используя инструкцию ALTER TABLE, добавьте в таблицу 
	dbo.PersonPhone новое поле ID, которое ¤вл¤етс¤ 
	уникальным ограничением UNIQUE типа bigint и имеет 
	свойство identity. Начальное значение для поля identity
	задайте 2 и приращение задайте 2
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address 
	ADD CONSTRAINT PK_ADDRESS PRIMARY KEY (StateProvinceID, PostalCode)