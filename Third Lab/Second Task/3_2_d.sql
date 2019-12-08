/*
	Удалите из таблицы dbo.Address одну строку (где StateProvinceID = 36)
*/

USE AdventureWorks2012;

DELETE
FROM
    #Address
WHERE
    StateProvinceID = 36;