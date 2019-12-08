/*
	Создайте три INSTEAD OF триггера для представления на операции 
	INSERT, UPDATE, DELETE. Каждый триггер должен выполнять 
	соответствующие операции в таблицах Production.WorkOrder и 
	Production.ScrapReason для указанного Product Name. Обновление 
	и удаление строк производите только в таблицах Production.WorkOrder
	и Production.ScrapReason, но не в Production.Product. В UPDATE 
	триггере не указывайте обновление поля OrderQty для таблицы Production.WorkOrder.
*/

USE AdventureWorks2012;

CREATE TRIGGER Production.WorkOrderScrapReasonVIEW_Insert
ON Production.WorkOrderScrapReasonVIEW
INSTEAD OF INSERT
AS
	DECLARE @ID_table TABLE (ScrapReasonID INT, Name NVARCHAR(100));
	DECLARE @ProductID INT;

	SELECT @ProductID = Production.Product.ProductID
	FROM Production.Product
	JOIN inserted
	ON inserted.ProductName = Production.Product.Name

	INSERT INTO Production.ScrapReason(
		Name,
		ModifiedDate
	) 
	OUTPUT inserted.ScrapReasonID, inserted.Name INTO @ID_table
	SELECT 
		ScrapReasonName,
		ScrapReasonMD
	FROM inserted;


	INSERT INTO Production.WorkOrder(
		 ProductID,
		 OrderQty,
		 ScrappedQty,
		 StartDate,
		 EndDate,
		 DueDate,
		 ScrapReasonID,
		 ModifiedDate
	) 
	SELECT
		 @ProductID,
		 OrderQty,
		 ScrappedQty,
		 StartDate,
		 EndDate,
		 DueDate,
		 tab.ScrapReasonID,
		 WorkOrderMD
	FROM inserted
	JOIN @ID_table tab
	ON tab.Name = inserted.ScrapReasonName;

CREATE TRIGGER Production.WorkOrderScrapReasonVIEW_Update
ON Production.WorkOrderScrapReasonVIEW
INSTEAD OF UPDATE
AS
	DECLARE @ProductID INT;

	SELECT @ProductID = Production.Product.ProductID
	FROM Production.Product
	JOIN inserted
	ON inserted.ProductName = Production.Product.Name

	UPDATE Production.ScrapReason
	SET 
		Name = inserted.ScrapReasonName,
		ModifiedDate = inserted.ScrapReasonMD
	FROM inserted
	WHERE inserted.ScrapReasonID = Production.ScrapReason.ScrapReasonID;

	UPDATE Production.WorkOrder
	SET 
		 ScrappedQty=inserted.ScrappedQty,
		 StartDate=inserted.StartDate,
		 EndDate=inserted.EndDate,
		 DueDate=inserted.DueDate,
		 ScrapReasonID=inserted.ScrapReasonID,
		 ModifiedDate=inserted.WorkOrderMD
	FROM inserted
	WHERE inserted.WorkOrderID = Production.WorkOrder.WorkOrderID AND Production.WorkOrder.ProductID = @ProductID;

CREATE TRIGGER Production.WorkOrderScrapReasonVIEW_Delete
ON Production.WorkOrderScrapReasonVIEW
INSTEAD OF DELETE
AS
	DECLARE @ProductID INT;

	SELECT @ProductID = Production.Product.ProductID
	FROM Production.Product
	JOIN deleted
	ON deleted.ProductName = Production.Product.Name

	
	DELETE WO FROM Production.WorkOrder WO
	JOIN deleted
	ON WO.ScrapReasonID = deleted.ScrapReasonID
	WHERE WO.ProductID = @ProductID;

	DELETE SR FROM Production.ScrapReason SR
	JOIN deleted
	ON deleted.ScrapReasonID = SR.ScrapReasonID