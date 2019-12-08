/*
	Вставьте новую строку в представление, указав новые данные 
	для WorkOrder и ScrapReason, но для существующего Product 
	(например для ‘Adjustable Race’). Триггер должен добавить 
	новые строки в таблицы Production.WorkOrder и Production.ScrapReason 
	для указанного Product Name. Обновите вставленные строки через представление. Удалите строки.
*/

USE AdventureWorks2012;

INSERT INTO Production.WorkOrderScrapReasonVIEW (
	ProductName,  
	OrderQty,
	ScrappedQty, 
	StartDate, 
	EndDate,
	DueDate,
	WorkOrderMD,
	ScrapReasonName,
	ScrapReasonMD
) 
VALUES ( 
	'Blade',
	555, 
	0, 
	GETDATE(),
	GETDATE(),
	GETDATE(), 
	GETDATE(),  
	'kCk', 
	GETDATE()
)

UPDATE Production.WorkOrderScrapReasonVIEW SET
	ScrappedQty=10, 
	StartDate= GETDATE(), 
	EndDate= GETDATE()+1,
	DueDate= GETDATE(),
	WorkOrderMD= GETDATE(),
	ScrapReasonName= 'KKl',
	ScrapReasonMD= GETDATE()
	
	WHERE ProductName = 'Blade' AND WorkOrderID = (
	SELECT x.MaxID
    FROM (
		SELECT MAX(t.WorkOrderID) AS MaxID
        FROM Production.WorkOrder AS t
		) AS x
	)


DECLARE @maxId INT;
SET @maxId =  (
	SELECT x.MaxScrapReasonID
    FROM (
		SELECT MAX(t.ScrapReasonID) AS MaxScrapReasonID
        FROM Production.ScrapReason AS t
		) AS
	x);

DELETE FROM Production.WorkOrderScrapReasonVIEW
WHERE ProductName = 'Blade' AND ScrapReasonID = @maxId