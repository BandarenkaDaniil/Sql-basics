/*
	Вывести на экран количество сотрудников в каждом отделе
*/

USE AdventureWorks2012

SELECT 
	D.DepartmentID,
	D.Name,
	Count(H.BusinessEntityID) AS EmployeeCount
FROM AdventureWorks2012.HumanResources.EmployeeDepartmentHistory H
JOIN AdventureWorks2012.HumanResources.Department D
	ON H.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentID, D.Name