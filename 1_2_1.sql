/*
	Вывести на экран список отделов,
	названия которых начинаются на букву 'P'.
*/

USE AdventureWorks2012

SELECT DepartmentID, Name
FROM HumanResources.Department
WHERE Name LIKE 'P%'