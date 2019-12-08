/*
	Создайте представление VIEW, отображающее 
	все поля таблицы Production.WorkOrder.
*/

USE AdventureWorks2012;

CREATE VIEW Production.WorkOrderVIEW AS 
SELECT * FROM Production.WorkOrder