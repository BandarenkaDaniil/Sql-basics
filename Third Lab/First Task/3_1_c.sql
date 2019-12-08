/*
	Обновите поле AddressType в dbo.Address данными из табличной переменной. 
	также обновите AddressLine2, если значение в поле NULL - обновите поле 
	данными из AddressLine1
*/

USE AdventureWorks2012;

UPDATE dbo.Address
SET 
	AddressType = tmp.AddressType,
	AddressLine2 = CASE
		WHEN dbo.Address.AddressLine2 IS NULL 
		THEN dbo.Address.AddressLine1 
		ELSE dbo.Address.AddressLine2
	END
FROM @Address tmp
	WHERE tmp.AddressId = dbo.Address.AddressID