/*
	 Напишите Merge выражение, использующее dbo.Address как target, 
	 а временную таблицу как source. Для связи target и source используйте 
	 AddressID. Обновите поля CountryRegionCode и TaxRate, если запись 
	 присутствует в source и target. Если строка присутствует во временной 
	 таблице, но не существует в target, добавьте строку в dbo.Address. 
	 Если в dbo.Address присутствует такая строка, которой не существует
	 во временной таблице, удалите строку из dbo.Address.
*/

USE AdventureWorks2012;

SET IDENTITY_INSERT dbo.Address ON

MERGE
    dbo.Address AS target
    USING #Address AS source
ON (target.AddressID = source.AddressID)
WHEN MATCHED THEN
    UPDATE SET
        CountryRegionCode  = source.CountryRegionCode ,
        TaxRate = source.TaxRate
WHEN NOT MATCHED BY target THEN
    INSERT
    (
        AddressID,
        AddressLine1,
        AddressLine2,
        City,
        StateProvinceID,
		PostalCode,
		ModifiedDate,
		CountryRegionCode,
        TaxRate
    )
    VALUES
    (
        AddressID,
        AddressLine1,
        AddressLine2,
        City,
        StateProvinceID,
		PostalCode,
		ModifiedDate,
		CountryRegionCode,
        TaxRate
    )
WHEN NOT MATCHED BY source 
THEN DELETE;