/*
	Вывести на экран сотрудников, которых приняли на работу 
	1-ого июля (любого года). Отсортировать результат по 
	BusinessEntityID по возрастанию. Вывести на экран только 
	5 строк, пропустив первые 3.
*/

USE AdventureWorks2012

SELECT 
	BusinessEntityID,
	JobTitle,
	BirthDate,
	Gender,
	HireDate
FROM AdventureWorks2012.HumanResources.Employee
WHERE DAY(HireDate) = '1' AND MONTH(HireDate) = '7'
ORDER BY BusinessEntityID ASC
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY