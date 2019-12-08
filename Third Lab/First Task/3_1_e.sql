/*
	Удалите поле AddressType из таблицы, удалите все
	созданные ограничения и значения по умолчанию
*/

USE AdventureWorks2012;

ALTER TABLE
    dbo.Address
DROP COLUMN
    AddressType;
ALTER TABLE
    dbo.Address
DROP CONSTRAINT
    AK_Address_PostalCode,
    DF_Address_ModifiedDate