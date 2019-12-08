/*
	Создайте один AFTER триггер для трех операций INSERT, UPDATE, DELETE 
	для таблицы Production.WorkOrder. Триггер должен заполнять таблицу 
	Production.WorkOrderHst с указанием типа операции в поле Action 
	в зависимости от оператора, вызвавшего триггер.
*/

USE AdventureWorks2012;

CREATE TRIGGER Production.WorkOrder_ChangeTracking
	ON Production.WorkOrder
		AFTER INSERT, UPDATE, DELETE
	AS BEGIN

	DECLARE @event_type varchar(6), @sourceID int,  @date date, @user nvarchar(256);

	SET @event_type = 'nothing';
	SET @sourceID = -1;

	SET @event_type = (
		CASE 
			WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM  deleted) THEN 'update'
			WHEN EXISTS(SELECT * FROM inserted) THEN 'insert'
			WHEN EXISTS(SELECT * FROM deleted) THEN 'delete'
		END
	)
	SET @user = SUSER_NAME();
	IF (@event_type = 'delete') 
		INSERT INTO Production.WorkOrderHst ([Action], ModifiedDate, SourceID, UserName)
		SELECT @event_type, GETDATE(), WorkOrderID, @user FROM deleted
	ELSE 
		INSERT INTO Production.WorkOrderHst ([Action], ModifiedDate, SourceID, UserName)
		SELECT @event_type, GETDATE(), WorkOrderID, @user FROM inserted
END