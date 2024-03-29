/*
	Вывести на экран список сотрудников, у 
	которых осталось больше 10, но меньше 
	13 часов отпуска (включая эти значения).
	Выполните задание не используя операторы 
	<, >, =.
*/

USE AdventureWorks2012

SELECT 
	BusinessEntityID, 
	JobTitle, 
	Gender, 
	VacationHours, 
	SickLeaveHours
FROM AdventureWorks2012.HumanResources.Employee
WHERE VacationHours BETWEEN 10 AND 13