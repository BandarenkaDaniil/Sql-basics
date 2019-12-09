/*
	Удалите данные из dbo.Address, оставив только по одной 
	строке для каждого AddressType с максимальным AddressID
*/

USE AdventureWorks2012;

DELETE
    Address
FROM
    dbo.Address Address, dbo.Address Address1
WHERE
    Address.AddressID < Address1.AddressID AND Address.AddressType = Address1.AddressType 
