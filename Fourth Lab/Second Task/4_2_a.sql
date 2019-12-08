/*
	�������� ������������� VIEW, ������������ ������ �� ������
	Production.WorkOrder � Production.ScrapReason, � ����� 
	Name �� ������� Production.Product. �������� ����������� 
	�������� ��������� ���� �������������. �������� ���������� 
	���������� ������ � ������������� �� ���� WorkOrderID.
*/

USE AdventureWorks2012;

CREATE VIEW Production.WorkOrderScrapReasonVIEW
WITH ENCRYPTION, SCHEMABINDING
AS
SELECT 
    WO.WorkOrderID,
    WO.ProductID,
    WO.OrderQty,
    WO.StockedQty,
    WO.ScrappedQty,
    WO.StartDate,
    WO.EndDate,
    WO.DueDate,
    SR.ScrapReasonID,
    WO.ModifiedDate AS WorkOrderMD,
    P.Name AS ProductName,
    SR.Name AS ScrapReasonName,
    SR.ModifiedDate AS ScrapReasonMD
FROM Production.WorkOrder AS WO
JOIN Production.ScrapReason AS SR
	WO.ScrapReasonID = SR.ScrapReasonID
JOIN Production.Product AS P
	ON P.ProductID = WO.ProductID;

CREATE UNIQUE CLUSTERED INDEX ProductionWorkOrderScrapReasonVIEW_Index   
    ON Production.WorkOrderScrapReasonVIEW (WorkOrderID); 
