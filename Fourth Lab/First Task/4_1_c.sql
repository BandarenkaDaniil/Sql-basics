/*
	Создайте таблицу Production.WorkOrderHst, которая будет хранить 
	информацию об изменениях в таблице Production.WorkOrder.

	Обязательные поля, которые должны присутствовать в таблице: 
	ID — первичный ключ IDENTITY(1,1); Action — совершенное действие 
	(insert, update или delete); ModifiedDate — дата и время, 
	когда была совершена операция; SourceID — первичный ключ исходной 
	таблицы; UserName — имя пользователя, совершившего операцию. 
	Создайте другие поля, если считаете их нужными.
*/

USE AdventureWorks2012;

CREATE TABLE Production.WorkOrderHst (
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	[Action] NVARCHAR(6) NOT NULL,
	ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
	SourceID INT NOT NULL,
	UserName NVARCHAR(50) NOT NULL DEFAULT SYSTEM_USER
);