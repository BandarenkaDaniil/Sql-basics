/*
	Вставьте новую строку в Production.WorkOrder через представление. 
	Обновите вставленную строку. Удалите вставленную строку. Убедитесь, 
	что все три операции отображены в Production.WorkOrderHst.
*/

USE AdventureWorks2012;

INSERT INTO Production.WorkOrderVIEW (
	ProductID,  
	OrderQty,
	ScrappedQty, 
	StartDate, 
	EndDate, 
	DueDate,
	ModifiedDate
) 
VALUES (
	722,
	8, 
	0, 
	GETDATE(),
	GETDATE(),
	GETDATE(),
	GETDATE()
), 
(
	725,
	8, 
	0, 
	GETDATE(),
	GETDATE(),
	GETDATE(),
	GETDATE()
)
