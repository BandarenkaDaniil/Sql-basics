/*
	Вывести на экран название отдела, 
	где работает каждый сотрудник в настоящий момент.	
*/

USE AdventureWorks2012

SELECT 
	E.BusinessEntityID,
	E.JobTitle,
	D.DepartmentID,
	D.Name
FROM AdventureWorks2012.HumanResources.EmployeeDepartmentHistory H
JOIN AdventureWorks2012.HumanResources.Employee E
	ON H.BusinessEntityID = E.BusinessEntityID
JOIN AdventureWorks2012.HumanResources.Department D
	ON H.DepartmentID = D.DepartmentID